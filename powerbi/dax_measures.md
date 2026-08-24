# Power BI DAX Measure Patterns

Representative DAX patterns used in the report.

## World Cup surplus

```DAX
World Cup Surplus =
[Financial Revenue Display] - [World Cup Cost]
```

## Digital / video reach display

```DAX
Digital Reach / Video Views =
VAR SelectedYear = SELECTEDVALUE(Dim_Tournament[Year])
RETURN
SWITCH(
    TRUE(),
    SelectedYear = 2022,
        CALCULATE(
            SUM(Audience_Performance[audience_value_millions]),
            Audience_Performance[metric_name] = "Digital / Streaming Reach"
        ) * 1000000,
    SelectedYear = 2026,
        CALCULATE(
            SUM(Audience_Performance[audience_value_millions]),
            Audience_Performance[metric_name] = "Video views"
        ) * 1000000,
    BLANK()
)
```

## Previous-valid-tournament comparison pattern

```DAX
World Cup Cost Comparison =
VAR CurrentYear = SELECTEDVALUE(Dim_Tournament[Year])
VAR PriorYear =
    MAXX(
        FILTER(
            ALL(Dim_Tournament[Year]),
            Dim_Tournament[Year] < CurrentYear &&
            NOT ISBLANK(CALCULATE([World Cup Cost]))
        ),
        Dim_Tournament[Year]
    )
VAR PriorValue =
    CALCULATE(
        [World Cup Cost],
        REMOVEFILTERS(Dim_Tournament[Year]),
        Dim_Tournament[Year] = PriorYear
    )
VAR ChangePct = DIVIDE([World Cup Cost] - PriorValue, PriorValue)
RETURN
IF(
    ISBLANK(PriorValue),
    "Baseline",
    FORMAT(ChangePct, "+0.00%;-0.00%;0.00%") & " vs Previous"
)
```

The same pattern was adapted for revenue, surplus, audience, digital/video and social metrics. The logic searches for the latest prior tournament with a valid observation instead of assuming every metric exists for every edition.

## Why this matters

- The first valid observation becomes a **Baseline**.
- Missing historical digital metrics stay blank.
- Previous-tournament comparisons remain valid even when a metric is sparse.
- Cost increases can be conditionally formatted differently from positive revenue/engagement growth.
