# FIFA World Cup Evolution: Evaluating Tournament Success from 1994 to 2026

> An end-to-end PostgreSQL, SQL and Power BI analytics project examining how the modern FIFA World Cup evolved in scale, stadium demand, sporting performance, commercial performance and global reach.

## Project origin

This project started with a sitting-room argument while the 2026 FIFA World Cup was underway.

The debate was simple: **was the 2026 World Cup genuinely a poor tournament, or did the data tell a different story?**

Instead of continuing from opinions, I converted the argument into an analytical problem. I researched the evidence, built a relational PostgreSQL database, cleaned and validated the data, wrote SQL analysis and reporting views, created DAX comparison measures and built a four-page Power BI report.

## Central analytical question

**How has the modern FIFA World Cup evolved since USA 1994, and was the 2026 tournament genuinely successful for both FIFA and football fans?**

## Why 1994–2026?

The original concept covered every World Cup from 1930. The final comparison begins in 1994 because the modern period provides stronger and more comparable evidence for attendance, stadium capacity, commercial performance and global audience measures. USA 1994 also provides a natural North American benchmark for the Canada–Mexico–United States 2026 edition.

## Technology stack

`PostgreSQL` `SQL` `Power BI` `DAX` `Relational Data Modelling` `Data Cleaning` `Data Validation` `Business Intelligence` `Data Visualisation` `Analytical Storytelling`

## End-to-end workflow

1. Defined the analytical problem, scope and success framework.
2. Collected tournament, match, stadium, attendance, sporting, ticketing, financial and audience evidence.
3. Built a relational PostgreSQL database.
4. Standardised identifiers, names, tournament years and measurement definitions.
5. Corrected historical stadium-capacity mappings and audited utilisation denominators.
6. Validated relationships, missing values, duplicate risks and reporting status using SQL.
7. Built analytical SQL queries and database views.
8. Connected the validated data to Power BI.
9. Created DAX measures for dynamic KPIs, baseline handling and previous-valid-tournament comparison.
10. Built four interactive dashboard pages and produced the final evidence-based verdict.

## Database

The repository includes the **complete PostgreSQL database dump** used for the project:

[`database/fifa_world_cup_database(1994 - 2026).sql`](database/fifa_world_cup_database(1994%20-%202026).sql)

The database contains **16 physical tables and 9 analytical views**, including tournament, match, attendance, venue, team, player, squad, ticketing, financial and audience layers.

See:
- [Database restoration guide](database/README.md)
- [Data model](docs/data_model.md)
- [Data dictionary](docs/data_dictionary.md)

## SQL analysis

The SQL folder contains both core and advanced analytical work:

- [Core analysis queries](sql/analysis_queries.sql)
- [Data-quality validation](sql/01_data_quality_validation.sql)
- [Tournament growth & previous-edition comparison](sql/02_growth_comparison_analysis.sql)
- [Sporting & venue analysis](sql/03_sporting_venue_analysis.sql)
- [Financial, audience & ticket-demand analysis](sql/04_financial_audience_analysis.sql)

Techniques demonstrated include multi-table JOINs, aggregation, calculated metrics, FILTER, CTEs, window functions (`LAG`), NULL-safe division, exception auditing and analytical views.

## Power BI report

The interactive Power BI file is included in the repository:

[`powerbi/FIFA_World_Cup_Evolution_1994_2026.pbix`](powerbi/FIFA_World_Cup_Evolution_1994_2026.pbix)

The report contains four pages:

### 1. Growth & Global Impact
Tournament expansion, teams, matches, total attendance, average attendance and stadium capacity utilisation.

### 2. Growth & Comparisons
Previous-edition growth and historical benchmarking so record totals are not interpreted without tournament-size context.

### 3. Sporting & Venue Performance
Goals, goals per match, drawn matches, winning margins, discipline and high-attendance venues.

### 4. Financial & Global Reach
World Cup cost, revenue/budget, projected surplus, revenue mix, audience/engagement, video views and social-media impressions.

Representative DAX logic is documented in [powerbi/dax_measures.md](powerbi/dax_measures.md).

## Key 2026 findings

| Metric | 2026 result | Interpretation |
|---|---:|---|
| Teams | 48 | +50.0% vs 2022 |
| Matches | 104 | +62.5% vs 2022 |
| Total attendance | ~7.0M | Approximately double 2022 in the completed dataset |
| Average attendance | ~65K | Strong per-match demand, not only more fixtures |
| Capacity utilisation | 99.74% | Near-full stadium utilisation |
| Goals | 308 | 2.96 per match |
| World Cup cost | $3.76bn | 2026 budget/provisional basis |
| Revenue / budget | $8.91bn | 2026 budget/provisional basis |
| Projected surplus | $5.16bn | Analytical revenue/budget less cost |
| Audience / engagement | 5.20bn | Reported engagement measure |
| Digital / video views | 20.00bn | Reported digital/video measure |
| Social impressions | 30.00bn | Reported social-media measure |

## Key analytical insight

The strongest finding is that the 2026 attendance record cannot be explained by tournament expansion alone.

More matches naturally create more opportunities to accumulate attendance. However, **average attendance also increased materially and capacity utilisation reached 99.74%**. Tournament scale and genuine stadium demand therefore increased together.

## Final verdict

**The measurable performance evidence does not support describing the 2026 FIFA World Cup as a poor tournament overall.**

The evidence supports strong performance in:

- structural scale;
- stadium demand;
- sporting output;
- commercial potential; and
- global/digital engagement.

This does not prove that every supporter had a positive experience. Comparable historical evidence for ticket affordability, travel burden, visa accessibility and subjective fan satisfaction is less complete, so those criticisms are kept separate from the core performance verdict.

## Project report

The full written analytical report is available here:

[`report/FIFA_World_Cup_Evolution_1994_2026_Report.pdf`](report/FIFA_World_Cup_Evolution_1994_2026_Report.pdf)

It documents the project origin, database build, cleaning and validation, SQL workflow, Power BI model, findings, limitations and final conclusion.

## Documentation

- [Methodology](docs/methodology.md)
- [Data model](docs/data_model.md)
- [Data dictionary](docs/data_dictionary.md)
- [Key findings](docs/key_findings.md)
- [Limitations](docs/limitations.md)
- [DAX measures](powerbi/dax_measures.md)

## Reproducibility

A technical reviewer can reproduce the analytical environment by restoring the SQL dump into PostgreSQL and running the SQL scripts in this repository. The PBIX file is also provided for inspection of the semantic model, DAX and final dashboard design.

## Data and rights note

Underlying FIFA/tournament facts remain attributable to their respective original data sources. The repository documents the project's original database compilation, transformations, SQL analysis, model design, dashboard construction and analytical interpretation.

---

**Project & analysis: Ibraheem Ibraheem (Bleezysmart)**  
**2026**
