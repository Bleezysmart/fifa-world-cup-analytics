/* ============================================================
   FIFA WORLD CUP EVOLUTION | DATA QUALITY & VALIDATION
   PostgreSQL
   ============================================================ */

-- 1. Check duplicate tournament years.
SELECT year, COUNT(*) AS records
FROM tournaments
GROUP BY year
HAVING COUNT(*) > 1;

-- 2. Check orphan matches without a tournament.
SELECT m.match_id
FROM matches m
LEFT JOIN tournaments t
    ON t.tournament_id = m.tournament_id
WHERE t.tournament_id IS NULL;

-- 3. Check orphan attendance records.
SELECT ma.attendance_id, ma.match_id
FROM match_attendance ma
LEFT JOIN matches m
    ON m.match_id = ma.match_id
WHERE m.match_id IS NULL;

-- 4. Check missing or invalid attendance/capacity values.
SELECT attendance_id, match_id, attendance, available_capacity
FROM match_attendance
WHERE attendance IS NULL
   OR available_capacity IS NULL
   OR attendance < 0
   OR available_capacity <= 0;

-- 5. Surface attendance above listed available capacity for investigation.
-- Small overages can occur when announced attendance and listed capacity
-- use different operational definitions; large overages require review.
SELECT
    t.year,
    m.match_id,
    v.stadium_name,
    ma.attendance,
    ma.available_capacity,
    ROUND(ma.attendance * 100.0 / ma.available_capacity, 2) AS utilization_pct
FROM match_attendance ma
JOIN matches m ON m.match_id = ma.match_id
JOIN tournaments t ON t.tournament_id = m.tournament_id
JOIN venues v ON v.venue_id = m.venue_id
WHERE ma.available_capacity IS NOT NULL
  AND ma.attendance > ma.available_capacity
ORDER BY utilization_pct DESC;

-- 6. Coverage audit: does every match have a capacity denominator?
SELECT
    t.year,
    COUNT(m.match_id) AS matches,
    COUNT(ma.available_capacity) AS matches_with_capacity,
    COUNT(m.match_id) - COUNT(ma.available_capacity) AS matches_without_capacity
FROM tournaments t
JOIN matches m ON m.tournament_id = t.tournament_id
LEFT JOIN match_attendance ma ON ma.match_id = m.match_id
GROUP BY t.year
ORDER BY t.year;

-- 7. Check duplicate audience metrics at the same tournament/definition grain.
SELECT
    tournament_id,
    metric_name,
    measurement_type,
    COUNT(*) AS records
FROM tournament_audience
GROUP BY tournament_id, metric_name, measurement_type
HAVING COUNT(*) > 1;

-- 8. Review finance reporting status and basis before comparing years.
SELECT
    t.year,
    tf.data_status,
    tf.reporting_basis,
    tf.as_of_date,
    tf.world_cup_revenue_millions,
    tf.fifa_annual_revenue_budget_millions,
    tf.world_cup_cost_millions
FROM tournament_financials tf
JOIN tournaments t ON t.tournament_id = tf.tournament_id
ORDER BY t.year;
