Select cV.visitID, C.name AS customerName, V.cost, cV.calculatedCost 
FROM costView cV, Visit V, customer C
WHERE cV.visitID = V.visitID AND cV.calculatedCost != V.cost AND V.custID = C.custID
AND V.custID IN (SELECT custID FROM Visit GROUP BY custID HAVING COUNT(*) >= 3);


/*
 visitid |  customername   |  cost  | calculatedcost 
---------+-----------------+--------+----------------
       3 | Sherlock Holmes | 950.00 |        1000.17
       7 | Sherlock Holmes | 150.00 |         116.69
       8 | Sherlock Holmes | 228.00 |          18.50
       1 | Indiana Jones   | 950.00 |         458.92
       2 | Indiana Jones   | 950.00 |         458.92
       6 | Sherlock Holmes |  53.00 |         466.69
      11 | Indiana Jones   | 950.00 |         448.92
(7 rows)
*/

DELETE FROM BillEntry WHERE visitID = 10 AND menuItemID = 3;
DELETE FROM BillEntry WHERE visitID = 2 AND menuItemID = 1;

/*
 visitid |  customername   |  cost  | calculatedcost 
---------+-----------------+--------+----------------
       3 | Sherlock Holmes | 950.00 |        1000.17
       7 | Sherlock Holmes | 150.00 |         116.69
       8 | Sherlock Holmes | 228.00 |          18.50
       1 | Indiana Jones   | 950.00 |         458.92
       2 | Indiana Jones   | 950.00 |         234.46
       6 | Sherlock Holmes |  53.00 |         466.69
      11 | Indiana Jones   | 950.00 |         448.92
(7 rows)
*/


