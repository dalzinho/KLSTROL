DROP TABLE vendors CASCADE;
DROP TABLE burgers CASCADE;
DROP TABLE deals CASCADE;

CREATE TABLE vendors(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE burgers(
  id SERIAL4 primary key,
  name VARCHAR(255),
  price NUMERIC(4,2),
  vendor_id INT4 references vendors(id)
);

CREATE TABLE deals(
  id SERIAL4 primary key,
  title VARCHAR(255),
  burger_id INT4 references burgers(id),
  day VARCHAR(255)
);

