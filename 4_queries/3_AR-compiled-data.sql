-- Combined data of assistance requests with teachers name, students name, and assignments name sorted by duration of assistance

SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration 
FROM assistance_requests
JOIN teachers ON teachers.id = teachers.id
JOIN students ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id 
ORDER BY duration;