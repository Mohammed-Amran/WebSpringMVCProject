package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Deserts;


public class DaoDeserts {


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
	
	

 //This method to retrieves desert items from the 'deserts' table.
   public List<Deserts> getDesert() throws SQLException {

       ArrayList<Deserts> itemsList = new ArrayList<>();

       String sql = "SELECT desertsId, itemName, itemPrice, imgURL, itemDesc, itemType FROM deserts";

       try (Connection conn = getConnection();
    		   
            PreparedStatement stmt = conn.prepareStatement(sql);
    		   
            ResultSet rs = stmt.executeQuery() ) {

           while (rs.next()) {
               Deserts item = new Deserts();

               item.setId(rs.getInt("desertsId"));
               item.setItemName(rs.getString("itemName"));
               item.setItemPrice(rs.getDouble("itemPrice"));
               item.setImgURL(rs.getString("imgURL"));
               item.setItemDesc(rs.getString("itemDesc"));
               item.setItemType(rs.getString("itemType"));

               itemsList.add(item);
           }

       }

       return itemsList;

   } // closing brace of the getBreads method   
   
   
  //This method retrieves back the desert item id using the itemName.
   public int getDesertIdByName(String itemName) throws SQLException {
       
   	int desertId = -1; // Default value if not found
       
       String sql = "SELECT desertsId FROM deserts WHERE itemName = ?";
       
       try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            
           stmt.setString(1, itemName);
           
           try (ResultSet rs = stmt.executeQuery()) {
               if (rs.next()) {
            	   
            	   desertId = rs.getInt("desertsId");
            
               }
           }
       }
       
       return desertId;
   } 
   
 
   
   
 //==============================================================================================================	    
   
   
	  //Retrieving the itemPrice of a bread item.
		public int getDesertItemPrice(String itemName) {
			
			
			String sql = "SELECT itemPrice FROM deserts WHERE itemName = ?";
			
			try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

		      stmt.setString(1, itemName);
		     

		      try (ResultSet rs = stmt.executeQuery()) {
		      	
		          if (rs.next()) {
		          	
		              return rs.getInt("itemPrice");
		              
		          }
		      }

		  } 
			catch (SQLException e) {
				
		      e.printStackTrace();
		  }

		  return -1; // return Unknown id, if id not found or error occurs
			
			
			
		}//closing brace of the 'getDesertItemPrice()' method.	   
   
   
   
	
	
}//closing brace of the class.
