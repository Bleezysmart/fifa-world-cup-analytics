# FIFA World Cup Evolution: Evaluating Tournament Success from 1994 to 2026

> An end-to-end PostgreSQL, SQL and Power BI analytics project examining how the modern FIFA World Cup evolved in scale, stadium demand, sporting performance, commercial performance and global reach.

## The story behind the project

This project started with a sitting-room argument while the 2026 FIFA World Cup was underway.

The debate was simple: **was the 2026 World Cup actually a poor tournament, or did the data tell a different story?**

Rather than continue arguing from opinions, I turned the question into a data project. I researched the evidence, built a relational PostgreSQL database, cleaned and validated the data, wrote SQL queries and analytical views, created comparison measures in DAX and developed a four-page Power BI report.

## Central analytical question

**How has the modern FIFA World Cup evolved since USA 1994, and was the 2026 tournament genuinely successful for both FIFA and football fans?**

## Why the analysis begins in 1994

The original idea covered every World Cup from 1930. I narrowed the final scope to 1994–2026 because the modern period provides stronger and more comparable evidence for attendance, stadium capacity, commercial performance and global audience metrics.

The period also creates a useful comparison between **USA 1994** and the **Canada–Mexico–United States 2026** edition.

## Tools used

- PostgreSQL
- SQL
- Power BI
- DAX
- Relational data modelling
- Data cleaning and validation
- Data visualisation
- Analytical storytelling

## Project workflow

1. Defined the analytical problem and success framework.
2. Collected tournament, match, venue, attendance, sporting, financial and audience evidence from multiple sources.
3. Built a relational PostgreSQL database.
4. Standardised keys, venue names, tournament years and reporting definitions.
5. Corrected historical stadium-capacity mappings and validated utilisation denominators.
6. Used SQL joins, aggregations, calculations and validation queries to create analysis-ready outputs.
7. Connected the validated model to Power BI.
8. Created DAX measures for selected-year KPIs and previous-tournament comparisons.
9. Built four interactive dashboard pages.
10. Interpreted the results and answered the original question using the available evidence.

## Final dashboard structure

### 1. Growth & Global Impact
Tracks tournament expansion, total attendance, average attendance and stadium capacity utilisation from 1994 to 2026.

### 2. Growth & Comparisons
Compares the selected tournament with the previous edition and historical benchmarks.

### 3. Sporting & Venue Performance
Examines goals, goals per match, drawn matches, winning margins, discipline and top venues by average attendance.

### 4. Financial & Global Reach
Examines World Cup cost, revenue/budget, projected surplus, revenue mix and modern audience/digital engagement metrics.

## Key 2026 findings

| Metric | 2026 result | Interpretation |
|---|---:|---|
| Teams | 48 | +50.0% vs 2022 |
| Matches | 104 | +62.5% vs 2022 |
| Total attendance | ~7.0M | ~100.1% higher than 2022 |
| Average attendance | ~65K | Stronger per-match demand, not only more fixtures |
| Capacity utilisation | 99.74% | Near-full stadium utilisation |
| Goals | 308 | 2.96 goals per match |
| World Cup cost | $3.76bn | 2026 budget/provisional basis |
| Revenue / budget | $8.91bn | 2026 budget/provisional basis |
| Projected surplus | $5.16bn | Revenue/budget less World Cup cost |
| Audience / engagement | 5.20bn | Reported engagement measure |
| Digital / video views | 20.00bn | Reported digital/video measure |
| Social impressions | 30.00bn | Reported social-media measure |

## Key analytical insight

The strongest finding is that the 2026 attendance record cannot be explained by tournament expansion alone.

More matches naturally increase total attendance, but **average attendance also increased materially and stadium capacity utilisation reached 99.74%**. This indicates that tournament scale and genuine stadium demand increased together.

## Final verdict

**The available performance data does not support describing the 2026 FIFA World Cup as a poor tournament overall.**

The evidence supports a strong tournament in terms of:

- structural scale;
- stadium demand;
- sporting output;
- commercial potential; and
- global/digital engagement.

However, this does **not** prove that every supporter experienced the tournament positively. Comparable historical evidence for ticket affordability, travel burden, visa accessibility and subjective fan experience is less complete, so those criticisms should be treated separately from the core performance verdict.

## Important data limitations

- 2026 financial values used in the dashboard are budget/provisional rather than final audited World Cup actuals.
- The projected surplus is an analytical calculation, not certified accounting profit.
- Digital views, impressions, reach and engagement are different measures and are not unique-audience counts.
- Missing historical digital metrics remain blank rather than being replaced with zero.
- Attendance and listed stadium capacity may occasionally use slightly different reporting definitions.

## Repository structure

```text
fifa-world-cup-analytics/
├── README.md
├── sql/
│   ├── analysis_queries.sql
│   └── capacity_validation.sql
└── docs/
    ├── data_model.md
    └── methodology.md
```

Dashboard screenshots, the Power BI file and the full PDF project report will be added as project assets.

## Skills demonstrated

`PostgreSQL` `SQL` `JOINs` `GROUP BY` `Aggregations` `Data Validation` `Relational Databases` `Power BI` `DAX` `Data Modelling` `Business Intelligence` `Data Storytelling`

---

**Project by Ibraheem Ibraheem (Bleezysmart)**
