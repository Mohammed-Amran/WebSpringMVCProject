package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoOrders {

	
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

 
 
 
 //This method inserts items into 'orders' table
 public boolean insertIntoOrders(int userId, String userPhoneNo, int itemId, String itemName, int selectedQuantity, double itemPriceSum, String location, String deliveryAddress) {
     
     String sql = "INSERT INTO orders (userId, userPhoneNo, itemId, itemName, selectedQuantity, itemPriceSum, location, deliveryAddress) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

     try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
         
         stmt.setInt(1, userId);
         stmt.setString(2, userPhoneNo);
         stmt.setInt(3, itemId);
         stmt.setString(4, itemName);
         stmt.setInt(5, selectedQuantity);
         stmt.setDouble(6, itemPriceSum);
         stmt.setString(7, location);
         stmt.setString(8, deliveryAddress);

         
         System.out.println("Trying to insert into cartItems: USER-ID=" + userId + ", userPhoneNo=" + userPhoneNo + ", itemId=" + itemId + ", itemName=" + itemName + ", selectedQuantity=" + selectedQuantity + ", itemPriceSum=" + itemPriceSum + ", location=" + location + ", deliveryAddress=" + deliveryAddress);

         int rowsInserted = stmt.executeUpdate();

         return rowsInserted > 0; // return true if insertion was successful

     }
     catch (SQLException e) {
     	
         e.printStackTrace();
         
         return false;
     }
     
     
 }//closing brace of the 'insertIntoCartItem()' method.
 
 
 
 
 
 
 
	
	
	
}//closing brace of the class.
