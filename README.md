# SQL E-commerce Analysis and Landing-page A/B Test

An e-commerce analytics learning project using the Maven Fuzzy Factory course dataset, extended with a retrospective statistical analysis of historical landing-page A/B data.

## Analysis

The original SQL work examines traffic sources, conversion funnels and repeat visits. The A/B extension joins sessions, pageviews and orders to build a session-level analysis table, checks session uniqueness and cross-version exposure, and compares bounce and purchase-conversion rates.

## Materials

- [SQL dataset construction and checks](sql/landing_page_ab_analysis.sql)
- [Python statistical analysis](notebooks/landing_page_statistical_analysis.ipynb)
- [Metric definitions and saved results](docs/analysis-summary.md)
- [Personal SQL project notes](docs/project-notes.md)

## Current version

The CSV aggregates have been checked against the saved notebook outputs. The notebook preserves those outputs, but its saved source still needs definitions for `n_a`, `n_b`, `bounce_a` and `bounce_b` before it can run from a fresh kernel. This is a working portfolio version; it has not been re-executed as a reproducible package.

This is analysis of an existing educational dataset. I did not operate the original live experiment, assign its traffic or preregister its metrics and sample size. No causal mechanism or statistically significant purchase lift is claimed from the bounce-rate result alone.

## Data and attribution

Course context: Maven Analytics' Advanced SQL / MySQL e-commerce analysis project. Personal extension: the session-level SQL checks and Python hypothesis tests and confidence intervals presented here. Official course solution files, database dumps and raw datasets are not redistributed. A local `data/session_level_analysis.csv` is excluded by `.gitignore`.

The notebook reads `../data/session_level_analysis.csv` when launched from the `notebooks` folder.
