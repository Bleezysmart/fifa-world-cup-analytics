/* ============================================================
   FIFA WORLD CUP EVOLUTION | FINANCIAL & AUDIENCE ANALYSIS
   ============================================================ */

-- Financial performance with explicit treatment of 2026 budget/provisional values.
SELECT
    t.year,
    tf.world_cup_revenue_millions,
    tf.fifa_annual_revenue_budget_millions,
    tf.world_cup_cost_millions,
    tf.world_cup_surplus_millions,
    tf.data_status,
    tf.reporting_basis,
    tf.as_of_date
FROM tournaments t
JOIN tournament_financials tf
    ON tf.tournament_id = t.tournament_id
ORDER BY t.year;

-- Revenue composition.
SELECT
    t.year,
    tf.broadcasting_revenue_millions,
    tf.marketing_revenue_millions,
    tf.ticketing_revenue_millions,
    tf.hospitality_revenue_millions,
    tf.licensing_revenue_millions,
    tf.annual_broadcasting_budget_millions,
    tf.annual_marketing_budget_millions,
    tf.annual_hospitality_ticketing_budget_millions,
    tf.annual_licensing_budget_millions
FROM tournaments t
JOIN tournament_financials tf
    ON tf.tournament_id = t.tournament_id
ORDER BY t.year;

-- Audience and engagement metrics retain their original measurement definitions.
SELECT
    t.year,
    ta.metric_name,
    ta.audience_value_millions,
    ta.measurement_type,
    ta.data_status,
    ta.notes
FROM tournaments t
JOIN tournament_audience ta
    ON ta.tournament_id = t.tournament_id
ORDER BY t.year, ta.metric_name;

-- Ticket-demand coverage available in the database for deeper fan-demand analysis.
SELECT
    t.year,
    td.ticket_requests,
    td.tickets_available,
    td.application_days,
    td.applicant_countries,
    td.is_lower_bound
FROM tournaments t
JOIN ticket_demand td
    ON td.tournament_id = t.tournament_id
ORDER BY t.year;
