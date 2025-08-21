-- Finding students who scored less than 50% in Linux course
SELECT s.student_id, s.student_name, s.intake_year, lg.grade_obtained as linux_grade
FROM students s
JOIN linux_grades lg ON s.student_id = lg.student_id
WHERE CAST(lg.grade_obtained AS UNSIGNED) < 50
ORDER BY CAST(lg.grade_obtained AS UNSIGNED) ASC;