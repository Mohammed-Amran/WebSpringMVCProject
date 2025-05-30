package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Orders;


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
 
 
 
 
 
//==============================================================================================================
 
 
 
//This method retrieves items from the 'orders' table.
 public List<Orders> getOrders(int userId) throws SQLException {

	 //Creating an array list to save the the orders object:
     ArrayList<Orders> ordersList = new ArrayList<>();

     String sql = "SELECT orderId, userId, userPhoneNo, itemId, itemName, selectedQuantity, itemPriceSum, location, deliveryAddress, status FROM orders WHERE userId = ?";

     try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
    	 
    	 stmt.setInt(1, userId);	 
		 
         ResultSet rs = stmt.executeQuery();

         while (rs.next()) {
            
         	//Instantiating an object from the 'orders' class.
         	Orders orderItem = new Orders();

         	orderItem.setOrderId(rs.getInt("orderId"));
         	orderItem.setUserId(rs.getInt("userId"));
         	orderItem.setUserPhoneNo(rs.getString("userPhoneNo"));
         	orderItem.setItemId(rs.getInt("itemId"));
         	orderItem.setItemName(rs.getString("itemName"));
         	orderItem.setSelectedQuantity(rs.getInt("selectedQuantity"));
         	orderItem.setItemPriceSum(rs.getInt("itemPriceSum"));
         	orderItem.setLocation(rs.getString("location"));
         	orderItem.setDeliveryAddress(rs.getString("deliveryAddress"));
         	orderItem.setStatus(rs.getString("status"));

             ordersList.add(orderItem);
         }

     }

     return ordersList;

 } // closing brace of the getBreads method
 
 
	
 
 
 //This method retrieves the numbers of items in the 'orders' table.
 public int getOrderedItemsCount(int userId) {
     
 	String sql = "SELECT COUNT(*) FROM orders WHERE userId = ?";

     try (Connection conn = getConnection();
          
     		PreparedStatement stmt = conn.prepareStatement(sql)) {
          
         stmt.setInt(1, userId);
         
         ResultSet rs = stmt.executeQuery();

         if (rs.next()) {
         	
             return rs.getInt(1);
         }

     } 
     catch (SQLException e) {
     	
         e.printStackTrace();
     }

     return 0; // Return 0 if error occurs
     
 }//closing brace of the 'getOrderedItemsCount()' method.
 
 
 
 
 
	
	
}//closing brace of the class.
