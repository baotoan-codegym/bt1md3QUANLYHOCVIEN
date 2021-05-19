create database QuanLyHocVien;
use QuanLyHocVien;
create table Classes(
                        classId int primary key auto_increment,
                        className varchar(92) not null ,
                        classLanguage varchar(92) not null ,
                        classDescription varchar(92)
);
create table  Course(
                        CourseId int primary key  auto_increment,
                        CourseName varchar(92) not null ,
                        CourseDescription varchar(92)
);
create table Adress(
                       AdressId int primary key auto_increment,
                       adress varchar(92) not null
);
create table Student(
                        studentId int primary key auto_increment,
                        studentFullname varchar(92) not null ,
                        studentAdress_ID  int,
                        foreign key (studentAdress_ID)references Adress(AdressId),
                        studentPhone varchar(92) unique ,
                        studentClass_ID int,
                        foreign key (studentClass_ID)references Classes(classId)
);
create table Point(
                      PointId int primary key auto_increment,
                      PointCourse_ID int,
                      foreign key (PointCourse_ID)references Course(CourseId),
                      point int,
                      PointStudent_Id int,
                      foreign key (PointStudent_Id)references Student(studentId)
);
insert into Adress value (1, 'Ha Tinh');
insert into Adress value (2, 'Ha Noi');
insert into Adress value (3, 'Ha Nam');
insert into Adress value (4, 'Quang Ninh');
insert into Adress value (5, 'Thanh Hoa');

insert into Classes value (1,'Lop Tieng Anh','English','Hoc vao sang thu 7');
insert into Classes value (2,'Lop Tieng Trung','China','Hoc vao sang thu 2');
insert into Classes value (3,'Lop Tieng Thai','Thaiese','Hoc vao sang thu 3');
insert into Classes value (4,'Lop Tieng Viet','Vietnamese','Hoc vao sang thu 4');
insert into Classes value (5,'Lop Tieng Duc','Gergary','Hoc vao sang thu 5');

insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (1,'Thai Bao Toan',0344-682-959,1,2);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (2,'Tran Van Luc',0344-683-959,1,5);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (3,'Nguyen Van Hai',0344-684-959,2,3);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (4,'Tran Thanh Tung',0344-685-959,3,4);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (5,'Tran Minh Sang',0344-686-959,4,5);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (6,'Vo Ta THuc',0344-687-959,1,2);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (7,'Tran Trong Binh',0344-688-959,1,2);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (8,'Duong Van Le',0344-689-959,1,2);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (9,'Ho Kim Ngan',0344-680-959,1,2);
insert  into Student(studentId,studentFullname, studentPhone, studentClass_ID,studentAdress_ID)
    value (10,'Mac Dinh Hong',0346-686-859,1,2);

insert into Course value (1,'khoa hoc tieng Anh','khoa 6 thang');
insert into Course value (2,'khoa hoc tieng TRUNG','khoa 8 thang');
insert into Course value (3,'khoa hoc tieng Thai','khoa 9 thang');
insert into Course value (4,'khoa hoc tieng Duc','khoa 10 thang');
insert into Course value (5,'khoa hoc tieng Y','khoa 11 thang');

insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (1,2,5,9);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (2,3,8,8);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (3,4,7,7);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (4,5,7,10);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (5,1,6,6);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (6,2,2,5);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (7,1,1,4);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (8,5,5,8);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (9,5,9,9);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (10,4,10,10);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (11,3,6,8);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (12,2,3,9);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (13,5,8,6);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (14,3,1,7);
insert into Point(pointid, pointcourse_id,pointstudent_id,point) value (15,1,3,9);

#Hiển thị số học viên trong các lớp
select className as className,count(studentId) as  soluong from Classes
                                                                    inner join Student s on Classes.classId = s.studentClass_ID
group by className
order by Classes.className desc ;
# Hiển thị Học viên theo địa
select Adress DiaChi, count(studentId) as Soluong
from adress
         inner join Student S on Adress.adressID = S.studentAdress_ID
group by adress
order by adress desc;
# Hiển thị giá trị trung bình các Khóa hoc
select CourseName as khoahoc,avg(point) as Diemtrungbinh
from Course inner join Point P on Course.CourseId = P.PointCourse_ID
group by CourseName
order by CourseName desc
    limit 5 ;
# Hiển thị khóa học có điểm  trung binh cao nhất
select ketqua.khoahoc ,avg(ketqua.Diemtrungbinh)
from(select CourseName as khoahoc,avg(point) as Diemtrungbinh
     from Course inner join Point P on Course.CourseId = P.PointCourse_ID
     group by CourseName
     order by CourseName desc) as ketqua ;