package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DAO.DaoOrders;
import com.example.model.Orders;

@Controller
public class ownerController {

	
	//This method below opens the 'owner.jsp' page:
	@GetMapping("/accessOwnerLoginPage")
	protected String accessOwnerLoginPage() {
		
		return "view/ownerLoginPage";
		
	}//closing brace of the 'accessOwnerPage()' method.
	
	
	@PostMapping("/ownerloginController")
	protected String ownerLoggingIn(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
		
		String destination = "";
		
		String inputedEmail = input.get("email");
		String inputedPassword = input.get("password");
		
		String loginErrorMessage = "";
		
		if(inputedEmail.equals(null) || inputedPassword.equals(null)) {
			
			
			loginErrorMessage = "Please input your email & password properly";
			model.addAttribute("loginErrorMessage", loginErrorMessage);
			
			destination = "view/ownerLoginPage";
		}
		else if("owner@gmail.com".equals(inputedEmail) && "1122".equals(inputedPassword)) {
			
			
			List<Orders> retrievedOrders = new ArrayList<>();
			
			DaoOrders daoOrdersObj = new DaoOrders();
			
			try {
				
				retrievedOrders =  daoOrdersObj.getAllOrders();
				
				model.addAttribute("retrievedOrders", retrievedOrders);
				
				destination = "view/ownerView";
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}//closing curly brace of the 'else if' part
		
		
		return destination;
		
	}//closing brace of the 'ownerLoggingIn()' method.
	
	
	
}//closing curly brace of the class.
