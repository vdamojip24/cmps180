CREATE OR REPLACE FUNCTION reduceSomeCostsFunction(maxVisitCount Integer) RETURNS INTEGER AS $$
	DECLARE --Declare the variables needed
		theCost NUMERIC (6,2);
		theStatus char(1);
		theVisitId int;
		rowsUpdated int;
		updatedRowsCounter int;
	DECLARE c CURSOR FOR --declare the cursor for the information we fetch
		Select cost, status,visitId from Customer C, Visit V WHERE C.custId = V.custId ORDER BY CASE 
			WHEN status = 'H' THEN 1 
			WHEN status = 'M' THEN 2 
			WHEN status = 'L' THEN 3 END, joinDate;
	BEGIN 
		OPEN c;
		updatedRowsCounter = 0;--count of how many rows updated
		WHILE(maxVisitCount > 0)--terminating condition of while loops
		LOOP
			FETCH c INTO theCost, theStatus, theVisitId;
			EXIT WHEN NOT FOUND;--exits loop when there is nothing to fetch
			IF theStatus = 'H' THEN 
				UPDATE Visit SET cost = 0.9*theCost WHERE visitId = theVisitId AND theCost IS NOT NULL;
				updatedRowsCounter = updatedRowsCounter + 1;  
			END IF;
			IF theStatus = 'M' THEN
				UPDATE Visit SET cost = 0.95*theCost WHERE visitId = theVisitId AND theCost IS NOT NULL;
				updatedRowsCounter = updatedRowsCounter + 1; 
			END IF;
			IF theStatus = 'L' THEN
				UPDATE Visit SET cost = 0.99*theCost WHERE visitId = theVisitId AND theCost IS NOT NULL;
				updatedRowsCounter = updatedRowsCounter + 1;  
			END IF;
			maxVisitCount = maxVisitCount - 1; --decrement counter for while loop condition
		END LOOP;
		GET DIAGNOSTICS rowsUpdated = ROW_COUNT;
		CLOSE c;
		RETURN updatedRowsCounter;
	END;
$$ LANGUAGE plpgsql;




