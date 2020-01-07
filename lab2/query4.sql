SELECT BillEntry.visitID as visit, BillEntry.menuItemID, MenuItem.name AS menuItemName, quantity*price AS totalItemCost
FROM BillEntry, MenuItem
WHERE BillEntry.menuItemID = MenuItem.menuItemID;

