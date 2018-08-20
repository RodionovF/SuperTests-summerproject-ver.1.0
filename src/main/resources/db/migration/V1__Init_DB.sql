create sequence hibernate_sequence start 1 increment 1;

create table message (
    id int8 not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    user_id int8,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table usr (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists message
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint user_role_user_fk
foreign key (user_id) references usr;

-----------------------------------------------------------

 create table preference_categories
 (
 	categoryname varchar(255) not null,
 	filename varchar(255),
 	categoryId int8 not null
 		constraint categories_pk
 			primary key
 )
 ;

 alter table preference_categories owner to postgres
 ;

create unique index if not exists categories_category_id_uindex
	on preference_categories (categoryId)
;

create table if not exists roles
(
	role_id serial not null
		constraint roles_pkey
			primary key,
	rolename varchar(255) not null
)
;

alter table roles owner to postgres
;

create table if not exists users
(
	user_id serial not null
		constraint users_pkey
			primary key,
	active boolean not null,
	email varchar,
	pass varchar not null,
	username varchar not null,
	categoryId integer
		constraint users_categories_category_id_fk
			references preference_categories
				on update cascade on delete cascade,
	role_id integer not null
		constraint users_roles_role_id_fk
			references roles
				on update cascade on delete cascade
)
;

alter table users owner to postgres
;

create unique index if not exists users_id_uindex
	on users (user_id)
;

-----------------------------------------------------------

create table tests
(
	test_id int8 not null
		constraint tests_pkey
			primary key,
	testname varchar(255) not null,
	author_id int8 not null
		constraint tests_users_user_id_fk
			references usr
				on update cascade on delete cascade,
	num_of_questions int8 not null,
	image_path_start varchar(255),
	image_path_end varchar(255),
	categoryId int8 not null
		constraint tests_categories_category_id_fk
			references preference_categories
				on update cascade on delete cascade
)
;

alter table tests owner to postgres
;

create unique index if not exists tests_test_id_uindex
	on tests (test_id)
;

create table questions
(
	question_id int8 not null
		constraint questions_pkey
			primary key,
	testId int8  not null
		constraint questions_tests_test_id_fk
			references tests
				on update cascade on delete cascade,
	question varchar(2048) not null,
	image_path varchar(255)
)
;

alter table questions owner to postgres
;

create unique index if not exists questions_question_id_uindex
	on questions (question_id)
;

create table answers
(
	answer_id int8 not null
		constraint answers_pkey
			primary key,
	question_id int8 not null
		constraint answers_questions_question_id_fk
			references questions
				on update cascade on delete cascade,
	answer varchar(255) not null,
	corectness boolean not null
)
;

alter table answers owner to postgres
;

create unique index if not exists answers_answer_id_uindex
	on answers (answer_id)
;

-----------------------------------------------------------

create table if not exists stat_of_tests
(
	stat_test_id serial not null
		constraint stat_of_tests_pkey
			primary key,
	testId integer not null
		constraint stat_of_tests_tests_test_id_fk
			references tests
				on update cascade on delete cascade,
	user_id integer not null
		constraint stat_of_tests_users_user_id_fk
			references users
				on update cascade on delete cascade,
	final_time time,
	date time,
	result integer
)
;

alter table stat_of_tests owner to postgres
;

create unique index if not exists stat_of_tests_stat_test_id_uindex
	on stat_of_tests (stat_test_id)
;

create table if not exists stat_of_questions
(
	stat_question_id serial not null
		constraint stat_of_questions_pkey
			primary key,
	stat_test_id integer
		constraint stat_of_questions_stat_of_tests_stat_test_id_fk
			references stat_of_tests
				on update cascade on delete cascade,
	question_id integer
		constraint stat_of_questions_questions_question_id_fk
			references questions
				on update cascade on delete cascade,
	selected_answer integer
		constraint stat_of_questions_answers_answer_id_fk
			references answers
				on update cascade on delete cascade
)
;

alter table stat_of_questions owner to postgres
;

create unique index if not exists stat_of_questions_stat_question_id_uindex
	on stat_of_questions (stat_question_id)
;

create unique index if not exists roles_role_id_uindex
	on roles (role_id)
;