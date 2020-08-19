-- Number of assistance requests a/the student

SELECT COUNT(assistance_requests.*) as total_assistances, students.name
FROM assistance_requests
JOIN students ON students.id = student_id 
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;
