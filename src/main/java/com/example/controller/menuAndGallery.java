package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class menuAndGallery {

	@GetMapping("/getBackToViewPage")
	protected String getBackToViewOnlyPage() {
		
		return "view/viewerOnly";
		
	}//closing brace of the 'getBackToViewOnlyPage()' method.
	
	
}//closing brace of the class.
