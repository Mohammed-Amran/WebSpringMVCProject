package com.example.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ViewPageController {

	
	
	 //This Method runs at first & Shows the viewerOnly page to the user.
	  @RequestMapping("/")
	  protected String initializer() {
		  
		  return "view/viewerOnly";
		  
	  }//closing brace of the 'initializer()' method.
	  
	  

	  
	
}//closing brace of the class.
