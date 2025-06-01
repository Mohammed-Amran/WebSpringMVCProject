package com.example.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.*;

public class DaoCart {

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



  
  //This method inserts items into 'cartItems' table
  public boolean insertIntoCartItem(int userId, int itemId, String itemName, int selectedQuantity, int itemPrice) {
      
      String sql = "INSERT INTO cartItems (userId, itemId, itemName, selectedQuantity, itemPrice) VALUES (?, ?, ?, ?, ?)";

      try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
          
          stmt.setInt(1, userId);
          stmt.setInt(2, itemId);
          stmt.setString(3, itemName);
          stmt.setInt(4, selectedQuantity);
          stmt.setInt(5, itemPrice);

          System.out.println("Trying to insert into cartItems: USER-ID=" + userId + ", Item=" + itemName + ", Quantity=" + selectedQuantity + ", itemPrice=" + itemPrice);

          int rowsInserted = stmt.executeUpdate();

          return rowsInserted > 0; // return true if insertion was successful

      }
      catch (SQLException e) {
      	
          e.printStackTrace();
          
          return false;
      }
      
      
  }//closing brace of the 'insertIntoCartItem()' method.


  
//=====================================================================================================-=============		    
  
  
  //This method retrieves the numbers of items in the 'carItems' table.
  public int getCartItemCount(int userId) {
      
  	String sql = "SELECT COUNT(*) FROM cartItems WHERE userId = ?";

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
      
  }//closing brace of the 'getCartItemCount()' method.	    
  
  
  
//=====================================================================================================-=============	   
  
  //This method retrieves items in the 'cartItems' table for a specific user using the userId.
  public List<CartItems> getCartItemsByUserId(int userId) throws SQLException {
	  
	   
	   ArrayList<CartItems> itemsList = new ArrayList<>();
	  
	   
	   String sql = "SELECT userId, itemId, itemName, selectedQuantity, itemPrice FROM cartItems WHERE userId = ?";
	    
	   
	    try (Connection conn = getConnection();  PreparedStatement stmt = conn.prepareStatement(sql)) {
	         
	        stmt.setInt(1, userId);
	       
	        ResultSet rs = stmt.executeQuery();
	       
	        
	        while (rs.next()) {
	     
	        	
	        	//Instantiating an object from the 'cartItems' table.
	            CartItems item = new CartItems();
	            
	            item.setUserId(rs.getInt("userId")); 
	            item.setItemId(rs.getInt("itemId"));
	            item.setItemName(rs.getString("itemName"));
	            item.setSelectedQuantity(rs.getInt("selectedQuantity"));
	            item.setItemPrice(rs.getDouble("itemPrice"));
	            
	            itemsList.add(item);
	        }
	        
	        
	        
	    }
	    
	    
	    return itemsList;
	    
	}//closing brace of the 'getCartItemByUserId' method.
  
  
  
//=====================================================================================================-============= 
  
  
   //This method clears out all items in the cart that are added with reference to the user, using the userId.
	public void clearCart(int userId) {
		
	    String sql = "DELETE FROM cartItems WHERE userId = ?";

	    try (Connection conn = getConnection();
	    		
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	         
	        stmt.setInt(1, userId);
	        stmt.executeUpdate();

	    } 
	    catch (SQLException e) {
	    	
	        e.printStackTrace();
	    }
	    
	}//closing brace of the 'clearCart()' method.
	
	

	
	
//===================================================================================================================
	

	//This method updates the selectedQuantity attribute in the 'cartItems' table - by incrementing it by 1.
	public boolean IncrementUpdateCartItemQuantity(int userId, int itemId) {
	  
		String sql = "UPDATE cartItems SET selectedQuantity = selectedQuantity + 1 WHERE userId = ? AND itemId = ?";

	    try (Connection conn = getConnection(); 
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, userId);
	        stmt.setInt(2, itemId);
	        

	        System.out.println("Incrementing quantity for USER-ID=" + userId + ", ITEM-ID=" + itemId );

	        int rowsUpdated = stmt.executeUpdate();
	        return rowsUpdated > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	    
	    
	}//closing brace of the 'IncrementUpdateCartItemQuantity()' methods.

	
	
	
//===================================================================================================================
	

	//This method updates the selectedQuantity attribute in the 'cartItems' table - by decrementing it by 1.
	public boolean decrementUpdateCartItemQuantity(int userId, int itemId) {
	   
		// Firstly, check the current selectedQuantity
	    String checkQtySql = "SELECT selectedQuantity FROM cartItems WHERE userId = ? AND itemId = ?";
	    
	    
	    try (Connection conn = getConnection();
	    		
	         PreparedStatement checkStmt = conn.prepareStatement(checkQtySql)) {

	        checkStmt.setInt(1, userId);
	        checkStmt.setInt(2, itemId);
	        
	        ResultSet rs = checkStmt.executeQuery();

	        if (rs.next()) {
	        	
	            int currentQty = rs.getInt("selectedQuantity");
	            
	            //Checking if the current selectedQuantity is less than 2.
	            if (currentQty <= 1) {
	            	
	                // Remove the item if selectedQuantity is less than 2.
	                return removeCartItem(userId, itemId);
	                
	            } 
	            else {
	            	
	                // Decrement quantity
	                String updateSql = "UPDATE cartItems SET selectedQuantity = selectedQuantity - 1 WHERE userId = ? AND itemId = ?";
	                
	                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
	                	
	                    updateStmt.setInt(1, userId);
	                    updateStmt.setInt(2, itemId);
	                    
	                    return updateStmt.executeUpdate() > 0;
	                    
	                }
	                
	            }
	            
	        } 
	        else {
	            
	        	return false; // Item not found
	        }
	    } 
	    catch (SQLException e) {
	       
	    	e.printStackTrace();
	       
	    	return false;
	    }
	    
	}

	
	

//===================================================================================================================

	
	//This method removes the item in the cart using userId & itemId.
	public boolean removeCartItem(int userId, int itemId) {
		
	    String sql = "DELETE FROM cartItems WHERE userId = ? AND itemId = ?";
	    
	    try (Connection conn = getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        stmt.setInt(1, userId);
	        stmt.setInt(2, itemId);
	        
	        
	        System.out.println("Removing item: USER-ID=" + userId + ", ITEM-ID=" + itemId);
	        
	        int rowsDeleted = stmt.executeUpdate();
	        return rowsDeleted > 0;
	        
	    } 
	    catch (SQLException e) {
	       
	    	e.printStackTrace();
	       
	    	return false;
	    }
	    
	}//closing brace of the 'removeCartItem()' method
	
	
	
//==================================================================================================================
	
	
	
	
	
	
	
	
	
	
}//closing brace of the class.
