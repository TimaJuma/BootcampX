-- Average assistance request duration

SELECT AVG(completed_at - started_at) as avg_ar_duration
FROM assistance_requests;