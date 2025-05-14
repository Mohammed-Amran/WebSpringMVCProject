package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.breads;

public class DaoBreads {

	
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
	
	
	    //Method to retrieve breads items from the 'breads' table.
	    public List<breads> getBreads() throws SQLException {

	        ArrayList<breads> itemsList = new ArrayList<>();

	        String sql = "SELECT itemName, itemPrice, imgURL, itemDesc FROM breads";

	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                breads item = new breads();

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
