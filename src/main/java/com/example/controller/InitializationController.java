package com.example.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InitializationController {

	 //This Method below Initially Shows the viewerOnly page to the user.
	  @RequestMapping("/")
	  protected String initializer() {
		  
		  return "view/viewerOnly";
		  
	  }//closing brace of the 'initializer()' method.
	  
	  
	  @RequestMapping("/categoryController")
	  protected ModelAndView CategoryController(@RequestParam Map<String,String> req) {
		  
		  String category = req.get("category");
		  
		  ModelAndView model = new ModelAndView("view/viewerOnly");
		  
		  model.addObject("showCategory", category);
		  
		  return model;
		  
	  }//closing brace of the 'CategoryController()' method.
	  
	
}//closing brace of the class.
