package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.*;
import com.example.model.breads;
import com.example.model.cakes;

@Controller
public class CustomerController {

	
	@GetMapping("/customerViewCategoryController")
	public ModelAndView customerCategoryController(@RequestParam Map<String, String> req, HttpServletRequest request) {
		
		String showCategory = req.get("category");
		
		ModelAndView model = new ModelAndView("view/customer");
		
		
		//Initializing a Session object:
    	HttpSession session = request.getSession(false);
		
        try {
        	
        	if("Breads".equals(showCategory)) {
        		
        		DaoBreads breadsObj = new DaoBreads();
        		
        		List<breads> retrievedBread = breadsObj.getBreads();
        		
        		session.setAttribute("retrievedBreads", retrievedBread);
    			
        		session.setAttribute("showCategory", showCategory);
    			
        	}
        	else if("Cakes".equals(showCategory)) {
        		
        		
                DaoCakes cakesObj = new DaoCakes();
        		
        		List<cakes> retrievedDeserts = cakesObj.getDesert();
        		
        		session.setAttribute("retrievedDeserts" , retrievedDeserts);
        		
        		session.setAttribute("showCategory", showCategory);
    			
    				
        	}
			
			
			
		} 
		catch (Exception e) {
		   
			model.addObject("ErrorMessage", e);
		}
		
        
        
        
		
				
		
		return model;
		
	}//closing brace of the 'customerCategoryController'.
	
	
	
	
	
	

	
	
	
	
	
	
}//closing brace of the class.
