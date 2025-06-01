package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.*;
import com.example.model.*;


@Controller
public class CustomerController {

	
	//This method retrieves the bread & desert items into the 'customer' page based on the chosen category(either Breads or Cakes)
	@GetMapping("/customerViewCategoryController")
	public ModelAndView customerCategoryController(@RequestParam Map<String, String> req, HttpServletRequest request) {
		
		
		//Capturing the chosen category by the user & saving it in 'showCategory' variable.
		String showCategory = req.get("category");
		
		
		
		/*Instantiating a model Object from the ModelAndView
		And, Specifying the targeted file that we want to go for "view/customer": */
		ModelAndView model = new ModelAndView("view/customer");
		
		
		//Instantiating a session object 
    	HttpSession session = request.getSession(false);//That false within the 'getSession(false)' is to not create session if it already exists
		
    	
        try {
        	
        	if("Breads".equals(showCategory)) {
        		
        		
        		//Instantiating an object from the 'DaoBreads' class - in order to access the 'breads' table in the DB:
        		DaoBreads breadsObj = new DaoBreads();
        		
        		
        		//Retrieving the bread items from the 'breads' table via the 'getBreads()' methods:
        		List<Breads> retrievedBreads = breadsObj.getBreads();
        		
        		
        		//Saving the retrieved bread items List into the session scope:
        		session.setAttribute("retrievedBreads", retrievedBreads);
    			
        		
        		//Saving the chosen category by the user into the session scope:
        		session.setAttribute("showCategory", showCategory);
        		
    			
        	}
        	else if("Cakes".equals(showCategory)) {
        		
        		
        		//Instantiating an object from the 'DaoCakes' class - in order to access the 'deserts' table in the DB:
                DaoDeserts cakesObj = new DaoDeserts();
        		
                
                //Retrieving the desert items from the 'deserts' table via the 'getDeserts()' methods:
        		List<Deserts> retrievedDeserts = cakesObj.getDesert();
        		
        		
        		//Saving the retrieved desert items List into the session scope:
        		session.setAttribute("retrievedDeserts" , retrievedDeserts);
        		
        		
        		//Saving the chosen category by the user into the session scope:
        		session.setAttribute("showCategory", showCategory);
    			
    				
        	}
			
			
			
		} 
		catch (Exception e) {
		   
			model.addObject("ErrorMessage", e);
		}
		
        
        
        
		
				
		
		return model;
		
	}//closing brace of the 'customerCategoryController'.
	
	
	
	
//##############################################################################################	
	

	
    //This method logs out the user and takes user from the 'customer' page back to the 'viewerOnly' page.
	@GetMapping("/logout")
	protected String logOutUser(HttpServletRequest req, HttpServletRequest resp, Model model) {
		
				
		//Instantiating a session object 
        HttpSession session = req.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		
        
		
        //Retrieving the user email from the session scope & parsing it into String:
		String email = (String) session.getAttribute("email");
		
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  
		  //2nd: Retrieve the userId via the 'retrieveId()' method:
          int userId =  daoObj.retrieveId(email);
		  
               
		
		  
		
        if(session != null) {
        	
        	
        	//Destroying the session
            session.invalidate(); 
            
            
            //Instantiating an object from the 'daoCart' class.
            DaoCart daoClearObj = new DaoCart();
            
            //Clearing the all the items in the 'cartItems' table for the specific user via its userId using 'clearCart()' method:
            daoClearObj.clearCart(userId);
            
            
            //Saving a logOutMessage into the model object:
            String logOutMessage = "You have been logged out!";
            
            model.addAttribute("logOutMessage", logOutMessage);
                     
        }

       
        //Redirecting back the user to the 'login' page:
        return "redirect:/TakeBackUserFromCustomerToLogin?logOutMessage=You+have+been+logged+out!";

		
		
	}//closing brace of the 'logOutUser()' method.
	

	
}//closing brace of the class.
