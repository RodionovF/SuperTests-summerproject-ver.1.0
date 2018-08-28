create sequence hibernate_sequence start 1 increment 1;

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

-----------------------------------------------------------

create table stat_of_tests
(
	stat_test_id serial not null,
	test_id integer not null,
	user_id integer not null,
	final_time time,
	date time,
	result integer,
	primary key (stat_test_id)
);

create table stat_of_questions
(
	stat_question_id serial not null,
	stat_test_id integer,
	question_id integer,
	selected_answer integer,
	primary key (stat_question_id)
);

-----------------------------------------------------------
--
-- create table if not exists users
-- (
-- 	user_id serial not null
-- 		constraint users_pkey
-- 			primary key,
-- 	active boolean not null,
-- 	email varchar,
-- 	pass varchar not null,
-- 	username varchar not null,
-- 	category_id integer
-- 		constraint users_categories_category_id_fk
-- 			references preference_categories
-- 				on update cascade on delete cascade,
-- 	role_id integer not null
-- 		constraint users_roles_role_id_fk
-- 			references roles
-- 				on update cascade on delete cascade
-- );
--
-- alter table users owner to postgres;
--
-- create unique index if not exists users_id_uindex
-- 	on users (user_id);
--
-- 	create table roles
-- (
-- 	role_id int8 not null
-- 		constraint roles_pkey
-- 			primary key,
-- 	rolename varchar(255) not null
-- );
--
-- alter table roles owner to postgres;
--
-- create unique index if not exists roles_role_id_uindex
-- 	on roles (role_id);
-----------------------------------------------------------



