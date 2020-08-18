-- Average time of enrolled students to finish the assignments

SELECT students.name as student, AVG(duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY student
ORDER BY AVG(duration) DESC;
