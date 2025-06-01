package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class aboutUsController {

	
	
	//This Method forwards the user from 'viewerOnly' page to 'aboutUs' page.
	  @RequestMapping("/accessAboutUsPage")
	  protected String forwardToAboutUs() {
		  
		  return "view/aboutUs";
		  
	  }//closing brace of the 'forwardToAboutUs()' method.
	
	
	  
	  
	  
//###################################################################################	
	
	
	//This Method takes back the user from 'AboutUs' page to 'viewerOnly' page.  
	@GetMapping("/getBackToViewOnlyFromAboutUs")
	protected String getBackToViewOnlyPage() {
		
		return "view/viewerOnly";
		
	}//closing brace of the 'getBackToViewOnlyPage()' method.
	
	
	
	
	
	
}//closing brace of the class.
