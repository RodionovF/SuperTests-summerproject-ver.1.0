Insert into users (user_id, username, password, active)
  values(1, 'admin', '123', true);

-- Insert into roles (user_id, roles)
-- values(1,'USER');

Insert into user_role (user_id, roles)
values(1,'USER'), (1,'ADMIN'), (1,'CREATER');

-- Insert into preference_categories (categoryId, filename, categoryname)
--   values (1, 'sport.jpg', 'sport');