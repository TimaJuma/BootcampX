-- query for cohorts name and number of students enrolled for each
-- displaying over 18 students sorted by number of students

-- OPTION 1
SELECT COUNT(students.cohort_id) as student_count , cohorts.name 
FROM students 
JOIN cohorts ON cohort_id = cohorts.id 
GROUP BY cohorts.name 
HAVING COUNT(students.cohort_id)>=18 
ORDER BY student_count, cohorts.name; 



-- OPTION 2
SELECT cohorts.name as cohort_name, count(students.*) AS student_count 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohort_name 
HAVING count(students.*) >= 18
ORDER BY student_count;
