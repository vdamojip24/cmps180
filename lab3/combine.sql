UPDATE Visit as V
SET custID = MV.custID, dinnerTableID = MV.dinnerTableID, serverID = MV.serverID, numPeople = MV.numPeople
FROM ModifyVisit as MV
WHERE V.visitID = MV.visitID;




INSERT INTO visit as V(visitID, custID, dinnerTableID, serverID, numPeople, cost, custArrive, custDepart)
SELECT *, NULL, CURRENT_TIMESTAMP, NULL
FROM ModifyVisit as MV
WHERE MV.visitID NOT IN (SELECT V.visitID FROM Visit as V);
