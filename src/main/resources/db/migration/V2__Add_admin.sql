Insert into usr (id, username, password, active)
  values(1, 'admin', '123', true);

Insert into user_role (user_id, roles)
  values(1,'USER'), (1,'ADMIN');

-- Insert into preference_categories (category_id, filename, categoryname)
--   values (1, 'sport.jpg', 'sport');