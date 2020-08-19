 -- Average assitance request duration time on each cohort

SELECT cohorts.name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS avg_ar_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY avg_ar_time;


