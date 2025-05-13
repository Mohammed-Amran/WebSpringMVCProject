package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class forwardingCustomer {

	
	@GetMapping("/forwardingToCustomer")
	protected String forwardToCustomerPage() {
		
		return "view/customer";
		
	}//closing brace of the 'forwardToCustomerPage()' method.
	
}//closing brace of the class.
