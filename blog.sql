CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255) UNIQUE
);

-- Crear la tabla de posts
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  creator_id INTEGER REFERENCES users(id),
  title VARCHAR(255),
  text TEXT
);


CREATE TABLE IF NOT EXISTS likes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  post_id INTEGER REFERENCES posts(id)
);


INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Doe', 'jane.doe@example.com'),
('Foo', 'Bar', 'foo.bar@example.com');


INSERT INTO posts (creator_id, title, text) VALUES
(1, 'Post 1', 'Lorem ipsum dolor sit amet.'),
(1, 'Post 2', 'Consectetur adipiscing elit.'),
(2, 'Post 3', 'Sed do eiusmod tempor.'),
(2, 'Post 4', 'Ut labore et dolore magna.'),
(3, 'Post 5', 'Ut enim ad minim veniam.');


INSERT INTO likes (user_id, post_id) VALUES
(1, 3),
(2, 1),
(3, 2),
(1, 4),
(2, 5);