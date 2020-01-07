SELECT DISTINCT name AS theName, description AS theDescription, price AS thePrice
FROM menuItem, billEntry
WHERE menuItem.menuItemId = billEntry.menuItemId;