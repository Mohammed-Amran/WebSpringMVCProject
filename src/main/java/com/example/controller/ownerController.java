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
			
			  
			loginErrorMessage = "Please input your email & password properly";
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
				
				destination = "view/ownerView";
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}//closing curly brace of the 'else if' part
		
		
		return destination;
		
	}//closing brace of the 'ownerLoggingIn()' method.
	
	
	
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	
	
	
	@PostMapping("/updateOrderStatus")
	protected String updateOrderStatus(@RequestParam Map<String, String> input,HttpServletRequest req , Model model) {
		
		String destination = "";
		
		HttpSession session = req.getSession(false);
		
		
		if(session == null) {
			
			String sessionExpirationMessage = "Sorry! your session Expired";
			
			model.addAttribute("sessionExpirationMessage", sessionExpirationMessage);
			
			destination = "view/ownerLoginPage";
			
		}
		else {
			
			int orderId = Integer.parseInt(input.get("orderId"));
			int userId = Integer.parseInt(input.get("userId"));
			String newStatus = input.get("status");
			
			boolean isStatusUpdated = false;
			
			//Instantiating an object from the 'DaoOrders' class:
			DaoOrders ordersObj = new DaoOrders();
			
			try {
				
				//calling the 'updateOrderStatus()' method via the ordersObj:
			    isStatusUpdated = ordersObj.updateOrderStatus(orderId, userId, newStatus);
			   				
			} 
			catch (Exception e) {
				
				e.printStackTrace();			
			}
			
			if(isStatusUpdated) {
				
				//Retrieving the updated version of the orders List & forwarding it back to the owner:
				
				//1st: Retrieving the ordersList from the session scope:
				@SuppressWarnings("unchecked")
				List<Orders> retrievedOrders = (List<Orders>) session.getAttribute("retrievedOrders");
				
				try {
					
					//2nd: getting the updated orders:
					retrievedOrders = ordersObj.getAllOrders();
					
					//3rd: re-saving the retrieved list back into the session scope:
					session.setAttribute("retrievedOrders", retrievedOrders);
					
					
					
				}
				catch (Exception e) {
					
					e.printStackTrace();
				}
				
				
				String successStatusUpdateMessage = "Status successfully updated";
				
				model.addAttribute("successStatusUpdateMessage", successStatusUpdateMessage);
				
				destination = "view/ownerView";
			}
			else {
				
	            String failedStatusUpdateMessage = "Status failed to update";
				
				model.addAttribute("failedStatusUpdateMessage", failedStatusUpdateMessage);
				
				destination = "view/ownerView";
			}
			
			
		}
		
		
		
		return destination;
		
	}//closing brace of the 'updateOrderStatus()' method.
	
	
	
	
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
	
	
	
	
	
	
}//closing curly brace of the class.
