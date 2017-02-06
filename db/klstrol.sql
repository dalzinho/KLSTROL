DROP TABLE vendors CASCADE;
DROP TABLE burgers CASCADE;
DROP TABLE deals CASCADE;
DROP TABLE link_burgers_and_deals CASCADE;

CREATE TABLE vendors(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE burgers(
  id SERIAL4 primary key,
  name VARCHAR(255),
  price NUMERIC(4,2),
  vendor_id INT4 references vendors(id) ON DELETE CASCADE
);

CREATE TABLE deals(
  id SERIAL4 primary key,
  title VARCHAR(255),
  vendor_id INT4 references vendors(id) ON DELETE CASCADE,
  day VARCHAR(255)
);

CREATE TABLE link_burgers_and_deals (
  id SERIAL4 primary key,
  deal_id INT4 references deals(id) ON DELETE CASCADE,
  burger_id INT4 references burgers(id) ON DELETE CASCADE
);

