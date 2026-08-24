# Data Model

The project database contains **16 physical tables** and **9 analytical views**.

## Core relational model

```text
Tournaments
 ├── Matches
 │    ├── Match Attendance
 │    ├── World Cup Match Events
 │    ├── Stages
 │    ├── Venues
 │    └── Teams (home / away)
 ├── Tournament Venues ── Venues
 ├── Tournament Squads ── Teams / Players
 ├── Tournament Financials
 ├── Tournament Audience
 ├── Ticket Demand
 ├── Ticket Prices
 └── Ticket Sales
```

## Main tables

| Table | Analytical role |
|---|---|
| `tournaments` | One row per World Cup edition, including year, host, teams, matches, attendance and finalists. |
| `matches` | Match-level results, stage, venue, teams, date, penalties and xG fields. |
| `match_attendance` | Match attendance and available-capacity denominator. |
| `venues` | Stadium identity, city, country and geographic attributes. |
| `tournament_venues` | Tournament-era capacity by venue, allowing stadium capacity to vary by edition. |
| `teams` | Team identity, FIFA code, confederation and region. |
| `players` | Player identity. |
| `tournament_squads` | Tournament/player/team bridge with club, value, caps and international goals. |
| `stages` | Tournament-stage dimension and stage order. |
| `worldcup_match_events` | Match-event table used for goals/cards and player/team event analysis. |
| `ticket_demand` | Ticket requests, availability, application window and applicant-country metrics. |
| `ticket_prices` | Ticket price by tournament, stage, match, category and sales phase. |
| `ticket_sales` | Ticket-sales snapshots and lower-bound flags. |
| `tournament_audience` | Audience/digital metrics stored in long format with measurement type and status. |
| `tournament_financials` | Revenue, cost, surplus, reporting basis, data status and 2026 budget fields. |
| `staging_2026_appearances` | 2026 appearance staging data retained as a source/staging layer. |

## Analytical views

The database also contains nine reporting views:

- `vw_audience_performance`
- `vw_financial_performance`
- `vw_host_footprint`
- `vw_sporting_performance`
- `vw_stadium_performance`
- `vw_ticket_demand`
- `vw_ticket_prices`
- `vw_ticket_sales`
- `vw_tournament_summary`

These views simplify Power BI consumption and keep repeated business logic in the database layer.

## Key modelling decisions

- Tournament-year comparison is driven from `tournaments`.
- Attendance is kept at match grain and aggregated when tournament KPIs are required.
- Capacity utilisation uses total attendance divided by total available capacity rather than averaging match-level percentages.
- Tournament-era venue capacity is stored separately from permanent venue identity.
- Audience data is kept in long format because metric definitions differ across editions.
- Financial rows retain reporting status/basis so budget and provisional figures are not silently treated as audited actuals.
