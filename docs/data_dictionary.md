# Data Dictionary

This document summarises the principal fields used in the FIFA World Cup Evolution analytics database.

## tournaments

| Field | Meaning |
|---|---|
| `tournament_id` | Primary key for each World Cup edition. |
| `year` | Tournament year. |
| `host_country` | Host country/countries. |
| `number_of_teams` | Number of participating teams. |
| `number_of_matches` | Tournament match count. |
| `total_attendance` | Tournament-level attendance total where supplied. |
| `champion` | Tournament winner. |
| `runner_up` | Runner-up. |

## matches

| Field | Meaning |
|---|---|
| `match_id` | Match primary key. |
| `tournament_id` | World Cup edition foreign key. |
| `stage_id` | Tournament stage. |
| `venue_id` | Stadium foreign key. |
| `home_team_id`, `away_team_id` | Competing-team foreign keys. |
| `match_date` | Match date. |
| `home_score`, `away_score` | Regulation/recorded match score used in analysis. |
| `home_penalty_score`, `away_penalty_score` | Penalty-shootout scores where applicable. |
| `home_xg`, `away_xg` | Expected-goals fields where available. |

## match_attendance

| Field | Meaning |
|---|---|
| `attendance_id` | Attendance-record key. |
| `match_id` | Match foreign key. |
| `attendance` | Reported match attendance. |
| `available_capacity` | Capacity denominator used for utilisation. |

## venues / tournament_venues

`venues` stores stadium identity, city, country, latitude, longitude and elevation. `tournament_venues` stores the capacity applicable to a particular tournament edition, avoiding the assumption that a stadium has one permanent capacity across all events.

## teams / players / tournament_squads

The football-entity layer stores team identity, FIFA code, confederation, region, player identity and tournament squad membership. Squad rows can also contain club, market value, caps and international goals.

## worldcup_match_events

Event-level table containing match, player, team, event type and minute. It supports discipline and player/team event analysis.

## ticket_demand

Contains ticket requests, tickets available, application days, applicant countries and an `is_lower_bound` flag where the published figure represents a minimum rather than an exact value.

## ticket_prices

Stores ticket price by tournament, stage/match, category, sales phase and USD price.

## ticket_sales

Stores ticket-sales snapshots, sales phase, date and a lower-bound flag.

## tournament_audience

| Field | Meaning |
|---|---|
| `metric_name` | Named audience/digital metric. |
| `audience_value_millions` | Metric value expressed in millions. |
| `measurement_type` | Definition/category of the reported metric. |
| `data_status` | Actual/provisional or other status. |
| `notes` | Source/interpretation context. |

## tournament_financials

Stores World Cup revenue, broadcasting, marketing, ticketing, hospitality, licensing, cost and surplus fields, as well as reporting basis, data status, as-of date and 2026 annual budget components.

The separation between `world_cup_revenue_millions` and `fifa_annual_revenue_budget_millions` is intentional: historical actuals and 2026 budget/provisional data are not assumed to be identical accounting measures.
