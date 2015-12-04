-- Account A particular product opened for a particular customer
-- Branch A location at which banking transactions are conducted
-- Business A corporate customer (subtype of the Customer table)
-- Customer A person or corporation known to the bank
-- Department A group of bank employees implementing a particular banking function
-- Employee A person working for the bank
-- Individual A noncorporate customer (subtype of the Customer table)
-- Officer A person allowed to transact business for a corporate customer
-- Product A banking service offered to customers
-- Product_type A group of products having a similar function
-- Transaction A change made to an account balance
DROP DATABASE IF EXISTS BANK;
CREATE DATABASE BANK;
USE BANK;

DROP TABLE IF EXISTS product_type;
CREATE TABLE product_type (
    product_type_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) DEFAULT NULL,
    CONSTRAINT pk_product_type PRIMARY KEY (product_type_id)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product (
    product_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) DEFAULT NULL,
    product_type SMALLINT(5) UNSIGNED NOT NULL,
    date_offered DATE DEFAULT NULL,
    date_retired DATE DEFAULT NULL,
    PRIMARY KEY (product_id),
    CONSTRAINT fk_product_product_type FOREIGN KEY (product_type)
        REFERENCES product_type (product_type_id)
);

DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
    branch_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) DEFAULT NULL,
    city VARCHAR(10) DEFAULT NULL,
    address VARCHAR(20) DEFAULT NULL,
    state VARCHAR(30) DEFAULT NULL,
    zipcode VARCHAR(30) DEFAULT NULL,
    CONSTRAINT pk_branch PRIMARY KEY (branch_id)
);

DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pdepartment PRIMARY KEY (department_id)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    employee_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    department_id SMALLINT(5) UNSIGNED NOT NULL,
    branch_id SMALLINT(5) UNSIGNED NOT NULL,
    superior_id SMALLINT(5) UNSIGNED NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(30),
    start_date DATE,
    end_date DATE,
    title VARCHAR(30),
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id)
        REFERENCES department (department_id),
    CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id),
    CONSTRAINT fk_employee_superior FOREIGN KEY (superior_id)
        REFERENCES employee (employee_id),
    CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer ( 
  customer_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  fed_id VARCHAR(12) NOT NULL,
  address VARCHAR(30) DEFAULT NULL,
  city VARCHAR(20),
  postal_code VARCHAR(20),
  costomer_type ENUM('I','B'),
  CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS individual;
CREATE TABLE individual (
	customer_id SMALLINT(5) UNSIGNED NOT NULL,
    first_name VARCHAR(20),
    second_name VARCHAR(20),
    birth_date Date,
    CONSTRAINT pk_individual_customer PRIMARY KEY (customer_id),
	CONSTRAINT fk_individual_customer  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

DROP TABLE IF EXISTS business;
CREATE TABLE business (
    customer_id SMALLINT(5) UNSIGNED NOT NULL,
    name VARCHAR(30),
    state_id VARCHAR(20),
    incorp_date DATE,
    CONSTRAINT pk_business_customer PRIMARY KEY (customer_id),
    CONSTRAINT fk_business_customer FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
); 

DROP TABLE IF EXISTS Officer;
CREATE TABLE Officer (
  officer_id SMALLINT(5) UNSIGNED NOT NULL,
  customer_id SMALLINT(5) UNSIGNED NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(23),
  title VARCHAR(23),
  start_date date not null,
  end_date date,
  CONSTRAINT fk_officer_customer FOREIGN KEY (customer_id)  REFERENCES customer(customer_id),
  CONSTRAINT pk_officer PRIMARY KEY (officer_id)
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    account_id INT NOT NULL AUTO_INCREMENT,
    customer_id SMALLINT(5) UNSIGNED,
    product_id SMALLINT(5) UNSIGNED NOT NULL,
    open_date DATE NOT NULL,
    close_date DATE,
    last_activity_date DATE,
    status ENUM('ACTIVE', 'CLOSED', 'FROZEN'),
    open_branch_id SMALLINT UNSIGNED,
    open_emp_id SMALLINT UNSIGNED,
    avail_balance FLOAT(10 , 2 ),
    pending_balance FLOAT(10 , 2 ),
    CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES  customer(customer_id),
    CONSTRAINT fk_account_product FOREIGN KEY (product_id) REFERENCES  product(product_id),
    CONSTRAINT fk_account_branch  FOREIGN KEY (open_branch_id) REFERENCES  branch(branch_id),
    CONSTRAINT fk_account_employee  FOREIGN KEY (open_emp_id) REFERENCES  employee(branch_id),
    CONSTRAINT pk_account PRIMARY KEY (account_id)
);



DROP TABLE IF EXISTS Transaction;
CREATE TABLE Transaction (
    transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_date DATE,
    transaction_type ENUM('DBT', 'CDT'),
    amount DEC(10 , 2 ),
    funds_avail_date DATETIME,
    teller_employee_id SMALLINT(5) UNSIGNED,
    branch_id SMALLINT(5) UNSIGNED,
    CONSTRAINT pk_transaction PRIMARY KEY (transaction_id),
    CONSTRAINT fk_transaction_account FOREIGN KEY (account_id) REFERENCES Account(account_id),
	CONSTRAINT fk_transaction_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    CONSTRAINT fk_transaction_teller_employee FOREIGN KEY (teller_employee_id) REFERENCES employee(employee_id)
);




