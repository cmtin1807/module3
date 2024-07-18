use quan_ly_sinh_vien;

select * from student;

select * from student
where status = true;

select * from subject
where credit <10;

select * from student
join class on student.class_id = class.class_id
where class.class_name = 'A1';

select subject.sub_id, student.student_name, subject.sub_name, mark.mark
from subject
join mark on subject.sub_id = mark.sub_id
join student on mark.student_id = student.student_id
where sub_name ='CF'
