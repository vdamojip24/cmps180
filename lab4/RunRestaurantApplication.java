import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the RestaurantApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunRestaurantApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse180-db.lt.ucsc.edu/vdamojip",
                                                     "vdamojip",
                                                     "intersection45lock");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the RestaurantApplication class
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            
            RestaurantApplication app = new RestaurantApplication(connection);//creates a restaurantApplication object

            /*test cases for the testing section*/
            System.out.println("*** Output of getFrequentlyOrderedMenuItems when the parameter numMenuItemsOrdered is 65: ***");
            List<Integer> menuItemIds = app.getFrequentlyOrderedMenuItems(65);
            for(int menuItemId : menuItemIds)
            {
                System.out.println(menuItemId);
            }
            
            System.out.println("*** Output of updateServerName when serverID is 3 and newServerName is 'Phileas Fogg': ***");
            System.out.println(app.updateServerName(3,"Phileas Fogg"));

            System.out.println("*** Output of updateServerName when serverID is 10 and newServerName is 'John Smith': ***");
            System.out.println(app.updateServerName(10,"John Smith"));

            System.out.println("*** Output of reduceSomeVisitCosts function which is the number of costs reduced (total number of customers whose status was updated),which also is the number of rows updated in the Visit table when maxVisitCost is 10: *** \n" + app.reduceSomeVisitCosts(10));
            System.out.println("*** Output of reduceSomeVisitCosts function which is the number of costs reduced (total number of customers whose status was updated),which also is the number of rows updated in the Visit table when maxVisitCost is 95: *** \n" + app.reduceSomeVisitCosts(95));


            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
