-- Number of Assistances by a/the teacher

SELECT COUNT(assistance_requests.*) as total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id 
WHERE name = 'Helmer Rodriguez'
GROUP BY teachers.name;