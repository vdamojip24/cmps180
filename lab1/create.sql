--for lab 1-- 
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE customer(
custID INTEGER PRIMARY KEY,
name VARCHAR(40),
address VARCHAR(40),
joinDate date,
status char(1));

CREATE TABLE menuItem(
menuItemID INTEGER PRIMARY KEY,
name VARCHAR(40),
description VARCHAR(60),
price NUMERIC (5,2));

CREATE TABLE dinnerTable(dinnerTableID INTEGER PRIMARY KEY, 
numSeats INTEGER, inUse BOOLEAN);

CREATE TABLE server(serverID INTEGER PRIMARY KEY, name VARCHAR(40), level char(1), salary NUMERIC(6,2));

CREATE TABLE visit(visitID INTEGER PRIMARY KEY, custID INTEGER, dinnerTableID INTEGER, serverID INTEGER, numPeople INTEGER, cost NUMERIC(6,2), custArrive TIMESTAMP, custDepart TIMESTAMP, FOREIGN KEY(custID) REFERENCES customer(custID), FOREIGN KEY(dinnerTableID) REFERENCES dinnerTable(dinnerTableID), FOREIGN KEY(serverID) REFERENCES server(serverID));

CREATE TABLE billEntry(visitID INTEGER, menuItemID INTEGER, PRIMARY KEY(visitID, menuItemID), quantity INTEGER, FOREIGN KEY(visitID) REFERENCES visit(visitID), FOREIGN KEY(menuItemID) REFERENCES menuItem(menuItemID));