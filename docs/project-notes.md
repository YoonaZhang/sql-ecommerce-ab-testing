# Personal project notes

Text extracted from my working notes. Embedded course screenshots and images are not included in this text version.

初始设置

⬅️database schema数据架构⬅️database schema数据架构

⬅️database schema

数据架构

⬅️database schema

数据架构

Analyze traffic resources

所用表

Website_session_id：某个用户单次访问的标识，一个user_id可以对多个website_session_id（同一用户访问多次），一个website_session_id可以对多个website_pageview_id（同次访问多页）

Utm参数：urchin tracking module，是人为添加到URL上的跟踪参数，用于衡量marketing campaign的有效性

Utm_source: Identifies where the link is being shown (a platform, tool, or service). Think of this as who or what sent the visitor to the site. Eg: newsletter/facebook/linkedin/google/bing/youtube/website

Utm_medium: How the link is being shown (the method by which it’s shared). Think of this as how the visitor was sent to the site. Eg: email/paid-social/organic_social/search_ad/display/retargeting/video/print

Utm_campaign: Top-level grouping of promotions, or slogans, to achieve a goal. Eg: ur_blog_24/um_newsletter_24

Utm_content: Details about the content used to differentiate segments or aspects of the campaign. May include details to differentiate between different types of ads (like size of ad, if a headline, or story topic) or content of those ads. Eg: qr_code/ 11_14_23(date)/ test_(a/b testing option). 可能用不同的utm_content代表不同的广告名

http_referer: 通过什么网站才点击到了自己品牌的网站 This field get stamped into the database when our website can recognize the website that sent us the traffic

“？”表示之后的内容都不影响检索，只是for tracking purposes“？”表示之后的内容都不影响检索，只是for tracking purposes

“？”表示之后的内容都不影响检索，只是for tracking purposes

“？”表示之后的内容都不影响检索，只是for tracking purposes

Analyze top traffic sources

概念 – 比较不同的traffic

实操实例

Website_sessions内容：

看流量最大的广告种类

简化语法：

⬅️直接写列名，group by也可以直接写重命名后的变量名⬅️直接写列名，group by也可以直接写重命名后的变量名

⬅️直接写列名，group by也可以直接写重命名后的变量名

⬅️直接写列名，group by也可以直接写重命名后的变量名

Use website sessions data and orders data to size traffic sources, understand how well those traffic sources are converted to orders.

Assignment1: top traffic resources (识别top traffic)

⬅️注意时间⬅️注意时间

⬅️注意时间

⬅️注意时间

结果：

建议：进一步分析gsearch nonbrand

Assignment2: traffic source conversion rate (计算top traffic的转化率)

建议：

Bid optimization & Trend analysis

概念 – 跟踪某个traffic按时间变动的情况 & 比较traffic下不同的subsegments

⬅️括号不用加东西，直接返回现在时间⬅️括号不用加东西，直接返回现在时间

⬅️括号不用加东西，直接返回现在时间

⬅️括号不用加东西，直接返回现在时间

实操实例1: 日期函数

⬅️可以看得更清楚，每周是哪天开始的⬅️可以看得更清楚，每周是哪天开始的

⬅️可以看得更清楚，每周是哪天开始的

⬅️可以看得更清楚，每周是哪天开始的

结果：

实操实例2: Count+case函数，呈现excel透视表的行+列效果

Eg 现在想要看对于primary_product_id为1的产品，有多少人一单只买了这一个，有多少人一单买了多个，对于primary_product_id为2/3/4的产品也这样看

SQL实现：

过程：

先用case when给买了一个/买了两个产品的订单分别打上标签

可以先按每个order分组，则每个order都会在single_order / two_item_order中有一个为1的标签

在此基础上去掉按order分组，只按primary_product分组

Assignment1: traffic source trending (跟踪某个traffic按时间变动的情况)

不select year和week，但也可以按这两个group by不select year和week，但也可以按这两个group by

不select year和week，但也可以按这两个group by

不select year和week，但也可以按这两个group by

结果：

Assignment2: Bid optimization for paid traffic (比较某个traffic下不同device的转化率)

结果

结论：differentiate bid based on device type

Assignment3: trending + granular segments (比较某个traffic下不同device的转化率随时间变化情况)

不再按device_type来group by，相当于行标签只有日期，按日期汇总device_type情况不再按device_type来group by，相当于行标签只有日期，按日期汇总device_type情况

不再按device_type来group by，相当于行标签只有日期，按日期汇总device_type情况

不再按device_type来group by，相当于行标签只有日期，按日期汇总device_type情况

结果：

结论：对于desktop的bid有效

Analyze website performance

所用表

Website_pageviews

Website_sessions

Orders

Analyzing top website pages & entry pages

概念 - 最先点击/最多点击页面

实操实例1: find most-view pages

实操实例2: entry page analysis – create temporary table

代码：

结果：

过程：

1 筛选出每个website_session_id及对应的最早pageview，可以按website_pageview_id顺序筛选或时间顺序筛选

2 由于此处是按website_session_id来group by，无法筛选出website_session_id对应的最早pageview对应的url，所以先把以上筛选出的结果存成temporary table

3 将min(website_pageview_id) 作为键连接原表，select对应的url

也可以进一步group by pageview_url, count website_pageview_id

Assignment1: top website pages

建议：

See if the top website pages need additional work to improve performance

Assignment2: top entry pages

不按session_id来group by的话就只选了第一个pageview_idBy不按session_id来group by的话就只选了第一个pageview_idBy

不按session_id来group by的话就只选了第一个pageview_id

By

不按session_id来group by的话就只选了第一个pageview_id

By

结论

Analyzing bounce rates & landing page tests

概念 - A/B测试landing page

为了测试有没有表现更好的landing page，可以用两个page做A/B test，randomize一些人分别到page A和page B

实操实例: 看每个landing page的转化情况

一个session在进入landing page后就没有继续了：bounce；有后续网页：non-bounce

结果

过程：

1 对于每个session_id，找到最早的pageview_id为landing_page，存成temporary table1

2 对于每个landing_page，找到对应的url，则现在每个session_id对应唯一的landing url，存成temporary table2

3 为了判断每个session_id是否只浏览了landing page，将上述temporary table2与原表连接，则可能会出现temporary table2中唯一的session_id对应原表中多个pageview_id（一对多），count每个session_id对应的pageview_id数量

在此基础上筛选count=1的session_id，只保留bounced session，存成temporary table3

4 此时temporary table3中的session_id只有bounced的，而原表中的session_id包含bounced和non-bounced，所以两表再进行连接，算count(session_id), count(bounced_id)和bounced_rate

Assignment1: calculate bounce rates

1 对于每个session_id，找到最早的pageview_id为landing_page

2 对于每个landing_page，找到对应的url

3 判断每个session_id是否只浏览了landing page

并筛选只浏览了landing page的id

4 连接bounced_session_id和总共的bounced_id

结果

结论

可能的简化思路

1: 在第一步找每个session_id对应的landing_page时，直接把page count也提出来

2 用case when直接在含所有distinct session_id的表中生成一列判断是否为bounced，不再筛选bounced id后再与原表连接

Assignment2: Landing page tests

步骤基本同Assignment1，但要注意筛选条件

第一个landing page为/lander-1的时间和pageview_id:

据此，不能只筛选时间从6-19开始，这一天内也可能包含/lander-1还没有开始使用的情况。需要按pageview_id进行筛选。

结果

结论：新的landing page的bounce rate有所下降

Assignment3: Landing page trend analysis

结果：

结论：fully switch over to lander-1是正确的策略

Building conversion funnels & testing conversion paths – 漏斗分析，每个步骤转化率

实操实例

1 提取出每次浏览所有的url和相应时间，并对每个网页做0/1标记，每条记录至多有一个标记为1

结果

2 对于每次浏览，每个标签提取最大值，则每次浏览如果到了特定步骤就会被提取为1，若没到就为0

结果

补充解释：如果没有到mrfuzzy但到了cart，是因为公司不止一个产品界面

3 计算到达每个页面的人数

4 换成转化率

Assignment1

Assignment2: Analyzing conversion funnel tests

⬆️不用筛选gsearch和nonbrand⬆️不用筛选gsearch和nonbrand

⬆️不用筛选gsearch和nonbrand

⬆️不用筛选gsearch和nonbrand

看转化为订单情况，要用到orders表看转化为订单情况，要用到orders表

看转化为订单情况，要用到orders表

看转化为订单情况，要用到orders表

存疑：用website_pageviews中的/thank-you-for-your-order界面点击来代表下单情况，结果和直接用orders表的不同？

Mid course project

1

2

Insight: Cindy特别关注的是brand campaign→ means someone goes into search engine and explicitly looking for your business. Brand sessions/orders increase dramatically is a good sign

3

Insight: desktop/mobile ratio

→sessions: from the beginning- less than 2/1; at the end- 3/1

→orders: from the beginning- 5/1; at the end- 10/1

4

区分几种流量来源：

Direct traffic (直接流量): Utm_source, utm_campaign, http_referer都没有→使用者记住了你的品牌，直接在浏览器输入你的网址。通常是认识你的忠实客户或品牌粉丝。

Organic traffic (有机流量): Utm_source, utm_campaign没有，http_referer是搜索引擎→使用者有明确的需求或问题，在搜索引擎通过关键词搜到了你，且点击了不是广告页面的结果。

Referral traffic (推荐流量): Utm_source, utm_campaign没有，http_referer是其他普通网站→使用者从其他网站的的自然推荐、引用、友情链接点击进来，不来源于你本身的营销活动。

Paid traffic (付费流量): Utm_source, utm_campaign有→你付钱给平台，他们帮你把网站展示给潜在客户。

→答案把所有utm_source分成了paid traffic, organic traffic和direct traffic几种，以此来比较gsearch和其他traffic的session和order情况

Insight: Particularly pay attention to organic & direct traffic building up. These are traffic that you are not paying for, no additional variable cost for paying for that traffic.

5

6

思路：算出landing_page为home和lander-1分别的转化率，看差值，用转化率差值*test之后的order总收入得到incremental order收入

找出每个session_id对应的landing_page url：

↑起始的筛选条件应为第一个看lander-1的website_pageview_id，不根据日期

算不同landing_page的CVR差异：

算incremental revenue：

↑起始条件应为home page全部转化为lander-1开始的website_pageview_id

因为如果只筛选日期7.28后到11.27前，这段时间里还是会并存从/home来的session和从/lander-1来的session，如果用这些session*incremental CVR，分解开相当于是

/lander-1的转化率*(/home的session+/lander-1的session)- /home的转化率*(/home的session+/lander-1的session)

而实际上应该是(/lander-1的转化率-/home的转化率)*/lander-1的session?

答案只算了incremental orders的数量？

7

思路：沿用每个session_id对应的landing_page表，用于按landing_page划分funnel情况

看每个session_id的转化情况：先给每个pageview_id打标签，然后按session_id汇总

连接landing_page表，分landing_page算每阶段转化率

8

思路：先算出/billing和/billing-2分别的revenue per billing session

Per billing session是pageview表中的session id而不是order表中的：不是每个billing page都会转化为order，如果billing page没有转化为order则order表中没有session id。要看revenue per billing page，相当于也需要看billing page到order的转化率。

再用billing page per session的增量*past month的session

存疑 但是这里past month的billing page中也同时包括/billing page和/billing page-2，如果按第6问的道理的话不是应该筛选全部转化为/billing-2后的节点吗

Analysis for channel portfolio management

Analyze channel portfolios

概念

实操实例

按广告内容划分浏览量

连接orders：

需要关注的点：social_ad_1显著低于其他content，在实际中也可能会遇到类似情况，社交媒体点击量较高，但转化为订单率不高

Assignment1: Analyzing channel portfolios – 比较不同source表现

结果：

结论：gsearch显著高

Assignment2: Comparing channel characteristics – 比较不同source内部特征的流量情况

结果：

Assignment3: Cross-channel bid optimization – 比较不同source及不同设备端的订单转化情况

结果：

结论：bid down b-search

Assignment4: Analyzing channel portfolio trends – 追踪bid optimization后结果

Analyzing direct, brand-driven traffic

概念

实操实例

给unpaid traffic的session分类打上标签：

把每一类分组统计session数量

Bring paid traffic back:（将direct traffic和所有paid traffic做比较）

Direct traffic可以不用管utm参数条件，只要http_referer是null就都是direct

但organic traffic需要同时筛选utm参数和http_referer

Assignment1: Analyzing direct traffic

给每个session分类打标签：

从以上打好标签的表中进行计算

结果：

结论：

organic/direct traffic percent building up, growing faster than nonbrand→good thing

same thing for brand traffic

Analyzing business patterns and seasonality

概念

Weekday：0-6，0为周一

实操实例

Assignment1: Analyzing seasonality

结果：

↑不需要2013年的数据

结论：by month和by week的数据都展现出11月session和销量的高峰，可能与节假日有关，需要据此安排人力和库存

Assignment2: Analyzing business patterns

思路误区：如果直接按weekday来group by，提取出的只能是限定时间范围内所有相同weekday（例如所有周一）的session总数

正确思路1: 想把hr当成列，需要按hour来group by；但在此基础上还要按限定时间范围内包含的每个相同weekday天数来平均（如9.15-11.15这段时间包含7个周一，则在划分每个hour基础上，average session的算法是7个周一的总session/7），则需要引入按天聚合的session数量，才能同时获取几个相同weekday的session总数 & 一共有几个相同weekday

正确思路2: 需要按某些字段分类时，如果是当作行的字段（如此处hr）可以直接group by；如果是当作列的字段（如此处weekday）则需要用case when，效果相当于group by。

底层表

给每一天打上周几的“标签”：行转列

同理可以用case when筛选在这一天对应的weekday列下显示这一天的session数量

则这时再用average，只会聚合此列下不为空的session数量，就自动筛选了这段时间内有几个相同的某weekday

这里的avg(case when wkday=0 then sessions else null end) as mon 列相当于是

Avg(sessions) group by wkday having wkday=0行转过来的

Avg的分母是session的条数

为了美观，限制小数点后一位: round(字段, 1)

结论：整体来看8-17点流量较高，周末流量较低

Product Analysis

Analysing product sales & product launches

概念

Orders表

实操实例

⬅️avg分母：按primary product分类汇总条数⬅️avg分母：按primary product分类汇总条数

⬅️avg分母：按primary product分类汇总条数

⬅️avg分母：按primary product分类汇总条数

Assignment1: Product-level sales analysis

结论：收入和利润都在增长

Assignment2: Analyzing product launches

Revenue per session指总sessionRevenue per session指总session⬅️如果这里是用orders表的日期筛选，则选出的条目只会是有order的，不对⬅️如果这里是用orders表的日期筛选，则选出的条目只会是有order的，不对

Revenue per session指总session

Revenue per session指总session

⬅️如果这里是用orders表的日期筛选，则选出的条目只会是有order的，不对

⬅️如果这里是用orders表的日期筛选，则选出的条目只会是有order的，不对

结论：目前无法判断2013年revenue per session、orders和conversion rate的增长是来源于新产品发行，还是公司持续的增长

Product-level website pathing –按不同产品页面分类，看订单转化

概念

实操实例

第二款产品第二款产品

第二款产品

第二款产品

⬆️不同产品页面浏览情况

不同产品页面到订单的转化：

Assignment1: product-level website pathing

思路：

1 由于是看/product页及其下页的情况，可以先把/product页提出来

2 对于每个/product页，找其下一页

通过>条件，使表连接时只筛选/product之后页面与/product连接的行

此时通过min(pageview)+group by session_id就可以找到/product的next page

3 找到下一页对应的url

4 计数

结果

结论：net impact of adding a new product is likely positive

Assignment2: Building Product-Level Conversion Funnels

2014/4/10的message 时间不应该是2014/1/6到2014/4/10吗？

答案给的起止日期都是2013年，所以不一样

结论：新产品向加购的转化率更强

Cross-selling & product portfolio analysis

概念

所用表：orders和order_items

Orders：

Items_purchased>1: cross sale

order_items：

如果is_primary_item为0，就说明有cross-sell

实操实例

对于join中on键的解释：

由于是left join，首先一定会保留orders表的所有行

其次如果order_items有同时满足1. orders.order_id=order_items.order_id 2. order_items.is_primary_item 两个条件的表，才能把order_items中相应的行连接上，否则就是null

按primary product和cross sale product来group by：

将cross sale每个产品的情况转化成列：

Assignment1: Cross-sell Analysis

指/cart页到下一个/shipping页的转化指/cart页到下一个/shipping页的转化

指/cart页到下一个/shipping页的转化

指/cart页到下一个/shipping页的转化

先pre再post排序先pre再post排序

先pre再post排序

先pre再post排序

结果

结论

Assignment2: Product Portfolio Expansion

结果

结论：increase more ads for the third product

Product refund analysis

概念

所用表

Order_items:

Order_item_refunds:

实操实例

Assignemnt1: analyzing product refund rates

结果

结论：2013.9的initial improvement后refund rate比前期有所下降（就指product1吗？product2倒也没看出来），但2014.8-2014.9 refund rate很高。目前看换了新supplier后2014.10的结果还可以？

User Analysis

Analyzing repeat visit & purchase behavior

概念

实操实例

Assignment1: Identifying repeat visitors

结果

结论

Assignment2: Analyzing time to repeat

结果

结论：下一步可探究repeat users使用的channel

Assignment3: Analyzing repeat channel behavior

结果

结论：大部分repeat sessions来自于organic search和direct type in，即使有一些paid，paid brand也比paid nonbrand便宜。证明对于公司来说想要得到repeat的users不需要再额外投入太多

Assignment4: Analyzing new & repeat conversion rates

结果

结论

Final project

Volume growth

自己解读：We can see that our sessions and orders both grow significantly across quarters. For our sessions, it grows from about 2,000 sessions to about 75,000, which is about 40× than the beginning. You can see that it shows a trend across years. It always which is a low end in the first quarter and a high end in the last quarter. Also, for the first quarter, its reaches 25 times growth. And for the last quarter, it reaches a 2 times growth. And for the orders, it shows a continuous growth across different quarters, the amount at the 4th quarter of 2014 is about 97× to the first quarter of the business.

答案解读：What we've got here now that we're at the end of the 3 year run of this business, we can see some pretty dramatic growth. When you look at the 60 orders from the first quarter, we're now at about 100 times that many orders. And similar large growth in session volume, not quite the same, but it's been pretty impressive.

Also, as she noted, this is an incomplete quarter. So the ways that we could handle that, as an analyst, we could say, limit to just up until the 4th quarter of 2014. We could also try to project those sessions and orders out to the end of Q1. Either way you wanted to handle that is great. This is just the raw data free to handle that way. Either of those solutions is a great way to handle the data.

Efficiency improvements

自己解读：Second, we show our efficiency growth. We can see our session to order conversion rate and the revenue per session continuously grow from the start of the company to the end of the fourth quarter of 2014, the session to order conversion rate grows 2× compares to the beginning, and the revenue per session grows 3 times. For the revenue per order, the amount remain stable in 2012. This is because the business only focuses on one product until 2013. And from then on, it launches the second product, which attracts a growth in revenue per order. This proves the profitability of the second products. In 2014, it achieves another significance growth. This might due to the joint efforts of launching the third products and the company’s continuous operating growth. At the time of launching the third products, it achieves a remarkable increase in the session to order conversion rates, average order value, and also revenue per session. Therefore, we also increase more ads for the third products. This might further increase the revenue growth in turn.

答案解读：Here we've got a pretty similar story to when we were talking about session growth. It's just a great story for the business where we've gone from session to order conversion rates around 3% to up over 7 to 8% in the most current quarter. And revenue per order has gone from a flat $49.99 back when the company only sold one product to starting to do some cross sell and then really optimizing and now getting that revenue per order up above $60. Then we have the revenue per session which initially was around $1.59, now has gotten all the way up to over $5 in the most recent quarter.

So that metric revenue per session is really important, because it impacts how much your marketing director Tom is gonna be able to spend to acquire traffic. And the higher he can bid, the more traffic you're gonna win because you're gonna be higher in the auctions, people will see your ads more. So as you get more efficient, you'll be able to get more volume. So when we optimize a business like we've done in this course, it makes everything more competitive. Your website is better, you sell products in a better way, you then are able to go to market and compete better in these auctions, you can get more volume. And all of these are ways that analysts helping you to figure out how you can improve your efficiency and increase your business objectives. It's just really gonna help the business. And I think looking at these trends through the life for the business, which we just walked through, you can really see the impact that quantitative person helping to steer the business using data can have.

解读：revenue per session是一个重要的效率指标，代表用户浏览一次网站平均能带来多少收入。这也会影响到公司愿意投入多少成本在广告位上。

公司投入更多成本（导致页面排名靠前，用户更容易浏览到）+改进网页页面、改进产品销售方式（如交叉销售、销售新产品、增加订单页面等）=反过来再促进revenue per session

Channel growth

自己解读：Next, we examine the orders by channel to see how our various channels grow. We can see that we have gsearch nonbrand, bsearch nonbrand, brand search, organic search and direct type in search. All channels grow significantly across quarters. The largest channel is the gsearch nonbrand, and the second large is bresearch nonbrand. We can also see that the portion of the organic search and direct type in search to the paid channels is increasing across years. This is a positive signal of the company's operation. Because this means the brand's awareness is increasing, and there are more demands directly for our products and our brands.

答案解读： No surprise here, we just see tremendous growth in all of these channels. I think what the potential investors would be particularly excited about is brand search really picking up, organic search really picking up and direct type-in. So we've gone from a place where let's say back in Q2 of 2012, we had almost 300 g-search non-brand orders, and we had a total of, it looks like 56 across these three channels, so call it 6 to 1 was your ratio. And here we've got about 1,800 orders in Q1 2025 from these three channels, brand, organic and direct. So 1,800 compared to 3,000. So that's less than a 2 to 1 ratio compared to back in Q2 when it was 6 to 1.

So think about that. The business has become much less dependent on these paid g-search non-brand campaigns and is starting to really build its own brand organic and direct type in traffic, which has better margin and takes you out of the dependency of this search engine. Investors are gonna love to see that the growth in general is great, and especially the growth in some of these independent brand channels that shows the health of the brand.

CVR growth by channel

自己解读：When we analyze our session to order conversion rate by channel, we can also see that generally, all channels show a conversion rate growth across quarters. However, this time we can see the brand traffic, organic traffic and direct type type in channel conversion rate are higher than the nonbrands channel, which is different from amount of the orders. The bsearch nonbrand was added at the end of August. So the conversion rates for bsearch nonbrands in the first two quarters of 2012 is 0. The company bids down gsearch nonbrand channel in the second quarter of 2012, and bids down the bsearch nonbrand channel in the last quarter of 2012. This might lead to more session to order conversion rates in other channels.

答案解读：We see what we're working with here, the g-search non-brand conversion rate, that's come up from 3.2%, 2.8% to well over 8% in the most recent quarter, which is just fantastic. You're getting a lot more for the same traffic within g-search non-brand, more than doubling conversion rate. Similar story with b-research, which we weren't running non-brand originally. And we've really been able to increase that. Similar thing for all of our direct channels, too. So brand search, organic search and direct type-in, all of these have seen substantial improvements from where they were initially to where they are. Now, these efficiency improvements are really going to impress investors. And it shows that the company knows what they're doing and they're striving to improve the business all the time. And it's just this nice steady growth here. Again, a lot of that growth is fueled and directly influenced by a great analyst who can help steer the company in the right direction.

Monthly trend by product

自己解读：Generally, we can see seasonal patterns for each of the products. But because the product 3 and product 4 have been launched about just 1 year, we cannot verify the increase of monthly revenue and margin are because the operational growth or seasonality. For a product 1 and 2, the revenue and margins both remain low in the first quarter and reach the peak in the last quarter of a year. The difference between these two products is mainly in February, when product 1’s revenue and margin are in a low end, whereas product 2’s revenue and margin achieved an irregular spike.

答案解读：So we see the Mr fuzzy revenue originally around $3,000 per month. Here we've got it to 43,000 in this partial month in March and 55,000 in the previous month. We even saw some really high months around October and December for that bear. In the 72000 and 79000 range, if you look back in previous years, we see month 11 month 12. Same thing here. We see these as pretty strong months, and then it kind of drops off a little bit. Let's see. Same thing here. We see a big pop in month 11 and month 12. Most US Students will recognize the holiday season as being really good for online retail. If you're taking this course and you're outside of the United States, that might not have been as obvious to you. And that's totally ok, we wouldn't expect you to understand the seasonality for this in the United States. But basically there's a rush leading up to the holiday season at the end of the year, and we see that repeated each time here.

When we look at the love bear revenue, we can see what kind of trends we have here. It looks like there is a major pop in February, and same thing here, February of 2014 and February of 2015 as well. So this probably makes sense to a lot of people as well. This bear was targeted to couples for giving to one another as a gift. So we see a large spike in revenue around the Valentine's Day holiday.

And with the birthday bear, we may see some similar trends with a spike at the end of the year. It's a little hard to tell because we don't have as much data to understand seasonality, but it does look like there's a little bit of a pop here at the end of the year. Same thing with the mini bear. It looks like there's a little bit of a pop, but then also this month (2015 Jan) looks very strong as well. So again, we don't have as much data. So it's a little hard to tell.

Product conversion funnel improvement

答案代码：三个表一起join

From the monthly product sessions and the conversion rates, we can clearly figure out the impact of launching products, 2, 3, and 4. Product 2 brings the most significant conversion growth, where the click through rate from product page to another page grows about 4.6% and the conversion rates from products to orders increases 1.5%. The launch of the third products and the fourth products brings 4.7% and 2.5% growth of the conversion rates from product page to another page separately. And both of the products bring 0.8% growth of the products to orders conversion rates.

答案解读：What we see here, we've got here a month and then the session hitting there, clicking to next page, the click through rate and the product to order version rate. I think the main thing to call out other than just the general growth in the sessions making it to the product page is the click through rate going up from around 71% at the beginning of the business to 85% in the most recent month. And similarly the rate of people seeing the product page and then converting to a full paying order has gone up from 8%, 6%, 7% to all the way up to around 14% in the most recent months. So all of these improvements that the business has made, adding additional products that may appeal better to other people, bringing in a product at a lower price point. These stuff has really impacted the percentage of people that are clicking through on the product page in a positive way. And similarly, it's really impacted the conversion rate to an order from the product page. So it seems like these changes have been very positive and are helping to contribute to the health of the business.

Cross-sell analysis

自己解读：After we made our product 4 available for the primary product, it is still the one that is most likely to be cross-sold with another product. In the orders where product 4 is the primary product, the most popular cross sell product is the product 3.

词汇积累

Go from .. to .. 从..增长到..

Get x to/over/ above .. 某项增长到/到超过..

Get all the way up to 增长到..

Up above/ up over: 超过

See/have seen/there’s 和峰值/上升/下降等状态搭配

substantial improvement 巨大增长

A rush 急剧上升

A big pop/ a major pop/ a large spike 一个高峰

Drop off 下降

From where they were initially to where they are 从开始到现在

In the x and y range 在x到y的区间范围内

Lead up to xx 临近xx的时候

Be targeted to 针对

we don't have as much data
