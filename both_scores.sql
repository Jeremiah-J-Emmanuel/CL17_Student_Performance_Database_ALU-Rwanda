-- ============================================
-- 4. Find students who took both courses
-- ============================================
SELECT s.student_id, s.student_name
FROM students s
JOIN linux_grades lg ON s.student_id = lg.student_id
JOIN python_grades pg ON s.student_id = pg.student_id;
