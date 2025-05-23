package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.*;
import com.example.model.breads;
import com.example.model.cakes;

@Controller
public class CustomerController {

	
	@GetMapping("/customerViewCategoryController")
	public ModelAndView customerCategoryController(@RequestParam Map<String, String> req) {
		
		String showCategory = req.get("category");
		
		ModelAndView model = new ModelAndView("view/customer");
		
		
		
		
        try {
        	
        	if("Breads".equals(showCategory)) {
        		
        		DaoBreads breadsObj = new DaoBreads();
        		
        		List<breads> retrievedBread = breadsObj.getBreads();
    			
    			model.addObject("retrievedBreads" , retrievedBread);
    			
        	}
        	else if("Cakes".equals(showCategory)) {
        		
        		
                DaoCakes cakesObj = new DaoCakes();
        		
        		List<cakes> retrievedDeserts = cakesObj.getDesert();
    			
    			model.addObject("retrievedDeserts" , retrievedDeserts);
        		
        	}
			
			
			
		} 
		catch (Exception e) {
		   
			model.addObject("ErrorMessage", e);
		}
		
        
        
        
		
		model.addObject("showCategory",showCategory);		
		
		return model;
		
	}//closing brace of the 'customerCategoryController'.
	
	
	
	
	
	

	
	
	
	
	
	
}//closing brace of the class.
