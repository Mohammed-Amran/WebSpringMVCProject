package com.example.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.*;

import com.example.model.*;



@Controller
public class orderController {


//This method retrieves the selected items from the checkout modal & inserts them into the 'orders' table.
@PostMapping("/orderItems")	
 protected String setOrder(@RequestParam Map<String, String> req, HttpServletRequest request, ModelAndView model) {
	 
	 
	
	//Instantiating a session object	
    HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
	
    
/*----1-----= Retrieving the Delivery Information from the Checkout modal =----------*/	
    
    String location = req.get("location");
    String address = req.get("address");
    
  
    
/*----2-----= Retrieving the userId =----------*/    
    
  
    //Retrieve the userId from the session scope & parsing it into Integer:
    int userId = (Integer) session.getAttribute("userId");

    
 
/*----3-----= Retrieving the phoneNo =----------*/    
	
    //Retrieve the phoneNo from the session scope & parsing it into String:
    String phoneNo = (String) session.getAttribute("phoneNo");
    
    
    
/*----4-----= Retrieving the items in the 'cartItems' table =----------*/    
	
    
    
    
   
    @SuppressWarnings("unchecked")
	List<CartItems> orderedItems = (List<CartItems>) session.getAttribute("retrievedItemsForCheckout");    
    
	
	// Handle case when session attribute is null
	if (orderedItems == null || orderedItems.isEmpty()) {
		
	    model.addObject("error", "Your cart is empty or expired. Please add items to proceed.");
	    
	    return "view/customer";
	    
	}
	
	
    
    //Instantiating an object from the 'DaoOrders' class:
    DaoOrders ordersObj = new DaoOrders();
    
    
    boolean allInserted = true;
    
    for(CartItems cartObj : orderedItems) {
    	
    	 int itemId = cartObj.getItemId();
    	 
    	 String itemName = cartObj.getItemName();
    	 
    	 int selectedQuantity = cartObj.getSelectedQuantity();
    	 
    	 double itemPrice = cartObj.getItemPrice();
    	 
    	 
    	 double itemPriceSum = itemPrice * selectedQuantity;
    	 
    	//Inserting the items of the 'cartItems' table into 'orders' table:
    	 boolean isInsertedIntoOrders = ordersObj.insertIntoOrders(userId, phoneNo, itemId, itemName, selectedQuantity, itemPriceSum, location, address);
    	 
    	if(!isInsertedIntoOrders) {
    		
    		allInserted = false;
    		
    		break;
    	}
    	 
    }
    
    
    if (!allInserted) {
    	
        model.addObject("insertionIntoOrdersFailedMessage", "An error occurred while inserting items into the orders table.");
        
     
    }
    else {
    	
        model.addObject("successMessage", "Your order has been placed successfully.");
     
        
        try {
    		
    		
    		List<Orders> retrievedItemsIntoInbox = ordersObj.getOrders(userId);
    		
    		session.setAttribute("retrievedOrderedItems", retrievedItemsIntoInbox);
    		 		
    	} 
    	catch (Exception e) {
    		
    		e.printStackTrace();
    	}
      
    }
 
    
    
    //clear cart from session after order is placed
    session.removeAttribute("retrievedCartItems");
    
    //Instantiating an object from the 'cartItems' class.
    DaoCart cartObj = new DaoCart();
    
    //clearing the items for the user in the 'cartItems' table:
    cartObj.clearCart(userId);
    
    //clear cart counter from session after order is placed
    session.removeAttribute("cartCounter");
    

    
    int orderedItemsCounter = ordersObj.getOrderedItemsCount(userId);
    
    session.setAttribute("inboxCounter", orderedItemsCounter);

    
    
    return "view/customer";
    
	
 }//closing brace of the 'getOrders()' method.
	
	












	
	
}//closing brace of the class.
