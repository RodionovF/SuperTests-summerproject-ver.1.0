alter table preference_categories owner to postgres;
alter table users owner to postgres;
alter table tests owner to postgres;
alter table questions owner to postgres;
alter table answers owner to postgres;
alter table stat_of_tests owner to postgres;
alter table stat_of_questions owner to postgres;
-----------------------------------------------------------

create unique index if not exists categories_category_id_uindex
	on preference_categories (category_id);

create unique index if not exists users_user_id_uindex
	on users (user_id);

create unique index if not exists tests_test_id_uindex
	on tests (test_id);

create unique index if not exists questions_question_id_uindex
	on questions (question_id);

create unique index if not exists answers_answer_id_uindex
	on answers (answer_id);

create unique index if not exists stat_of_tests_stat_test_id_uindex
	on stat_of_tests (stat_test_id);

create unique index if not exists stat_of_questions_stat_question_id_uindex
	on stat_of_questions (stat_question_id);
-----------------------------------------------------------

alter table if exists user_role
    add constraint user_role_user_fk
foreign key (user_id) references users;

alter table if exists users
    add constraint users_categories_category_id_fk
foreign key (category_id) references preference_categories
    on update cascade on delete cascade;

alter table if exists tests
    add constraint tests_categories_category_id_fk
foreign key (category_id) references preference_categories
    on update cascade on delete cascade;

alter table if exists tests
    add constraint tests_users_user_id_fk
foreign key (author_id) references users
    on update cascade on delete cascade;

alter table if exists questions
    add constraint questions_tests_test_id_fk
foreign key (test_id) references tests
    on update cascade on delete cascade;

alter table if exists answers
    add constraint answers_questions_question_id_fk
foreign key (question_id) references questions
    on update cascade on delete cascade;

alter table if exists stat_of_tests
    add constraint stat_of_tests_tests_test_id_fk
foreign key (test_id) references tests
    on update cascade on delete cascade;

alter table if exists stat_of_tests
    add constraint stat_of_tests_users_user_id_fk
foreign key (user_id) references users
    on update cascade on delete cascade;

alter table if exists stat_of_questions
    add constraint stat_of_questions_stat_of_tests_stat_test_id_fk
foreign key (stat_test_id) references stat_of_tests
    on update cascade on delete cascade;

alter table if exists stat_of_questions
    add constraint stat_of_questions_questions_question_id_fk
foreign key (question_id) references questions
    on update cascade on delete cascade;

alter table if exists stat_of_questions
    add constraint stat_of_questions_answers_answer_id_fk
foreign key (selected_answer) references answers
    on update cascade on delete cascade;