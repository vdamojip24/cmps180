--foreign key constraints for 2.3
insert into visit(visitID, dinnertableID) values(100,100);
insert into visit(visitID, custID) values(100,100);
insert into visit(visitID, serverID) values(100,100);

--general constraints for 2.4
update menuItem set price = 100 where price = 112.23;
update menuItem set price = -9 where price = 4.25;
update visit set custArrive = '2017-12-20 08:08:15' where custArrive = '2018-12-20 08:08:15';
update visit set custArrive = '2019-12-20 09:13:01' where custArrive = '2018-12-20 09:13:01';
update dinnertable set numSeats = 10 where dinnertableid = 1;
update dinnertable set numSeats = -9 where dinnertableid = 1;



