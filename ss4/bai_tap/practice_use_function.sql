use quan_ly_sinh_vien;

SELECT *
from subject
where credit = (
    SELECT max(credit)
    from subject
    );

SELECT sub_name, mark
FROM subject
JOIN mark ON subject.sub_id = mark.sub_id
where mark.mark >= ALL(
    SELECT max(mark)
    from mark
    );

SELECT student.student_id,student_name,address,phone,status,avg(mark) as diem_tb
FROM student
JOIN mark on student.student_id = mark.student_id
group by student_id, student_name, address, phone, status
order by diem_tb desc ;
