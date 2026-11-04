# SQL E-commerce Analysis and Landing-page A/B Test

A retrospective analysis of historical landing-page experiment data from the Maven Fuzzy Factory educational dataset.

## Main notebook

[Open the consolidated SQL and A/B analysis notebook](notebooks/landing_page_statistical_analysis.ipynb)

The notebook contains the full workflow: metric definitions, MySQL extraction, session-level quality checks, descriptive summaries, a sample-ratio check, two-proportion tests, confidence intervals and interpretation. The SQL is included as a MySQL step, followed by Python analysis of its CSV export.

## Supporting material

- [Standalone MySQL extraction and checks](sql/landing_page_ab_analysis.sql)
- [Metric definitions and results](docs/analysis-summary.md)
- [Data schema](data/schema.csv)

## Findings

The alternative page has a lower observed bounce rate. Purchase conversion is numerically higher, but the evidence does not establish an increase at the 5% significance level. The notebook distinguishes the two findings.

## Data and attribution

This project analyzes an existing Maven Analytics educational dataset; I did not launch or assign traffic for the original live experiment. Personal extensions include session-level checks and Python hypothesis tests and confidence intervals. Course solution files, database dumps and raw datasets are not redistributed. The local CSV belongs in the ignored `data` folder.
