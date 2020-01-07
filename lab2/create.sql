--for lab 2-- 
DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE customer(
custID INTEGER PRIMARY KEY,
name VARCHAR(40) NOT NULL,
address VARCHAR(40),
joinDate date,
status char(1),
UNIQUE(name, address));

CREATE TABLE menuItem(
menuItemID INTEGER PRIMARY KEY,
name VARCHAR(40) NOT NULL,
description VARCHAR(60),
price NUMERIC (5,2),
UNIQUE(name));

CREATE TABLE dinnerTable(
dinnerTableID INTEGER PRIMARY KEY, 
numSeats INTEGER NOT NULL,  
inUse BOOLEAN);

CREATE TABLE server(
serverID INTEGER PRIMARY KEY, 
name VARCHAR(40), 
level char(1), 
salary NUMERIC(6,2));

CREATE TABLE visit(
visitID INTEGER PRIMARY KEY, 
custID INTEGER, 
dinnerTableID INTEGER, 
serverID INTEGER, 
numPeople INTEGER, 
cost NUMERIC(6,2), 
custArrive TIMESTAMP, 
custDepart TIMESTAMP, 
FOREIGN KEY(custID) REFERENCES customer(custID), 
FOREIGN KEY(dinnerTableID) REFERENCES dinnerTable(dinnerTableID), 
FOREIGN KEY(serverID) REFERENCES server(serverID),
UNIQUE(custID, custArrive));

CREATE TABLE billEntry(
visitID INTEGER, 
menuItemID INTEGER, 
PRIMARY KEY(visitID, menuItemID), 
quantity INTEGER, 
FOREIGN KEY(visitID) REFERENCES visit(visitID), 
FOREIGN KEY(menuItemID) REFERENCES menuItem(menuItemID));







