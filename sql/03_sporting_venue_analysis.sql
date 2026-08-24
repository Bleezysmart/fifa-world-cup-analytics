/* ============================================================
   FIFA WORLD CUP EVOLUTION | SPORTING & VENUE ANALYSIS
   ============================================================ */

-- Tournament scoring and competitive-balance profile.
SELECT
    t.year,
    COUNT(m.match_id) AS matches,
    SUM(m.home_score + m.away_score) AS total_goals,
    ROUND(
        SUM(m.home_score + m.away_score) * 1.0 /
        NULLIF(COUNT(m.match_id), 0),
        2
    ) AS goals_per_match,
    COUNT(*) FILTER (WHERE m.home_score = m.away_score) AS drawn_matches,
    ROUND(
        COUNT(*) FILTER (WHERE m.home_score = m.away_score) * 100.0 /
        NULLIF(COUNT(*), 0),
        2
    ) AS draw_rate_pct,
    ROUND(
        COUNT(*) FILTER (WHERE ABS(m.home_score - m.away_score) = 1) * 100.0 /
        NULLIF(COUNT(*), 0),
        2
    ) AS one_goal_margin_pct,
    ROUND(
        COUNT(*) FILTER (WHERE ABS(m.home_score - m.away_score) >= 3) * 100.0 /
        NULLIF(COUNT(*), 0),
        2
    ) AS three_plus_goal_margin_pct
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
GROUP BY t.year
ORDER BY t.year;

-- Event-level discipline by tournament.
SELECT
    t.year,
    COUNT(*) FILTER (WHERE e.event_type ILIKE '%yellow%') AS yellow_cards,
    COUNT(*) FILTER (WHERE e.event_type ILIKE '%red%') AS red_cards
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
JOIN worldcup_match_events e
    ON e.match_id = m.match_id
GROUP BY t.year
ORDER BY t.year;

-- Venue performance.
SELECT
    t.year,
    v.stadium_name,
    v.city,
    COUNT(m.match_id) AS matches_hosted,
    SUM(ma.attendance) AS total_attendance,
    ROUND(AVG(ma.attendance)) AS avg_attendance,
    ROUND(
        SUM(ma.attendance) * 100.0 /
        NULLIF(SUM(ma.available_capacity), 0),
        2
    ) AS capacity_utilization_pct
FROM tournaments t
JOIN matches m
    ON m.tournament_id = t.tournament_id
JOIN venues v
    ON v.venue_id = m.venue_id
JOIN match_attendance ma
    ON ma.match_id = m.match_id
GROUP BY t.year, v.stadium_name, v.city
ORDER BY t.year, avg_attendance DESC;
