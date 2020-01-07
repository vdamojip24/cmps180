SELECT Customer.custID, name 
FROM Customer, Visit
WHERE Customer.custID = Visit.custID 
AND Visit.custArrive >= TIMESTAMP '2018-12-18 08:00:00' 
AND Visit.custDepart <= TIMESTAMP '2018-12-21 23:00:00'
GROUP BY Customer.custID
HAVING COUNT(Customer.custID) >= 2; 

