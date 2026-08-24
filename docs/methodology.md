# Methodology

## Analytical objective

The project evaluates FIFA World Cup evolution from 1994–2026 across four dimensions:

1. Tournament growth and scale
2. Attendance and venue utilisation
3. Sporting performance
4. Financial performance and global reach

The objective was not simply to find record totals. Tournament expansion creates more teams and matches, so the analysis also uses rate-based measures such as average attendance, capacity utilisation and goals per match.

## Data preparation

Data was collected from multiple historical and modern sources and organised into a relational PostgreSQL model. Preparation included:

- standardising tournament years and identifiers;
- connecting tournaments, matches, venues and attendance records through keys;
- checking missing and duplicate records;
- standardising venue naming;
- validating stadium-capacity mappings;
- reviewing reporting definitions before comparing metrics across editions; and
- preserving genuinely unavailable historical values as missing rather than treating them as zero.

## SQL analysis

PostgreSQL was used to validate and aggregate the underlying data before reporting. Core techniques included:

- INNER and LEFT JOINs;
- COUNT, SUM and AVG;
- GROUP BY;
- calculated metrics;
- NULL handling;
- ordering and ranking; and
- cross-table validation.

## Power BI model

The validated analytical data was loaded into Power BI. DAX measures were created for selected-tournament KPIs and comparison measures.

The first available tournament for a metric acts as its baseline. Later editions are compared with the previous tournament where comparable evidence exists.

Historical digital metrics were not manufactured for tournaments where the underlying evidence was unavailable.

## Interpretation principles

### Total vs rate metrics

Record total attendance alone does not demonstrate stronger demand because a tournament with more matches has more opportunities to accumulate spectators. Average attendance and capacity utilisation therefore provide essential context.

### Financial figures

2026 financial figures are budget/provisional values. They are labelled accordingly and should not be interpreted as final audited tournament actuals.

### Digital metrics

Views, impressions, reach and engagement can involve repeated interactions. They should not be interpreted as unique people unless the underlying source explicitly defines them that way.

## Final evaluation

The final verdict combines evidence across scale, attendance efficiency, sporting output, commercial potential and global engagement while explicitly separating questions the dataset cannot answer reliably, such as subjective fan experience and fully comparable historical affordability.
