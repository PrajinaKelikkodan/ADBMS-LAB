create database student_details;

use student_details;

create table student(id int,name varchar(50), department varchar(50),address varchar(50),physics int, chem int,maths int,total_marks int);

insert into student values(1,'Fidha','MCA',NULL,90,50,150,290);
insert into student values(2,'Mariyam','Computer Science Engineering','Vashi',110,100,150,360);
insert into student values(3,'Ahmed','MCA','Nerul',110,150,130,390);
insert into student values(4,'Ihab','Computer Science Engineering',NULL,90,50,50,190);
insert into student values(5,'Ashad','Mechanical Engineering','Belapur',40,30,130,200);
insert into student values(6,'Alifah','Electrical and electronics Engineering',NULL,70,50,150,270);
insert into student values(7,'Vismaya','Mechanical Engineering','Koparkhairne',90,50,80,220);
insert into student values(8,'Rani','MCA',NULL,10,60,150,220);
insert into student values(9,'lily','Electrical and electronics Engineering','Panvel',90,50,150,290);
insert into student values(10,'Ruby','Computer Science Engineering',NULL,30,20,140,190);

#1
select * from student;

#2
select id,name,department from student;

#3
select id,name from student where total_marks > 350;

#4
select distinct department from student;

#5
select * from student where department="Mechanical Engineering";

#6
select * from student where department="MCA" or department="Computer Science Engineering";

#7
select * from student where department="Electrical and electronics Engineering";

#8
select * from student order by department desc;

#9
select * from student where address is null;

#10
update student set name="Robin Zakaria" where department="MCA";
select * from student;

#11
delete from student where name="Vismaya";

#12
select max(total_marks) from student;
select min(total_marks) from student;

#13
select min(maths) from student;

#14
select name from student where name like "A%";

#15
select name,department from student where department like "%g";

#16
select * from student where department='MCA' or department='Electrical and Electronics Engineering' or department='Mechanical Engineering';

#17
create view studentView as select name,total_marks,department from student;
select * from studentView;

#18
select sum(physics) from student;

#19
alter table student drop column total_marks;
select * from student;

#20
alter table student add column total_marks int;
update student set total_marks=(physics+chem+maths);

#21
create view studenDetails as select name,total_marks from student;
select * from studenDetails;

#22
drop view studenDetails;

#23
alter table student add column age int;

#24
 ALTER TABLE student ADD CHECK (age>=18);
 
 alter table student add constraint chk_id check(id<=15);
 alter table student drop constraint chk_id;
 
 update student set age=18 where id=1;
 update student set age=25 where id=2;
 update student set age=21 where id=3;
 update student set age=25 where id=4;
 update student set age=24 where id=5;
 update student set age=24 where id=6;
 update student set age=20 where id=8;
 update student set age=22 where id=9;
 update student set age=18 where id=10;
 
 select * from student;
 
 #25
 
 #26
 delete from student where age=25;
 select * from student;
 commit;
 
 #27
 delete from student where age=24;
 select * from student;
 rollback;
 
 #28
 savepoint save;
 
 #29
 delete from student where age=24;
 rollback to save;
 select * from student;
 
 #30
 release savepoint save;
 
 #31
 select * from student where total_marks=(select max(total_marks) from student);
 
 #32
 alter table student modify column name varchar(50) not null;
 alter table student add column admission_no int not null;
 select id,name,admission_no from student;
 
 #33
 alter table student add column email varchar(50) unique;
 select name,email from student;
 
 #34
 create table department(deptid int,deptname varchar(50),studid int,locid int);
 select * from department;
 
 #35
 alter table department add constraint dept_id_pk primary key(dept_id);
 
 #36
 insert into department values(1,'a',101,201);
 insert into department values(2,'b',101,201);
 insert into department values(3,'c',101,201);
 insert into department values(4,'d',101,201);
 
select * from student;
select name from student union select deptname from department; #repeated values print nhi karega-UNION
select name from student union all select deptname from department; #repeated values print karegA-UNION ALL
 
 #COUNT
 select count(deptname) from department;
 select count(name) from student;
 
 #average
 select avg(total_marks) from student;
 
 #in
 #To select all records for the a and the a details in Table student, we key in,
SELECT *FROM department WHERE deptname IN ('a', 'b');

#inner join
select name,deptname from student s,department d where s.id=d.deptid;

#left outer join
select id,name,address from student left outer join department on student.id=department.deptid;