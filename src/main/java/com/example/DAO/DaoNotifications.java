package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Notifications;


public class DaoNotifications {

	
//==================================================================================================================	

	 //JDBC URL for MySQL connection
	 private final String jdbcURL = "jdbc:mysql://localhost:3306/bakeryweb?useSSL=false&serverTimezone=UTC";
	 private final String jdbcUsername = "root"; // Our MySQL username
	 private final String jdbcPassword = "1234"; // Our MySQL password (

	 
	 // Method to get connection to MySQL Database
	 private Connection getConnection() throws SQLException {
	    
	 	try {
	 		
	         Class.forName("com.mysql.cj.jdbc.Driver"); // Loading the MySQL JDBC driver
	         
	     } 
	 	catch (ClassNotFoundException e) {
	 		
	         e.printStackTrace();
	     }
	 	
	     return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	     
	 }//closing brace of the 'getConnection()' method.

	 
//================================================================================================================== 		
	
	
	 public boolean insertIntoNotifications(int userId, int orderId, String itemName, String deliveryAddress, String status, boolean isRead) {
	     
	     String sql = "INSERT INTO notifications (userId, orderId, itemName, deliveryAddress, status, isRead) VALUES (?, ?, ?, ?, ?, ?)";

	     try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
	         
	    	 stmt.setInt(1, userId);
	         stmt.setInt(2, orderId);
	         stmt.setString(3, itemName);
	         stmt.setString(4, deliveryAddress);
	         stmt.setString(5, status);
	         stmt.setBoolean(6, isRead);
	         
	        
	         int rowsInserted = stmt.executeUpdate();

	         return rowsInserted > 0; // return true if insertion was successful

	     }
	     catch (SQLException e) {
	     	
	         e.printStackTrace();
	         
	         return false;
	     }
	     
	     
	 }
	
	

	 // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	 
	 
	 public List<Notifications> getUnReadNotifications(int userId, boolean isRead ) throws SQLException {

		 //Creating an array list to save the notifications object:
	     ArrayList<Notifications> notificationsList = new ArrayList<>();

	     
	     String sql = "SELECT userId, orderId, itemName, deliveryAddress, status, isRead FROM notifications WHERE userId = ? AND isRead = ?";

	     try (Connection conn = getConnection(); 
	    	  
	    	  PreparedStatement stmt = conn.prepareStatement(sql)) {
	    	 
	    	 
	    	 stmt.setInt(1, userId);		    	
	    	 stmt.setBoolean(2, isRead);
			 
	    	 
	         ResultSet rs = stmt.executeQuery();

	         
	         while (rs.next()) {
	            
	         	//Instantiating an object from the 'Notifications' class:
	        	 
	         	Notifications notiMessage = new Notifications();

	         	
	         	notiMessage.setUserId( rs.getInt("userId") );
	         	notiMessage.setOrderId( rs.getInt("orderId") );
	         	notiMessage.setItemName( rs.getString("itemName") );
	         	notiMessage.setDeliveryAddress( rs.getString("deliveryAddress") );
	         	notiMessage.setStatus( rs.getString( "status" ) );
	         	notiMessage.setRead( rs.getBoolean("isRead") );
	         	
	         	

	             notificationsList.add(notiMessage);
	         }

	     }

	     return notificationsList;

	 } 
	
	//=============================================================================================================
	 
	 //This method is used to update the 'isRead' fields from False into True:
	 public boolean updateIsRead(int userId, int orderId, boolean currentIsRead, boolean updateIsRead) {
			
		   String sql = "UPDATE notifications SET isRead = ? WHERE userId = ? AND orderId = ? AND isRead = ?";
		 
		   try (Connection conn = getConnection();
		        
				PreparedStatement stmt = conn.prepareStatement(sql)) {
		     
		        stmt.setBoolean(1, updateIsRead);
		        stmt.setInt(2, userId);
		        stmt.setInt(3, orderId);
		        stmt.setBoolean(4, currentIsRead);
		     
		        int rowsAffected = stmt.executeUpdate();
		     
		     // Return true if exactly 1 row was updated
		     return rowsAffected == 1;
		     
		    } 
		    catch (SQLException e) {
		    	
		     e.printStackTrace();
		     return false;
		     
		 }
		   
		}
	 
	 //===============================================================================================================
	 
	 
	 //This method gets the unReadNotifications counter from the 'notifications' table:
	 public int getUnreadNotificationsCount(int userId, boolean isRead) {
	     
		 	String sql = "SELECT COUNT(*) FROM notifications WHERE userId = ? AND isRead = ?";

		     try (Connection conn = getConnection();
		          
		     	  PreparedStatement stmt = conn.prepareStatement(sql)) {
		          
		         stmt.setInt(1, userId);
		         stmt.setBoolean(2, isRead);
		         
		         ResultSet rs = stmt.executeQuery();

		         if (rs.next()) {
		         	
		             return rs.getInt(1);
		         }

		     } 
		     catch (SQLException e) {
		     	
		         e.printStackTrace();
		     }

		     return 0; // Return 0 if error occurs
		     
		 }
	 
	
	 
	 
	 
	 
	 
	
}//closing brace of the class.
