-- If you want to wipe the database and start from a clean slate, run the dropdb korning command first (not recommended for production).
-- $ createdb korning
-- $ psql korning < schema.sql
-- $ ruby import.rb

DROP TABLE IF EXISTS sales, employees, customers, products, invoices;

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  UNIQUE (name, email)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  customer VARCHAR(255) NOT NULL,
  account_no VARCHAR(255) NOT NULL,
  UNIQUE (customer, account_no)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  UNIQUE (name)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  invoice_no INTEGER,
  frequency VARCHAR(20)
);

CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  sale_date DATE,
  sale_amount NUMERIC,
  units_sold INTEGER,
  employee_id INTEGER REFERENCES employees(id),
  invoice_id INTEGER REFERENCES invoices(id),
  customer_id INTEGER REFERENCES customers(id),
  product_id INTEGER REFERENCES products(id)
);
