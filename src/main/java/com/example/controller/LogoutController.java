package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.DAO.*;
import com.example.DAO.daoCart;

@Controller
public class LogoutController {

	@GetMapping("/logout")
	protected String logOutUser(HttpServletRequest req, HttpServletRequest resp, Model model) {
		
		String destination = "";
		
        HttpSession session = req.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		
		
		String email = (String) session.getAttribute("email");
		
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  //2nd: Access the 'retrieveId()' method via the 'daoObj':
          String strId =  daoObj.retrieveId(email);
		  
          //converting the String retrievedId into Int.
          int intId = Integer.parseInt(strId);
		
		  
		  
		
        if(session != null) {
        	
            session.invalidate(); // kill the session
            
            
            daoCart daoClearObj = new daoCart();
            
            daoClearObj.clearCart(intId);
            
            
            // Redirect to login page with a logout message
            String logOutMessage = "You have been logged out!";
            
            model.addAttribute("logOutMessage", logOutMessage);
            
            destination = "view/viewerOnly";
        }

       
		
       
	  return destination;
		
		
	}//closing brace of the 'logOutUser()' method.
	
	
	
	
}//closing brace of the class.
