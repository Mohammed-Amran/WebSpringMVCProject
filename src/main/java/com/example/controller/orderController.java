package com.example.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DAO.*;

import com.example.model.*;



@Controller
public class orderController {

	
	@GetMapping("/accessInboxModal")
	protected String accessChartModal(HttpServletRequest request, Model model) {
		
		
		//Instantiating a session object:
	    HttpSession session = request.getSession(false);
		
	    //Instantiating an object from the 'DaoOrders' class:
		  DaoOrders ordersObj = new DaoOrders();
		    
		  int userId = (Integer) session.getAttribute("userId");
		  
		  try {
			
			  List<Orders> retrievedItemsIntoInbox = ordersObj.getOrders(userId);
		      
		      session.setAttribute("retrievedOrderedItems", retrievedItemsIntoInbox);
		      
		      // Update inbox counter
		      int orderedItemsCounter = ordersObj.getOrderedItemsCount(userId);
			    
			  session.setAttribute("inboxCounter", orderedItemsCounter);
			  
			  
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		//This Triggers opening the Inbox Modal
		model.addAttribute("showInboxModal", true);
		
		return "view/customer";
		
	}//closing brace of the 'accessChartModal()' method.
	
	
	
	

	@PostMapping("/orderItems")
	protected String setOrder(@RequestParam Map<String, String> req, HttpServletRequest request, RedirectAttributes redirectAttrs) {

		//Instantiating a session object:
	    HttpSession session = request.getSession(false);

	    //Get the inputed 'location' & 'address' from the user:
	    String location = req.get("location");
	    
	    String address = req.get("address");

	    //Retrieve the 'userId' from the session scope:
	    int userId = (Integer) session.getAttribute("userId");
	  
	    //Retrieve the 'phoneNo' from the session scope:
	    String phoneNo = (String) session.getAttribute("phoneNo");

	    
	    //Retrieve the carItems that the user tend to order from session scope:
	    @SuppressWarnings("unchecked")
	    List<CartItems> orderedItems = (List<CartItems>) session.getAttribute("retrievedItemsForCheckout");

	    
	    if (orderedItems == null || orderedItems.isEmpty()) {
	    	
	        redirectAttrs.addFlashAttribute("error", "Your cart is empty or expired. Please add items to proceed.");
	        
	        return "redirect:/customerHome";
	        
	    }

	    //Instantiating an object from the 'DaoOrders' class:
	    DaoOrders ordersObj = new DaoOrders();

	    boolean allInserted = true;

	    
	    for (CartItems cartObj : orderedItems) {
	    	
	    	
	        int itemId = cartObj.getItemId();
	        
	        String itemName = cartObj.getItemName();
	        
	        int selectedQuantity = cartObj.getSelectedQuantity();
	        
	        double itemPrice = cartObj.getItemPrice();
	        
	        double itemPriceSum = itemPrice * selectedQuantity;

	        boolean isInsertedIntoOrders = ordersObj.insertIntoOrders(userId, phoneNo, itemId, itemName, selectedQuantity, itemPriceSum, location, address);

	        if (!isInsertedIntoOrders) {
	        	
	            allInserted = false;
	            
	            break;
	            
	        }
	        
	    }

	    if (!allInserted) {
	    	
	        redirectAttrs.addFlashAttribute("insertionIntoOrdersFailedMessage", "An error occurred while placing your order.");
	        
	    } 
	    else {
	    	
	        redirectAttrs.addFlashAttribute("successMessage", "Your order has been placed successfully.");

	        try {
	        	
	            List<Orders> retrievedItemsIntoInbox = ordersObj.getOrders(userId);
	            
	            session.setAttribute("retrievedOrderedItems", retrievedItemsIntoInbox);
	            
	        } 
	        catch (Exception e) {
	        	
	            e.printStackTrace();
	            
	        }
	        
	    }

	    // Clear session cart and DB cart table
	    session.removeAttribute("retrievedCartItems");
	    
	    DaoCart cartObj = new DaoCart();
	    
	    cartObj.clearCart(userId);
	    
	    session.removeAttribute("cartCounter");

	    // Update inbox counter
	    int orderedItemsCounter = ordersObj.getOrderedItemsCount(userId);
	    
	    session.setAttribute("inboxCounter", orderedItemsCounter);

	    // Redirect to customer homepage instead of returning view directly
	    return "redirect:/customerHome";
	    
	} //closing brace of the 'setOrder()' method.

	
	
	@GetMapping("/customerHome")
	protected String showCustomerHome(HttpServletRequest request, Model model) {

	    HttpSession session = request.getSession(false);
	    
	    if (session == null || session.getAttribute("userId") == null) {
	       
	    	model.addAttribute("sessionExpirationMessage", "Session expired. Please log in again.");
	    	
	        return "view/customerLoginPage";
	    }

	    
	  //Instantiating an object from the 'DaoOrders' class:
	  DaoOrders ordersObj = new DaoOrders();
	    
	  int userId = (Integer) session.getAttribute("userId");
	  
	  try {
		
		  List<Orders> retrievedItemsIntoInbox = ordersObj.getOrders(userId);
	      
	      session.setAttribute("retrievedOrderedItems", retrievedItemsIntoInbox);
	      
	      // Update inbox counter
	      int orderedItemsCounter = ordersObj.getOrderedItemsCount(userId);
		    
		  session.setAttribute("inboxCounter", orderedItemsCounter);
		  
		  
	} catch (Exception e) {
		
		e.printStackTrace();
	}

	    
	    
	    return "view/customer";
	    
	}







	
	
}//closing brace of the class.
