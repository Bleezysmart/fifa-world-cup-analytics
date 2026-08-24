/* ============================================================
   FIFA WORLD CUP EVOLUTION | GROWTH & COMPARISON ANALYSIS
   PostgreSQL window functions and tournament-over-tournament analysis
   ============================================================ */

WITH tournament_metrics AS (
    SELECT
        t.year,
        t.number_of_teams,
        COUNT(m.match_id) AS matches,
        SUM(ma.attendance) AS total_attendance,
        ROUND(AVG(ma.attendance)) AS avg_attendance,
        ROUND(
            SUM(ma.attendance) * 100.0 /
            NULLIF(SUM(ma.available_capacity), 0),
            2
        ) AS capacity_utilization
    FROM tournaments t
    JOIN matches m
        ON m.tournament_id = t.tournament_id
    JOIN match_attendance ma
        ON ma.match_id = m.match_id
    GROUP BY t.year, t.number_of_teams
), comparison AS (
    SELECT
        *,
        LAG(number_of_teams) OVER (ORDER BY year) AS previous_teams,
        LAG(matches) OVER (ORDER BY year) AS previous_matches,
        LAG(total_attendance) OVER (ORDER BY year) AS previous_attendance,
        LAG(avg_attendance) OVER (ORDER BY year) AS previous_avg_attendance,
        LAG(capacity_utilization) OVER (ORDER BY year) AS previous_utilization
    FROM tournament_metrics
)
SELECT
    year,
    number_of_teams,
    matches,
    total_attendance,
    avg_attendance,
    capacity_utilization,
    ROUND(
        (number_of_teams - previous_teams) * 100.0 /
        NULLIF(previous_teams, 0), 2
    ) AS teams_growth_pct,
    ROUND(
        (matches - previous_matches) * 100.0 /
        NULLIF(previous_matches, 0), 2
    ) AS matches_growth_pct,
    ROUND(
        (total_attendance - previous_attendance) * 100.0 /
        NULLIF(previous_attendance, 0), 2
    ) AS attendance_growth_pct,
    ROUND(
        (avg_attendance - previous_avg_attendance) * 100.0 /
        NULLIF(previous_avg_attendance, 0), 2
    ) AS avg_attendance_growth_pct,
    ROUND(capacity_utilization - previous_utilization, 2) AS utilization_change_pp
FROM comparison
ORDER BY year;
