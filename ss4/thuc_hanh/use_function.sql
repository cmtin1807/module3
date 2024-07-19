use quan_ly_sinh_vien;
SELECT student.address, count(student.address) as so_luong
FROM student
GROUP BY address;

SELECT student_name, avg(mark)
FROM student
JOIN mark on student.student_id = mark.student_id
group by student_name;

SELECT student_name, avg(mark) AS diem_tb
FROM student
JOIN mark on student.student_id = mark.student_id
GROUP BY student_name
HAVING diem_tb > 15;

SELECT student_name, avg(mark) AS diem_tb
FROM student
         JOIN mark on student.student_id = mark.student_id
GROUP BY student_name
HAVING diem_tb >= ALL (
SELECT  avg(mark) AS diem_tb
    FROM student
    JOIN mark on student.student_id = mark.student_id
    GROUP BY student_name)
