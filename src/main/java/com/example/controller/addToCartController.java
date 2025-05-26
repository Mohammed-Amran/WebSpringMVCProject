package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DAO.*;
import com.example.model.*;

@Controller
public class addToCartController {

	
	
	@GetMapping("/getBackToCustomerPage")
	public String showCustomerPage(HttpServletRequest request) {
	    
		
	    return "view/customer";
	}
	
	
	
	
	@PostMapping("/addToCartController")
	public String addItemsToCart(@RequestParam Map<String, String> req,  HttpServletRequest request, HttpServletRequest response, RedirectAttributes redirectAttributes) {
		
		//String destination = "";
		
     HttpSession session = request.getSession(false);
		
		
		 
		
		//3 things are required to be inserted into the Cart!, :
		     // I. The itemName
		     // II. The selectedQuantity of the item
		     // III. The id of the user that has added this item into the Cart.
		
	/*I*/ String itemName = req.get("itemName");
	      String itemType = req.get("itemType");
	
	/*II*/String strSelectedQuantity = req.get("selectedQuantity");
		  int intSelectedQuantity = Integer.parseInt(strSelectedQuantity);
	
		  
		  
  /*III*/    //retrieving the id of the user:
		
		 
		
		  //1st: Access the 'retrieveId()' method via the 'daoObj':
          String strId = (String) session.getAttribute("userId");
		  int intId = Integer.parseInt(strId);
		
		  //3rd: Retrieving the itemId.
		  DaoBreads breadObj = new DaoBreads();
		  DaoCakes desertObj = new DaoCakes();
		  
		  int itemId = 0;
		  
		 try {
			
			 if("Bread".equals(itemType)) {
				 
				 itemId = breadObj.getBreadIdByName(itemName);
			 }
			 else if("Desert".equals(itemType)) {
				 
				 itemId = desertObj.getDesertIdByName(itemName);
			 }
			  
			 
			  
			 
		} catch (Exception e) {
			
			System.out.print(e);
		} 
		 
		  
		  
		  
		 //Inserting the (userId, itemId, itemName, selectedQuantity) into the cartItems table.
        		  
         //1st: Instantiating an object from the 'DoaAddToCart' class.
         daoCart daoAddToCartObj = new daoCart();
         
         
         //2nd: calling the 'insertIntoCartItem' method via the 'doaAddToCartObj'.
        boolean isInserted = daoAddToCartObj.insertIntoCartItem(intId, itemId, itemName, intSelectedQuantity);
		
       
        
		if(isInserted) {
			
			//1st:
			//retrieving the items number in the 'cartItems' table.
			
			//I.: Instantiating an object from the daoCart class.
			daoCart daoCartObj = new daoCart();
			
			int itemsCount = daoCartObj.getCartItemCount(intId);
			
			session.setAttribute("cartCounter", itemsCount); 
			
			
			//2nd:
			//getting the Items from the cartItems table.
			
			
			
			//II.: Accessing the 'getCartItemsByUserId' method - to retrieve the items in the cart for that specific user.
		    try {
				
		    	List<cartItems> retrievedItems = daoCartObj.getCartItemsByUserId(intId);
		    	
		    	session.setAttribute("retrievedCartItems", retrievedItems);
		    	
		    	
		    	return "redirect:/getBackToCustomerPage"; 
		    	
		    	//destination = "view/customer";
		    	
			} 
		    catch (Exception e) {
				
				String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
				session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
					
				return "redirect:/getBackToCustomerPage";
				//destination = "view/customer";
			}
			
			
							 
		}
		else {
			
			String addToCartError = "Failed to Add Item into Cart!";
			
			session.setAttribute("addToCarErrorMessage", addToCartError);
			
			return "redirect:/getBackToCustomerPage";
			//destination = "view/customer";
						
		}
		
		
				
		//return destination;

		
		
	}//closing brace of the 'addItemsToCart' method.
	
	
}//closing brace of the class.
