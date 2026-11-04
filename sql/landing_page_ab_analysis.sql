use mavenfuzzyfactory; 

-- 构建session level分析表
create temporary table sessionly_homepage
select website_session_id, 
min(website_pageview_id) landing_page, 
count(website_pageview_id) page_count
from website_pageviews
group by 1;

create temporary table session_level_bounce
select sh.website_session_id, pageview_url landing_page, page_count, 
s.user_id, s.created_at, s.device_type, 
case when page_count = 1 then 1 else 0 end bounced, 
case when order_id is not null then 1 else 0 end purchased
from sessionly_homepage sh 
join website_pageviews p
on sh.landing_page = p.website_pageview_id
join website_sessions s
on p.website_session_id = s.website_session_id
left join orders o 
on s.website_session_id = o.website_session_id
where website_pageview_id > 23504
and p.created_at < '2012-07-28'
and utm_source = 'gsearch' 
and utm_campaign = 'nonbrand';

-- 检查是否每一行对应唯一session，关键字段是否有缺失
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT website_session_id) AS unique_sessions,
    SUM(user_id IS NULL) AS missing_user_id,
    SUM(landing_page IS NULL) AS missing_landing_page,
    SUM(bounced IS NULL) AS missing_bounced,
    SUM(purchased IS NULL) AS missing_purchased
FROM session_level_bounce;

-- 检查AB组人群使用的landing page是否有交叉，是否有人对应多个session
-- 如果有人对应多个session，但landing page无交叉：
-- 若分析重复访问：在保留原实验分组的前提下，可考虑按用户聚类重抽样估计置信区间。
-- Cluster bootstrap does not randomly reassign users to treatment/control groups.
-- 选择2: 按user分50/50 A/B组，但此时需重新定义bounce rate，区分是首次session的bounce还是对于全部session的bounce
SELECT
    COUNT(*) AS total_users,
    SUM(session_count > 1) AS users_with_multiple_sessions,
    SUM(version_count > 1) AS users_exposed_to_both_versions
FROM (
    SELECT
        user_id,
        COUNT(*) AS session_count,
        COUNT(DISTINCT landing_page) AS version_count
    FROM session_level_bounce
    WHERE user_id IS NOT NULL
    GROUP BY user_id
) u;

-- 检查AB组人群本身的差异（此处为使用设备的差异）
SELECT
    landing_page,
    device_type,
    COUNT(*) AS sessions
FROM session_level_bounce
GROUP BY landing_page, device_type
ORDER BY landing_page, device_type;
