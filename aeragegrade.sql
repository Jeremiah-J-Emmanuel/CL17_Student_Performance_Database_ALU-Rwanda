SELECT 'Linux and IT Tools' AS course_name, AVG(CAST(grade_obtained AS UNSIGNED)) AS avg_grade
FROM linux_grades
UNION ALL
SELECT 'Python Programming' AS course_name, AVG(CAST(grade_obtained AS UNSIGNED)) AS avg_grade
FROM python_grades;