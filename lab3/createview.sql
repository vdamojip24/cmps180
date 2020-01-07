CREATE VIEW costView(visitID, calculatedCost) AS
SELECT V.visitID,  SUM(B.quantity * M.price) AS calculatedCost
FROM billEntry AS B, visit AS V, menuItem AS M
WHERE V.visitID = B.visitID AND M.menuItemID = B.menuItemID
GROUP BY V.visitID
UNION
(SELECT V.visitID,  0 as calculatedCost
FROM visit as V
WHERE V.visitID NOT IN(SELECT visitID FROM billEntry));
