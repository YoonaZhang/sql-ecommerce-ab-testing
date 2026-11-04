# Landing-page analysis summary

## Question and cohort

Compare engagement and purchasing between `/home` and `/lander-1` for the historical gsearch / nonbrand cohort selected in the SQL file. The query uses first-pageview ID > 23504 and landing-page timestamp before 2012-07-28. This is a retrospective definition, not a prospective experiment protocol.

## Metrics

- Bounce rate: sessions with exactly one pageview / eligible sessions.
- Purchase conversion: sessions with an associated order / eligible sessions.
- Quality checks: unique sessions, missing key fields, repeat users, exposure to both versions, device composition and sample-ratio mismatch (assuming 50/50 allocation).

The observed sample contains 4,576 unique sessions and 4,576 unique users, with no cross-version users in this selected dataset. A session-level analysis is used.

## Saved results

| Measure | /home | /lander-1 |
| --- | ---: | ---: |
| Sessions | 2,261 | 2,315 |
| Bounced sessions | 1,319 | 1,232 |
| Purchased sessions | 72 | 94 |
| Bounce rate | 58.34% | 53.22% |
| Purchase conversion | 3.18% | 4.06% |

Methods: chi-square sample-ratio check; two-sided two-proportion z-tests; Newcombe 95% confidence intervals for the B-minus-A difference.

- SRM p-value: 0.4247; no statistically significant mismatch detected under the assumed 50/50 split. This does not by itself prove random assignment.
- Bounce difference: -5.12 percentage points; 95% CI [-7.98, -2.24]; p = 0.000491.
- Purchase-conversion difference: +0.88 percentage points; 95% CI [-0.21, 1.97]; p = 0.113056.

## Interpretation

The saved analysis supports a lower bounce rate for `/lander-1`. Purchase conversion is numerically higher, but the evidence is insufficient to conclude an increase at the 5% significance level. The purchase interval also does not establish equivalence or an absence of harm. A business rollout decision would need the original assignment information, decision thresholds and adequate evidence for the intended business outcome.

These are existing saved results; no additional live test, sample-size plan or follow-up experiment has been completed in this portfolio version.
