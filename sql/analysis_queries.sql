/*
 FIFA World Cup Analytics | Core Analysis Queries
 PostgreSQL

 These queries represent clear, explainable analysis used to validate
 and explore tournament performance before visualisation in Power BI.
*/

-- ============================================================
-- 1. TOURNAMENT ATTENDANCE PERFORMANCE
-- How have match volume, total attendance and average attendance
-- changed across World Cups?
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
-- Measures the proportion of available stadium capacity used.
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
-- Separates total scoring volume from scoring rate.
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
-- Identifies venues generating the strongest average crowds.
-- ============================================================

SELECT
    v.venue_name,
    ROUND(AVG(ma.attendance)) AS avg_attendance,
    COUNT(m.match_id) AS matches_hosted
FROM venues v
JOIN matches m
    ON m.venue_id = v.venue_id
JOIN match_attendance ma
    ON ma.match_id = m.match_id
GROUP BY v.venue_name
ORDER BY avg_attendance DESC
LIMIT 5;
