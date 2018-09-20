create sequence hibernate_sequence start 2 increment 1;

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

 create table preference_categories
 (
 	categoryname varchar(255) not null,
 	filename varchar(255),
 	category_id int8 not null,
 	primary key (category_id)
 );

create table users (
    user_id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    category_id int8,
    primary key (user_id)
);

create table tests
(
	test_id int8 not null,
	testname varchar(255) not null,
	author_id int8 not null,
	num_of_questions int8 not null,
	image_path_start varchar(255),
	image_path_end varchar(255),
	category_id int8 not null,
	primary key (test_id)
);

create table questions
(
	question_id int8 not null,
	test_id int8  not null,
	question varchar(2048) not null,
	image_path varchar(255),
	primary key (question_id)
);

create table answers
(
	answer_id int8 not null,
	question_id int8 not null,
	answer varchar(255) not null,
	corectness boolean not null,
	primary key (answer_id)
);

create table stat_of_tests
(
	stat_test_id int8 not null,
	test_id int8 not null,
	user_id int8 not null,
	final_time int8,
	date date,
	result int8,
	primary key (stat_test_id)
);

create table stat_of_questions
(
	stat_question_id int8 not null,
	stat_test_id int8,
	question_id int8,
	selected_answer int8,
	primary key (stat_question_id)
);




