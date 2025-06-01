package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.DAO.*;
import com.example.model.*;


@Controller
public class CheckoutController {


	//This method opens the checkout modal and retrieves the items in the 'cartItems' table into the Checkout modal. 
	@GetMapping("/goToCheckout")
	public String goToCheckout(HttpServletRequest request) {
		
		
		//Instantiating a session object
		HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		
		
		//1. Retrieving the userId from the session scope & parsing it into Integer:
		int userId = (Integer) session.getAttribute("userId");
		  
		
		
		//2. Instantiating an object from the 'daoCart' class.
		DaoCart cartObj = new DaoCart();
		 

		
		try {
			
				
			 //I. Retrieving items from the 'cartItems' table;
			 List<CartItems> retrievedItemsForCheckout = cartObj.getCartItemsByUserId(userId);
				
			 
			 //II. saving the retrieved items into the session scope:
		 	 session.setAttribute("retrievedItemsForCheckout", retrievedItemsForCheckout);
			
		 	 
             //III. This one below, closes the cart modal and opens the Checkout modal for us: 
		     session.setAttribute("showCheckoutModal", true);
		 	 
		     
		     return "view/customer";
		 	
		} 
		catch (Exception e) {

			
			String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
			session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
			
		}
		

		
		return "view/customer";
		
		
		
	}//closing brace of the 'gotToCheckout()' method.	
	
	
	
	
}//closing brace of the class.
