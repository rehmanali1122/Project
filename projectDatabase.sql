create database projectdb;
use projectdb;

create table registerUser
(
	register_id int primary key auto_increment,
    register_name varchar(40) not null,
    register_email varchar(30) not null,
    register_phone varchar(30) not null,
    register_pass varchar(15) not null
);

select * from registerUser;


create table user_type
(
	usertype_id int primary key auto_increment,
	usertype_name varchar(30)  unique not null
);

select * from user_type;

create table user_register
(
	register_id int primary key auto_increment, -- for handeling records
	userid varchar(10) unique not null,
	firstname varchar(30) not null,
	lastname varchar(30),
	password char (8) not null,
    usertype_id int,
	foreign key (usertype_id) references user_type(usertype_id)
);

select * from user_register;


create table Facility
(
	facility_id int primary key auto_increment,
	facilityName varchar(20) unique not null,
    facilityHead int,
	foreign key (facilityHead) references user_register(register_id)
);

select * from Facility;


-- unassigned/assigned/work in progress/closed/rejected


create table status_master
(
	status_id int primary key auto_increment,
	status_name varchar(30) not null
);

select * from status_master;


create table request_register
(
	request_id char(5) primary key,
	requestor int,
    foreign key (requestor) references user_register(register_id),
	facility_id int,
    foreign key (facility_id) references Facility(facility_id),
	req_date datetime not null,
	assignee int,
    foreign key (assignee) references user_register(register_id),
	status_name VARCHAR(20) NOT NULL CHECK (status_name IN('unassigned', 'assigned', 'work in progress', 'closed', 'rejected')),
	status_id int,
    foreign key (status_id) references status_master(status_id),
	remarks varchar(100) not null,
	saverity varchar(20) check(saverity in ('least important','important','urgent'))
);

select * from request_register;