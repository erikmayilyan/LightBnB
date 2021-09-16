/*
------ THE ORIGINAL CODE ------
CREATE TABLE users (
     id INTEGER PRIMARY KEY,
     name VARCHAR(255) NOT NULL,
     email VARCHAR(255) NOT NULL,
     password VARCHAR(255) NOT NULL
);

CREATE TABLE properties (
     id INTEGER PRIMARY KEY,
     owner_id INTEGER FOREIGN KEY REFERENCES users(id),
     title VARCHAR(255) NOT NULL,
     description TEXT NOT NULL,
     thumbnail_photo_url VARCHAR(255) NOT NULL,
     cover_photo_url VARCHAR(255) NOT NULL,
     cost_per_night INTEGER NOT NULL,
     parking_spaces INTEGER NOT NULL,
     number_of_bathrooms INTEGER NOT NULL,
     number_of_bedrooms INTEGER NOT NULL,
     country VARCHAR(255) NOT NULL,
     street VARCHAR(255) NOT NULL,
     city VARCHAR(255) NOT NULL,
     province VARCHAR(255) NOT NULL,
     post_code VARCHAR(255) NOT NULL,
     active BOOLEAN NOT NULL
);

CREATE TABLES reservations (
     id INTEGER PRIMARY KEY,
     start_date DATE,
     end_date DATE,
     property_id INTEGER FOREIGN KEY REFERENCES properties(id),
     guest_id INTEGER FOREIGN KEY REFERENCES users(id)
);

CREATE TABLES property_reviews (
      id INTEGER PRIMARY KEY,
      property_id INTEGER FOREIGN KEY REFERENCES properties(id),
      guest_id INTEGER FOREIGN KEY REFERENCES users(id),
      reservation_id INTEGER FOREIGN KEY REFERENCES reservation(id),
      rating SMALLINT NOT NULL,
      message TEXT NOT NULL
);
*/

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,

  title VARCHAR(255) NOT NULL,
  description TEXT,
  thumbnail_photo_url VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  cost_per_night INTEGER  NOT NULL DEFAULT 0,
  parking_spaces INTEGER  NOT NULL DEFAULT 0,
  number_of_bathrooms INTEGER  NOT NULL DEFAULT 0,
  number_of_bedrooms INTEGER  NOT NULL DEFAULT 0,

  country VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,

  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL DEFAULT 0,
  message TEXT
);

 INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) VALUES (2, 1, 7, 3, 'messages')