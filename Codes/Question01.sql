CREATE DATABASE mail_order;
USE mail_order;

CREATE TABLE employee (
    emp_no INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR (20),
    zip_code CHAR (5) );

CREATE TABLE customer(
    cust_no INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR (20),
    zip_code CHAR (5) );

CREATE TABLE part(
    part_no INT NOT NULL PRIMARY KEY,
    part_name VARCHAR(20),
    price INT,
    quantity INT );

CREATE TABLE order(
    order_no INT,
    date_receipt Date,
    date_expected Date,
    date_shipped Date,
    emp_no INT,
    cust_no INT,
    part_no INT,

PRIMARY KEY (order_no, emp_no, cust_no, part_no),

FOREIGN KEY (emp_no) REFERENCES employee(emp_no),

FOREIGN KEY (cust_no) REFERENCES customer(cust_no),

FOREIGN KEY (part_no) REFERENCES part(part_no)

);