/*
 FIFA World Cup Analytics | Core Analysis Queries
 PostgreSQL

 The queries below use the real project schema contained in
 database/fifa_world_cup_database(1994 - 2026).sql.
*/

-- ============================================================
-- 1. TOURNAMENT ATTENDANCE PERFORMANCE
-- ============================================================
SELECT
    t.year,
    COUNT(m.match_id) AS total_matches,
    SUM(ma.attendance) AS total_attendance,
    ROUND(AVG(ma.attendance)) AS avg_attendance
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
JOIN match_attendance ma
    ON ma.match_id = m.match_id
GROUP BY t.year
ORDER BY t.year;

-- ============================================================
-- 2. CAPACITY UTILISATION BY TOURNAMENT
-- Weighted utilisation = total attendance / total available capacity.
-- ============================================================
SELECT
    t.year,
    SUM(ma.attendance) AS total_attendance,
    SUM(ma.available_capacity) AS total_available_capacity,
    ROUND(
        SUM(ma.attendance) * 100.0 /
        NULLIF(SUM(ma.available_capacity), 0),
        2
    ) AS capacity_utilization_pct
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
JOIN match_attendance ma
    ON ma.match_id = m.match_id
GROUP BY t.year
ORDER BY t.year;

-- ============================================================
-- 3. GOALS PER MATCH BY TOURNAMENT
-- ============================================================
SELECT
    t.year,
    COUNT(m.match_id) AS total_matches,
    SUM(m.home_score + m.away_score) AS total_goals,
    ROUND(
        SUM(m.home_score + m.away_score) * 1.0 /
        NULLIF(COUNT(m.match_id), 0),
        2
    ) AS goals_per_match
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
GROUP BY t.year
ORDER BY t.year;

-- ============================================================
-- 4. TOP VENUES BY AVERAGE ATTENDANCE
-- ============================================================
SELECT
    v.stadium_name,
    v.city,
    ROUND(AVG(ma.attendance)) AS avg_attendance,
    COUNT(m.match_id) AS matches_hosted
FROM venues v
JOIN matches m
    ON m.venue_id = v.venue_id
JOIN match_attendance ma
    ON ma.match_id = m.match_id
GROUP BY v.stadium_name, v.city
ORDER BY avg_attendance DESC
LIMIT 10;

-- ============================================================
-- 5. FINANCIAL PERFORMANCE VIEW
-- Uses the analysis-ready database view built for Power BI.
-- ============================================================
SELECT *
FROM vw_financial_performance
ORDER BY year;

-- ============================================================
-- 6. AUDIENCE PERFORMANCE VIEW
-- ============================================================
SELECT *
FROM vw_audience_performance
ORDER BY year, metric_name;
