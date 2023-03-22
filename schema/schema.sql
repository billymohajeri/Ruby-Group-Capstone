CREATE DATABASE catalog_app;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  author_id INTEGER REFERENCES authors(id),
  genre_id INTEGER REFERENCES genres(id),
  label_id INTEGER REFERENCES labels(id)
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES items(id),
  multiplayer BOOLEAN,
  last_played_at DATE
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES items(id),
  publisher TEXT,
  cover_state TEXT
);

CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES items(id),
  on_spotify BOOLEAN
);
