CREATE TABLE clouds(id SERIAL PRIMARY KEY, name VARCHAR(140), description VARCHAR(500), price VARCHAR(20), user_id INTEGER REFERENCES users (id)); 