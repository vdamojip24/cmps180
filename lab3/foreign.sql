/*DROP SCHEMA Lab3 CASCADE;
CREATE SCHEMA Lab3;

-- Create Tables
CREATE TABLE customer (
custID INT,
name VARCHAR(40) NOT NULL,
address VARCHAR(40),
joinDate DATE,
status CHAR(1),
PRIMARY KEY (custID),
UNIQUE (name, address)
);

CREATE TABLE menuItem (
menuItemID INT,
name VARCHAR(40) NOT NULL,
description VARCHAR(60),
price NUMERIC (5,2),
PRIMARY KEY (menuItemID),
UNIQUE(name)
);

CREATE TABLE dinnerTable (
dinnerTableID INT,
numSeats INT NOT NULL,
inUse BOOLEAN,
PRIMARY KEY (dinnerTableID)
);

CREATE TABLE server (
serverID INT,
name VARCHAR (40),
level CHAR (1),
salary NUMERIC(6,2),
PRIMARY KEY (serverID)
);

CREATE TABLE visit (
visitID INT,
custID INT,
dinnerTableID INT,
serverID INT,
numPeople INT, 
cost NUMERIC (6,2),
custArrive TIMESTAMP,
custDepart TIMESTAMP,
PRIMARY KEY (visitID),
UNIQUE(custID, custArrive),
FOREIGN KEY(dinnerTableID) REFERENCES dinnerTable(dinnerTableID),
FOREIGN KEY(custID) REFERENCES customer(custID) ON DELETE CASCADE,
FOREIGN KEY(serverID) REFERENCES server(serverID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE billEntry (
visitID INT,
menuItemID INT,
quantity INT,
PRIMARY KEY (visitID, menuItemID),
FOREIGN KEY (visitID) REFERENCES Visit,
FOREIGN KEY (menuItemID) REFERENCES MenuItem
);

CREATE TABLE modifyVisit (
visitID INT,
custID INT,
dinnerTableID INT,
serverID INT,
numPeople INT, 
PRIMARY KEY (visitID)
);*/

ALTER TABLE visit 
ADD CONSTRAINT dinnerTableConstraint 
FOREIGN KEY(dinnerTableID) REFERENCES dinnerTable(dinnerTableID);

ALTER TABLE visit 
ADD CONSTRAINT custIdConstraint 
FOREIGN KEY(custID) REFERENCES customer(custID) ON DELETE CASCADE;

ALTER TABLE visit 
ADD CONSTRAINT serverIdConstraint 
FOREIGN KEY(serverID) REFERENCES server(serverID) ON UPDATE CASCADE ON DELETE SET NULL;

