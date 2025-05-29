package com.example.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class menuAndGallery {

	
	//This Method takes the user from 'viewerOnly' page to the 'menuAndGallery' page.
	@GetMapping("/gotToMenuAndGalleryPage")
	protected String gotToMenuAndGalleryPage() {
		
		return "view/menuAndGallery";
		
	}//closing brace of the 'gotToMenuAndGalleryPage()' method.

	

//##############################################################################################	
	
	
	/* ----- This method below is STATIC - It must be modified to present the items dynamically from the DB */
	
	//This method shows either of breads or deserts items based on the chosen category.
	@RequestMapping("/categoryController")
	  protected ModelAndView CategoryController(@RequestParam Map<String,String> req) {
		  
		  String category = req.get("category");
		  
		  ModelAndView model = new ModelAndView("view/menuAndGallery");
		  
		  model.addObject("showCategory", category);
		  
		  return model;
		  
	  }//closing brace of the 'CategoryController()' method.
	
	
	
	
//##############################################################################################	
	
	
	
	//This methods takes the user from 'menuAndGallery' page back to the 'viewerOnly' page. 
	@GetMapping("/getBackToViewPageFromMenuAndGallery")
	protected String getBackToViewOnlyPage() {
		
		return "view/viewerOnly";
		
	}//closing brace of the 'getBackToViewOnlyPage()' method.
	
	
	
	
	
	
	
	
}//closing brace of the class.
