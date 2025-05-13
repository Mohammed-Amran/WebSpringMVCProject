package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DAO.*;
import com.example.model.*;

@Controller
public class addToCartController {

	
	@GetMapping("/addToCartController")
	public String addItemsToCart(@RequestParam Map<String, String> req,  HttpServletRequest request, HttpServletRequest response) {
		
	String destination = "";	
		
     HttpSession session = request.getSession(false);
		
		String email = (String) session.getAttribute("email");
		 
		
		//3 things are required to be inserted into the Cart!, :
		     // I. The itemName
		     // II. The selectedQuantity of the item
		     // III. The id of the user that has added this item into the Cart.
		
	/*I*/ String itemName = req.get("itemName");
	
	/*II*/String strSelectedQuantity = req.get("selectedQuantity");
		  int intSelectedQuantity = Integer.parseInt(strSelectedQuantity);
	
		  
		  
  /*III*/    //retrieving the id of the user:
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  //2nd: Access the 'retrieveId()' method via the 'daoObj':
          String strId =  daoObj.retrieveId(email);
		  int intId = Integer.parseInt(strId);
		
		  
		 //Inserting the (id, itemName, selectedQuantity) into the cartItems table.
        		  
         //1st: Instantiating an object from the 'DoaAddToCart' class.
         daoCart daoAddToCartObj = new daoCart();
         
         
         //2nd: calling the 'insertIntoCartItem' method via the 'doaAddToCartObj'.
        boolean isInserted = daoAddToCartObj.insertIntoCartItem(intId, itemName, intSelectedQuantity);
		
       
        
		if(isInserted) {
			
			//1st:
			//retrieving the items number in the 'cartItems' table.
			int itemsCount = daoAddToCartObj.getCartItemCount(intId);
			
			session.setAttribute("cartCounter", itemsCount); 
			
			
			//2nd:
			//getting the Items from the cartItems table.
			
			//I.: Instantiating an object from the daoCart class.
			daoCart daoCartObj = new daoCart();
			
			//II.: Accessing the 'getCartItemsByUserId' method - to retrieve the items in the cart for that specific user.
		    try {
				
		    	List<cartItems> retrievedItems = daoCartObj.getCartItemsByUserId(intId);
		    	
		    	session.setAttribute("retrievedCartItems", retrievedItems);
		    	
		    	destination = "view/customer";
		    	
		    	
			} 
		    catch (Exception e) {
				
				String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
				session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
				
				
				destination = "view/customer";
			}
			
			
			
			
					 
		}
		else {
			
			String addToCartError = "Failed to Add Item into Cart!";
			
			session.setAttribute("addToCarErrorMessage", addToCartError);
			
			
			destination = "view/customer";
		}
		
		
		
		
		return destination;
		
		
	}//closing brace of the 'addItemsToCart' method.s
	
	
}//closing brace of the class.
