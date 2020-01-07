ALTER TABLE menuItem
ADD CONSTRAINT positive_price 
CHECK (price > 0);

ALTER TABLE visit 
ADD CONSTRAINT custArriveCheck 
CHECK (custArrive <= custDepart);

ALTER TABLE dinnerTable
ADD CONSTRAINT checkInUse 
CHECK((inUse IS NOT NULL AND numSeats > 0) OR inUse is NULL);