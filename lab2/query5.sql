SELECT visitID, Customer.name AS custName, Server.name AS serverName
FROM Visit, Dinnertable, Server, Customer 
WHERE cost >= 200 
AND level IS NOT NULL 
AND numPeople = numSeats
AND Visit.serverID = Server.serverID
AND Visit.dinnertableID = Dinnertable.dinnertableID
AND Visit.custID = Customer.custID;
