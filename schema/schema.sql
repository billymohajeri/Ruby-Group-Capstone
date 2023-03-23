CREATE DATABASE catalog_app;

CREATE TABLE Author (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE Genre (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
);

CREATE TABLE Label (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  color VARCHAR(255)
);

CREATE TABLE Item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  author_id INT authors(id),
  genre_id INT genres(id),
  label_id INT labels(id),
  publish_date DATE,
  archived BOOLEAN

  FOREIGN KEY ( author_id ) REFERENCES authors(id),
  FOREIGN KEY ( genre_id ) REFERENCES genres(id),
  FOREIGN KEY ( label_id ) REFERENCES labels(id)
);

CREATE TABLE Game (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT  items(id),
  author_id INT  authors(id),
  genre_id INT  genres(id),
  label_id INT  labels(id),
  multiplayer BOOLEAN,
  last_played_at DATE

  FOREIGN KEY ( item_id ) REFERENCES items(id),
  FOREIGN KEY ( author_id ) REFERENCES authors(id),
  FOREIGN KEY ( genre_id ) REFERENCES genres(id),
  FOREIGN KEY ( label_id ) REFERENCES labels(id),
);

CREATE TABLE Book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT REFERENCES items(id),
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  label_id INT REFERENCES labels(id),
  publisher TEXT,
  cover_state TEXT
);

CREATE TABLE MusicAlbum (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT REFERENCES items(id),
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  label_id INT REFERENCES labels(id),
  on_spotify BOOLEAN
);
