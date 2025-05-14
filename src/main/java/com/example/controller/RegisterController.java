package com.example.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DAO.*;
import com.example.model.*;



@Controller
public class RegisterController {

	@GetMapping("/goToRegister")
	protected String goToRegisterPage() {
		
		
		 return "view/register";
	}//closing brace of the 'goToRegister()' method.
	
	
	@RequestMapping("/accessRegisterPage")
	protected String accessLoginPage() {
		
		return "view/register";
		
	} //closing brace of the 'accessLoginPage()' method.
	
	@GetMapping("/backToViewOnlyFromRegistration")
	protected String backToLogin() {
		
		return "view/viewerOnly";
		
	}
	
	
	
	@PostMapping("/registerUser")
	protected String registerUser(@RequestParam Map<String, String> req, Model model, HttpServletRequest request ) {
		
		String destination = "";
		
		String fullName = req.get("fullName");
		String email = req.get("email");
		String password = req.get("password");
		String phoneNo = req.get("phoneNo");
		
		

		   //Checking the correctness of the email & phone number:
			String emailError = null;
			String phoneNoError = null;
			
			
			//1:Instantiating an object from the Auth class.
			Auth authObj = new Auth();
			
			
				
			if( !authObj.isEmailValid(email) ) {
				
				emailError = "Invalid Email Format!";
			}
			
			if(!authObj.isPhoneNumValid(phoneNo)) {
				
				phoneNoError = "Invalid Phone No. Format";
			}
		
			
			if(emailError != null || phoneNoError != null) {
				
				//so here, if the one of the Email & PhoneNum (or both) weren't correct!
				//user will be returned back to the register.jsp page.
				
				//setting the already inputed fields, so that user do not required to re-enter them!			
				model.addAttribute("fullName", fullName);
				model.addAttribute("email", email);
				model.addAttribute("password", password);
				model.addAttribute("phoneNo", phoneNo);
				
				
				model.addAttribute("emailError", emailError);
				model.addAttribute("phoneError", phoneNoError);
				
				destination  = "view/register";
				
			}
			else {
				
				
				//If the email & phoneNo were fine!, then:
				
				//Create an object from the 'UserRegistration' class:
				UserRegistration userObj = new UserRegistration();
				
				userObj.setFullName(fullName);
				userObj.setEmail(email);
				userObj.setPassword(password);
				userObj.setPhoneNo(phoneNo);
				
					
				
				//Saving the user info into the database:
				
				//1st: Instantiating an object from the DAO class:
				DaoUsers dao = new DaoUsers();
				
				//Passing the userObj object into the insertUser method:
			    boolean insertSuccess =	dao.insertUser(userObj);
				
			    
			    //So, if the Insertion success:
			    if(insertSuccess) {
			    	
			    	//Initializing the Session Object:
			    	HttpSession session = request.getSession(true); //Exactly same as: HttpSession session = req.getSession();
			       
			    	
			    	//Setting the essential user-info's to the session object! would be required for further steps:
			    	session.setAttribute("fullName", fullName);
			    	session.setAttribute("email", email);
			    	session.setAttribute("phoneNo", phoneNo);
			    	
			    	
			    	//Setting the session time-out to 2 hours:
			    	session.setMaxInactiveInterval(2 * 60 * 60);
			    	
			    	
			    	
			    	//Finally, Forwarding the user to the main view(customerView):
					destination = "view/customer";
			    	
			    }
			    else {
			    	
			    	//setting an error message!
			    	model.addAttribute("insertingError", "Failed to Register, Please try again!");
			    	
			    	destination = "view/register";
			    	
			    }
				
				
				
			}//closing brace of the else.
			
			
			
			return destination;
				
		
		
	}//closing brace of the 'registerUser()' method.
	
	
	
	
	
}//closing brace of the class.
