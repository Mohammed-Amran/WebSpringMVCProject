package com.example.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
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

import com.example.DAO.DaoNotifications;
import com.example.DAO.DaoOrders;

import com.example.model.Orders;

@Controller
public class ownerController {

	
	//This method below opens the 'owner.jsp' page:
	@GetMapping("/accessOwnerLoginPage")
	protected String accessOwnerLoginPage() {
		
		return "view/ownerLoginPage";
		
	}//closing brace of the 'accessOwnerPage()' method.
	
	
	
	@PostMapping("/ownerloginController")
	protected String ownerLoggingIn(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
		
		String destination = "";
		
		String inputedEmail = input.get("email");
		String inputedPassword = input.get("password");
		
		String loginErrorMessage = "";
		
		if(inputedEmail.equals(null) || inputedPassword.equals(null)) {
			
			  
			loginErrorMessage = "Please make sure your email & password are correct";
			model.addAttribute("loginErrorMessage", loginErrorMessage);
			
			destination = "view/ownerLoginPage";
		}
		else if("owner@gmail.com".equals(inputedEmail) && "1122".equals(inputedPassword)) {
			
			//Instantiating a session object: 
			HttpSession session = req.getSession(true);
			
			session.setMaxInactiveInterval(86400); // setting the session for 24 hours.
			
			List<Orders> retrievedOrders = new ArrayList<>();
						
			
			DaoOrders daoOrdersObj = new DaoOrders();
			
			try {
				
				retrievedOrders =  daoOrdersObj.getAllOrders();
				
				session.setAttribute("retrievedOrders", retrievedOrders);
				
				
				//Retrieving the inboxCounter:
				int inboxCounter = daoOrdersObj.getDeliveredOrdersCount();
				
				//Saving the 'inboxCounter' into the session scope:
				session.setAttribute("inboxCounter", inboxCounter);
				
				
				destination = "view/ownerView";
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}
		else {
			
			loginErrorMessage = "Please make sure your email & password are correct";
			model.addAttribute("loginErrorMessage", loginErrorMessage);
			
			destination = "view/ownerLoginPage";
			
		}
		
		
		return destination;
		
	}//closing brace of the 'ownerLoggingIn()' method.
	
	
	
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	
	

	
	@PostMapping("/updateOrderStatus")
	protected String updateOrderStatus(@RequestParam Map<String, String> input, HttpServletRequest req, RedirectAttributes redirectAttrs) {

		//Instantiating a session object:
	    HttpSession session = req.getSession(false);

	    
	    
	    if (session == null) {
	    	
	        redirectAttrs.addFlashAttribute("sessionExpirationMessage", "Sorry! your session expired");
	        return "redirect:/accessOwnerLoginPage";
	        
	    }

	    
	    
	    //1. Getting the inputs from the owner:
	    
	    //I.Getting the orderId:
	    int orderId = Integer.parseInt(input.get("orderId"));
	    
	    
	    //II.Getting the userId:
	    int userId = Integer.parseInt(input.get("userId"));
	    
	    
	    //III. Getting the newStatus:
	    String newStatus = input.get("status");

	    
	    //2. Updating the order status:
	    
	    
	    //I. Instantiating an object from 'DaoOrders' class:
	    DaoOrders ordersObj = new DaoOrders();
	    
	    boolean isStatusUpdated = false;

	    
	    try {
	    	
	        isStatusUpdated = ordersObj.updateOrderStatus(orderId, userId, newStatus);
	        
	    } 
	    catch (Exception e) {
	    	
	        e.printStackTrace();
	    }

	    
	    if (isStatusUpdated) {
	    	
	    	
	    	//Insert into 'notifications':
	    	
	    	//I. Instantiating an object from the 'DaoNotifications' class:
	    	DaoNotifications notifObj = new DaoNotifications();
	    	
	    	//II. Retrieving the 'itemName' & 'deliveryAddress':
	    	String itemName = input.get("itemName");
	    	String deliveryAddress = input.get("deliveryAddress");
	    	
	    	//III. Calling the 'InsertIntoNotifications()' method:
	    	//fields: 'userId', 'orderId', 'itemName', 'deliveryAddress', 'newStatus', 'isRead(should be false)' 
	    	notifObj.insertIntoNotifications(userId, orderId, itemName, deliveryAddress, newStatus, false);
	    	
	    	
	    	
	    	
	        redirectAttrs.addFlashAttribute("successStatusUpdateMessage", "Status successfully updated");
	        
	    }
	    else {
	    	
	        redirectAttrs.addFlashAttribute("failedStatusUpdateMessage", "Status failed to update");
	    }
	    
	    
	    

	    return "redirect:/ownerView";
	
	
   }//closing brace of the 'updateOrderStatus()' method.

	
	
	
	
//============================================================================================================	
	
	
	
	
	//This method would return back the owner to its view after updating the order status:
	@GetMapping("/ownerView")
	protected String showOwnerView(HttpServletRequest req, Model model) {

	    HttpSession session = req.getSession(false);

	    if (session == null) {
	    	
	        model.addAttribute("sessionExpirationMessage", "Session expired. Please login again.");
	        
	        return "view/ownerLoginPage";
	        
	    }

	    try {
	    	
	        DaoOrders ordersObj = new DaoOrders();
	        
	       
	        List<Orders> retrievedOrders = ordersObj.getAllOrders();
	        
	        session.setAttribute("retrievedOrders", retrievedOrders);
	        
	        	        
	    } 
	    catch (Exception e) {
	    	
	        e.printStackTrace();
	    }

	    
	    return "view/ownerView";
	    
	} //closing brace of the 'showOwnerView()' method

	
	
//----------------------------------------------------------------------------------------------------------------	
	
	
	
	@GetMapping("/accessAnalytics")
	protected String accessChartModal(HttpServletRequest req, Model model) {
		
		
		
		//This Triggers opening the Analytics Modal
		model.addAttribute("openAnalyticsModal", true);
		
		
		return "view/ownerView";
		
	}//closing brace of the 'accessChartModal()' method.
	
	
	
//= = = = = = = = = = = = - - - - - - - - - - = = = = = = = = = = = = - - - - - - - - - - - - - - 
	
	@PostMapping("/retrieveOrdersForAnalytics")
	protected String retrieveOrdersForAnalytics(@RequestParam Map<String, String> input, Model model) {
	    
	    // 1st: Retrieving and validating the requested orderDate
	    String rawOrderDate = input.get("orderDate");
	    
	    // Validate input
	    if (rawOrderDate == null || rawOrderDate.isBlank() || rawOrderDate.equals("--")) {
	    	
	       
	        
	        model.addAttribute("openAnalyticsModal", true);
	        
	        return "view/ownerView";
	    }
	    
	    LocalDate requestOrderDate;
	    
	    try {
	    	
	        // First try to parse as ISO format (YYYY-MM-DD)
	        try {
	        	
	            requestOrderDate = LocalDate.parse(rawOrderDate);
	            
	        } 
	        catch (DateTimeParseException e1) {
	        	
	            // If ISO format fails, try DD-MM-YYYY format
	            try {
	            	
	                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	                
	                requestOrderDate = LocalDate.parse(rawOrderDate, formatter);
	                
	            }
	            catch (DateTimeParseException e2) {
	            	
	                model.addAttribute("dateError", "Invalid date format. Please use either DD-MM-YYYY or YYYY-MM-DD format");
	                
	                model.addAttribute("openAnalyticsModal", true);
	                
	                return "view/ownerView";
	                
	            }
	            
	            
	        }
	        
	        
	        // 2nd: Instantiating an object from the 'DaoOrders' class:
	        DaoOrders daoOrdersObject = new DaoOrders();
	        
	        
	        // 3rd: Calling the 'getAllOrdersForAnalytics()' method via the daoOrdersObject:
	        try {
	        	
	            List<Orders> retrievedOrdersForAnalytics = daoOrdersObject.getAllOrdersForAnalytics(requestOrderDate);
	            
	            model.addAttribute("ordersListForAnalytics", retrievedOrdersForAnalytics);
	            
	            
	        } 
	        catch (SQLException e) {

	        	e.printStackTrace();
	        }
	        
	    }
	    catch (Exception e) {
	    	
	        
	        
	        e.printStackTrace();
	    }
	    
	    
	    // This Keeps the Analytics Modal Opened
	    model.addAttribute("openAnalyticsModal", true);
	    
	    return "view/ownerView";
	}
	
	
	
//-------------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
}//closing curly brace of the class.
