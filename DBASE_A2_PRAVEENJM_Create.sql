/*
** @Aurthor: Praveen Jayasuriya Mahathelge
** Date: 15th of March 
** Description: This script creates a database that consists for 6 taBles that I have made to populate with insert statements.
** 
** 
*/
-- DBAS1-A2-FirstnameLastInitial_Create.sql

USE master;
GO

-- checking if the database exist already
IF DB_ID('DBAS1-A2-PraveenJ') IS NOT NULL
BEGIN
    ALTER DATABASE [DBAS1-A2-PraveenJ] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [DBAS1-A2-PraveenJ]; -- drops the database if it does exsist 
END
-- creates the database
CREATE DATABASE [DBAS1-A2-PraveenJ];
GO

USE [DBAS1-A2-PraveenJ];
GO

-- Place your table creation scripts or other SQL statements here

CREATE DATABASE DBAS_A2_PRAVEENJ;

-- Add additional code to create tables, insert data, and perform other tasks as needed

-- This code creates a table named "DRIVER_CLASS"
CREATE TABLE DRIVER_CLASS (
    DRIVER_CLASS_ID INT PRIMARY KEY,
    DRIVER_CLASS_DESC VARCHAR(50),
    DRIVER_CLASS_SOLO_READY BIT
);

-- This code creates a table named "CLIENT"
CREATE TABLE CLIENT (
    CLIENT_ID int PRIMARY KEY,
    CLIENT_LNAME varchar(50),
    CLIENT_FNAME varchar(50),
    CLIENT_PHONE varchar(20),
    CLIENT_EMAIL varchar(100),
    CLIENT_DRIVER_CLASS_ID int,
    FOREIGN KEY (CLIENT_DRIVER_CLASS_ID) REFERENCES DRIVER_CLASS (DRIVER_CLASS_ID)
);
-- This code creates a table named "VENUE"
CREATE TABLE VENUE (
    VENUE_ID INT PRIMARY KEY,
    VENUE_NAME VARCHAR(50),
    VENUE_CONTACT_PHONE VARCHAR(20),
    VENUE_CONTACT_EMAIL VARCHAR(50)
);
-- This code creates a table named "EVENT"
CREATE TABLE EVENT (
    EVENT_ID INT PRIMARY KEY,
    EVENT_NAME VARCHAR(50),
    EVENT_DATE DATE,
    EVENT_VENUE_ID INT,
    EVENT_EARLY_BIRD_PRICE DECIMAL(10,2),
    EVENT_REGULAR_PRICE DECIMAL(10,2),
    EVENT_IS_ROADTRIP TINYINT
);
CREATE TABLE INSTRUCTOR (
    INSTRUCTOR_ID INT PRIMARY KEY,
    INSTRUCTOR_LNAME VARCHAR(50),
    INSTRUCTOR_FNAME VARCHAR(50),
    INSTRUCTOR_PHONE VARCHAR(20),
    INSTRUCTOR_EMAIL VARCHAR(50),
    INSTRUCTOR_NOTES TEXT
);
-- This code creates a table named "REGISTRATION"
CREATE TABLE REGISTRATION (
    REG_ID INT PRIMARY KEY,
    REG_EVENT_ID INT,
    REG_CLIENT_ID INT,
    REG_DRIVER_CLASS INT,
    REG_INSTRUCTOR_ID INT,
    REG_IS_PAID  CHAR(3) constraint REG_CHECK check (REG_IS_PAID in ('Yes','No')), --  this made so that it will only accept yes or no
    FOREIGN KEY (REG_EVENT_ID) REFERENCES EVENT (EVENT_ID),
    FOREIGN KEY (REG_CLIENT_ID) REFERENCES CLIENT (CLIENT_ID),
    FOREIGN KEY (REG_DRIVER_CLASS) REFERENCES DRIVER_CLASS (DRIVER_CLASS_ID),
    FOREIGN KEY (REG_INSTRUCTOR_ID) REFERENCES INSTRUCTOR (INSTRUCTOR_ID)
);

-- This the insert statements for the "DRIVER_CLASS"
INSERT INTO DRIVER_CLASS (DRIVER_CLASS_ID, DRIVER_CLASS_DESC, DRIVER_CLASS_SOLO_READY)
VALUES (1, 'Beginner', 0),
(2, 'Intermediate', 0),
(3, 'Advanced', 1),
(4, 'Novice', 0),
(5, 'Expert', 1),
(6, 'Pro', 1),
(7, 'Amateur', 0),
(8, 'Semi-pro', 1),
(9, 'Casual', 0),
(10, 'Rookie', 0);

-- This the insert statements for the "CLIENT"
INSERT INTO CLIENT (CLIENT_ID, CLIENT_LNAME, CLIENT_FNAME, CLIENT_PHONE, CLIENT_EMAIL, CLIENT_DRIVER_CLASS_ID)
VALUES (1, 'Smith', 'John', '555-1234', 'jsmith@email.com', 1),
(2, 'Doe', 'Jane', '555-5678', 'jdoe@email.com', 2),
(3, 'Johnson', 'Robert', '555-9012', 'rjohnson@email.com', 3),
(4, 'Garcia', 'Maria', '555-3456', 'mgarcia@email.com', 2),
(5, 'Brown', 'William', '555-7890', 'wbrown@email.com', 1),
(6, 'Martinez', 'Jose', '555-2345', 'jmartinez@email.com', 3),
(7, 'Lee', 'Ji-won', '555-6789', 'jwlee@email.com', 2),
(8, 'Wang', 'Ling', '555-0123', 'lwang@email.com', 1),
(9, 'Singh', 'Raj', '555-4567', 'rsingh@email.com', 3),
(10, 'Nguyen', 'Thi', '555-8901', 'tnguyen@email.com', 2);

-- This the insert statements for the "VENUE"
INSERT INTO VENUE (VENUE_ID, VENUE_NAME, VENUE_CONTACT_PHONE, VENUE_CONTACT_EMAIL)
VALUES (1, 'Raceway Park', '555-1111', 'info@racewaypark.com'),
(2, 'Autobahn Country Club', '555-2222', 'info@autobahncc.com'),
(3, 'Mid-Ohio Sports Car Course', '555-3333', 'info@midohio.com'),
(4, 'Laguna Seca', '555-4444', 'info@lagunaseca.com'),
(5, 'Road America', '555-5555', 'info@roadamerica.com'),
(6, 'Sebring International Raceway', '555-6666', 'info@sebringraceway.com'),
(7, 'Watkins Glen International', '555-7777', 'info@theglen.com'),
(8, 'Circuit of The Americas', '555-8888', 'info@circuitoftheamericas.com'),
(9, 'Nürburgring', '555-9999', 'info@nurburgring.de'),
(10, 'Silverstone Circuit', '555-1010', 'info@silverstone.co.uk');


-- This are the inset statements for the "EVENT"
INSERT INTO EVENT (EVENT_ID, EVENT_NAME, EVENT_DATE, EVENT_VENUE_ID, EVENT_EARLY_BIRD_PRICE, EVENT_REGULAR_PRICE, EVENT_IS_ROADTRIP)
VALUES (1, 'Beginner Track Day', '2023-04-15', 1, 125.00, 150.00, 0),
(2, 'Intermediate Track Day', '2023-05-20', 2, 175.00, 200.00, 0),
(3, 'Advanced Track Day', '2023-06-25', 3, 225.00, 250.00, 1),
(4, 'High Performance Driving Experience', '2023-07-15', 1, 300.00, 350.00, 1),
(5, 'Autocross Challenge', '2023-08-12', 2, 50.00, 75.00, 0),
(6, 'Time Attack Competition', '2023-09-10', 3, 175.00, 200.00, 0),
(7, 'Open Lapping Day', '2023-10-15', 1, 100.00, 125.00, 0),
(8, 'Drift Exhibition', '2023-11-18', 2, 75.00, 100.00, 0),
(9, 'Track Night in America', '2023-12-08', 3, 125.00, 150.00, 1),
(10, 'Winter Driving School', '2024-01-20', 1, 250.00, 275.00, 1);

-- This are the insert statement for the "INSTRUCTOR"
INSERT INTO INSTRUCTOR (INSTRUCTOR_ID, INSTRUCTOR_LNAME, INSTRUCTOR_FNAME, INSTRUCTOR_PHONE, INSTRUCTOR_EMAIL, INSTRUCTOR_NOTES)
VALUES (1, 'Johnson', 'David', '555-4444', 'djohnson@email.com', ''),
(2, 'Miller', 'Karen', '555-5555', 'kmiller@email.com', ''),
(3, 'Garcia', 'Juan', '555-6666', 'jgarcia@email.com', ''),
(4, 'Smith', 'Emily', '555-7777', 'esmith@email.com', ''),
(5, 'Chen', 'Michael', '555-8888', 'mchen@email.com', ''),
(6, 'Kim', 'Hyejin', '555-9999', 'hkim@email.com', ''),
(7, 'Lee', 'Minho', '555-0000', 'mlee@email.com', ''),
(8, 'Sato', 'Yuki', '555-1111', 'ysato@email.com', ''),
(9, 'Wu', 'Ying', '555-2222', 'ywu@email.com', ''),
(10, 'Lopez', 'Carlos', '555-3333', 'clopez@email.com', '');

-- This are the insert statement for the "REGISTRATION"
INSERT INTO REGISTRATION (REG_ID, REG_EVENT_ID, REG_CLIENT_ID, REG_DRIVER_CLASS, REG_INSTRUCTOR_ID, REG_IS_PAID)
VALUES (1, 1, 1, 1, 1, 'Yes'),
(2, 2, 2, 2, 2, 'No'),
(3, 3, 3, 3, 3,'Yes'),
(4, 1, 2, 2, 1, 'Yes'),
(5, 2, 3, 2, 3, 'No'),
(6, 3, 1, 1, 2, 'Yes'),
(7, 4, 4, 3, 2, 'Yes'),
(8, 4, 5, 3, 3, 'No'),
(9, 5, 6, 1, 1, 'Yes'),
(10, 5, 7, 2, 2, 'No');

-- END of the script File.