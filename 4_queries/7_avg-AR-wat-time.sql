-- Average wait time for assistance 

SELECT  AVG(started_at - created_at) AS avg_wait_time
FROM assistance_requests