use quan_ly_sinh_vien;
select *from student
where student_name like 'h%';
select * from class
where MONTH(start_date) = 12;
select *from subject
where credit between 3 and 5;

update student set class_id = 2 where student_name ='hung';

select student.student_name,subject.sub_name,mark.mark
from mark
join student on mark.student_id = student.student_id
join subject on mark.sub_id = subject.sub_id
order by mark desc , student_name asc