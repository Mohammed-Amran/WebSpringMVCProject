package com.example.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {

	
	@GetMapping("/customerViewCategoryController")
	public ModelAndView customerCategoryController(@RequestParam Map<String, String> req) {
		
		String showCategory = req.get("category");
		
		ModelAndView model = new ModelAndView("view/customer");
		
		model.addObject("showCategory",showCategory);		
		
		return model;
	}//closing brace of the 'customerCategoryController'.
	
	
	
}//closing brace of the class.
