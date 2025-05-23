package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DAO.DaoBreads;
import com.example.DAO.DaoUsers;
import com.example.model.breads;


@Controller
public class LoginController {

	@RequestMapping("/accessLoginPage")
	protected String accessLoginPage() {
		
		return "view/login";
		
	} //closing brace of the 'accessLoginPage()' method.
	
	
	@PostMapping("/loginngIn")
	protected String loginController(@RequestParam Map<String,String> req, Model model, HttpServletRequest request) {
		
		    String destination = "";
		
			
			String email = req.get("email");
			String password = req.get("password");
			
			DaoUsers daoObj = new DaoUsers();
			
			//checking if the user has already registered or not!
			if(daoObj.CheckUser(email, password)) {
				
	            //So, if the user has Registered already:
		    	
		    	//bring-in the users fullName from the DB:
		    	String fullName = daoObj.retrieveFullName(email, password);
		    	
		    	//bring-in the users phoneNo from the DB:
		    	String phoneNo = daoObj.retrievePhoneNo(email, password);
		    	
		    	    	
		    	//Initializing a Session object:
		    	HttpSession session = request.getSession(true);
		    	    		
		    	//Setting the essential user-info's to the session object! would be required for further steps:
		    	session.setAttribute("fullName", fullName);
		    	session.setAttribute("email", email);
		    	session.setAttribute("phoneNo", phoneNo);
				
		    	
		    	destination = "view/customer";
		    	
		    	try {
					
		    		 DaoBreads breadsObj = new DaoBreads();
		        		
		        		List<breads> retrievedBread = breadsObj.getBreads();
		    			
		    			model.addAttribute("retrievedBreads" , retrievedBread);
		    		
				} catch (Exception e) {
					
					System.out.print(e);
				}
		    	
               
		    	
		    	
			}
			else {
				
				//So, if the user hasn't registered.
				model.addAttribute("loginError", "Login failed! Please check your email and password");
				model.addAttribute("email", email);
				
				
				destination = "view/login";
					
			}
			
		
		
	return destination;	
		
		
	}//closing brace of the 'loginController()' method.
	
	
	@GetMapping("/login")
	public String showLoginPage(@RequestParam(value = "logOutMessage", required = false) String logOutMessage,
	                            Model model) {
	    if (logOutMessage != null) {
	        model.addAttribute("logOutMessage", logOutMessage);
	    }
	    return "view/login"; 
	}

	
	@GetMapping("/backToView")
	protected String backToView() {
		
		return "view/viewerOnly";
	}//closing brace of the 'backToView()' method.
	
	
	
}//closing brace of the class.
