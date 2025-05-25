package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.model.cakes;


public class DaoCakes {


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
	
	

 //Method to retrieve desert items from the 'deserts' table.
   public List<cakes> getDesert() throws SQLException {

       ArrayList<cakes> itemsList = new ArrayList<>();

       String sql = "SELECT id,itemName, itemPrice, imgURL, itemDesc FROM deserts";

       try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {

           while (rs.next()) {
               cakes item = new cakes();

               item.setId(rs.getInt("id"));
               item.setItemName(rs.getString("itemName"));
               item.setItemPrice(rs.getDouble("itemPrice"));
               item.setImgURL(rs.getString("imgURL"));
               item.setItemDesc(rs.getString("itemDesc"));

               itemsList.add(item);
           }

       }

       return itemsList;

   } // closing brace of the getBreads method   
   
   
 
   
   
   
	
	
}//closing brace of the class.
