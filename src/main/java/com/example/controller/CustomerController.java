package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.*;
import com.example.model.*;


@Controller
public class CustomerController {

	
	//This method retrieves the bread & desert items into the 'customer' page based on the chosen category(either Breads or Cakes)
	@GetMapping("/customerViewCategoryController")
	public ModelAndView customerCategoryController(@RequestParam Map<String, String> req, HttpServletRequest request) {
		
		
		//Capturing the chosen category by the user & saving it in 'showCategory' variable.
		String showCategory = req.get("category");
		
		
		
		/*Instantiating a model Object from the ModelAndView
		And, Specifying the targeted file that we want to go for "view/customer": */
		ModelAndView model = new ModelAndView("view/customer");
		
		
		//Instantiating a session object 
    	HttpSession session = request.getSession(false);//That false within the 'getSession(false)' is to not create session if it already exists
		
    	
        try {
        	
        	if("Breads".equals(showCategory)) {
        		
        		
        		//Instantiating an object from the 'DaoBreads' class - in order to access the 'breads' table in the DB:
        		DaoBreads breadsObj = new DaoBreads();
        		
        		
        		//Retrieving the bread items from the 'breads' table via the 'getBreads()' methods:
        		List<Breads> retrievedBreads = breadsObj.getBreads();
        		
        		
        		//Saving the retrieved bread items List into the session scope:
        		session.setAttribute("retrievedBreads", retrievedBreads);
    			
        		
        		//Saving the chosen category by the user into the session scope:
        		session.setAttribute("showCategory", showCategory);
        		
    			
        	}
        	else if("Cakes".equals(showCategory)) {
        		
        		
        		//Instantiating an object from the 'DaoCakes' class - in order to access the 'deserts' table in the DB:
                DaoDeserts cakesObj = new DaoDeserts();
        		
                
                //Retrieving the desert items from the 'deserts' table via the 'getDeserts()' methods:
        		List<Deserts> retrievedDeserts = cakesObj.getDesert();
        		
        		
        		//Saving the retrieved desert items List into the session scope:
        		session.setAttribute("retrievedDeserts" , retrievedDeserts);
        		
        		
        		//Saving the chosen category by the user into the session scope:
        		session.setAttribute("showCategory", showCategory);
    			
    				
        	}
			
        	
        	int userId = (Integer) session.getAttribute("userId");
	     	 //--------------Notifications------------------------------------------
	     	 
	     	 //I. Instantiating an object from the 'DaoNotifications' class:
	     	 DaoNotifications notiObj = new DaoNotifications();
	     	 
	     	 
	     	 //II. Calling the 'getUnReadNotifications()' method and saving into a list of type 'Notifications':
	     	 List<Notifications> unReadNotifications = notiObj.getUnReadNotifications(userId, false);
	     	 
	     	 session.setAttribute("unReadNotificationsList", unReadNotifications);
	     	 
	     	 
	     	 //III. Retrieve the 'unReadNotificationsCounter':
	     	 int unReadNotificationsCounter = notiObj.getUnreadNotificationsCount(userId, false);
	     	 
	     	 session.setAttribute("unReadNotificationsCounter", unReadNotificationsCounter);
	     	 
	     	 //--------------------------------------------------------------------
        	
			
			
		} 
		catch (Exception e) {
		   
			model.addObject("ErrorMessage", e);
		}
		
        
        
       
		
				
		
		return model;
		
	}//closing brace of the 'customerCategoryController'.
	
	
	
	
//##############################################################################################	
	

	
    //This method logs out the user and takes user from the 'customer' page back to the 'viewerOnly' page.
	@GetMapping("/logout")
	protected String logOutUser(HttpServletRequest req, HttpServletRequest resp, Model model) {
		
				
		//Instantiating a session object 
        HttpSession session = req.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		
        
		
        //Retrieving the user email from the session scope & parsing it into String:
		String email = (String) session.getAttribute("email");
		
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  
		  //2nd: Retrieve the userId via the 'retrieveId()' method:
          int userId =  daoObj.retrieveId(email);
		  
               
		
		  
		
        if(session != null) {
        	
        	
        	//Destroying the session
            session.invalidate(); 
            
            
            //Instantiating an object from the 'daoCart' class.
            DaoCart daoClearObj = new DaoCart();
            
            //Clearing the all the items in the 'cartItems' table for the specific user via its userId using 'clearCart()' method:
            daoClearObj.clearCart(userId);
            
            
            //Saving a logOutMessage into the model object:
            String logOutMessage = "You have been logged out!";
            
            model.addAttribute("logOutMessage", logOutMessage);
                     
        }

       
        //Redirecting back the user to the 'login' page:
        return "redirect:/TakeBackUserFromCustomerToLogin?logOutMessage=You+have+been+logged+out!";

		
		
	}//closing brace of the 'logOutUser()' method.
	
	
	
//##############################################################################################

//-------------------- ALL METHODS BELOW ARE RESPONSIBLE FOR THE "EDIT USER PROFILE" -----------
	
//##############################################################################################	
	
	//This Method opens the Edit user profile modal.
	@GetMapping("/openEditUserProfileModal")
	public String openEditUserProfileModal(Model model, HttpServletRequest req) {
		
		
		//Retrieving the already saved userInfo's in the session Scope.
		
		//1. Instantiating a session object:
		HttpSession session = req.getSession(false);
		
		
		//2. Retrieving the 'fullName', "email", "pass" & "phoneNo" from the session scope:
		String retrievedFullName = (String) session.getAttribute("fullName");
		String retrievedEmail = (String) session.getAttribute("email");
		String retrievedPassword = (String) session.getAttribute("password");
		String retrievedPhoneNo = (String) session.getAttribute("phoneNo");
		
		
		//3. Wrapping & Forwarding the retrieved user info's to the editUserProfile Modal:
		model.addAttribute("retrievedFullName", retrievedFullName);
		
		model.addAttribute("retrievedEmail", retrievedEmail);
		
		model.addAttribute("retrievedPassword", retrievedPassword);
		
		model.addAttribute("retrievedPhoneNo", retrievedPhoneNo);
		
		
		
		
		
		//This Triggers opening the Edit User-Profile Modal
		model.addAttribute("openEditModal", true);
		
		
		return "view/customer";
		
	}//closing brace of the 'openEditUserProfileModal()'method.
	
	
	
	
	
	
	
	//This method updates the user-fullName
	@PostMapping("/updateUserFullName")
	public String updateUserFullName(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
		
		String destination = "";
		
		//Retrieving the new fullName.
		String newFullName = input.get("newFullName");
		
				
		//Instantiating a session object
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			
						
			//Retrieving the userId from the session scope:
			int userId = (Integer) session.getAttribute("userId");
			
						
			//Instantiating an object from the 'DaoUsers' class.
			DaoUsers daoUsersObj = new DaoUsers();
			
			
			//calling the 'updateUserFullName()' method via the 'daoUsersObj' object:
			boolean isNewFullNameUpdated = daoUsersObj.updateUserFullName(userId, newFullName);
			
			
			if(isNewFullNameUpdated) {
				
				//Retrieving the new FullName from the DB & re-saving it into the request Scope. 
				
				//1. Calling the 'retrieveFullName()' method from the 'DaoUsers' class.
				String retrievedFullName = daoUsersObj.retrieveFullName(userId);
				 
				//2. Re-saving the retrieved fullName back into the session scope:
				session.setAttribute("fullName", retrievedFullName);
				
				//3. Wrapping & forwarding the 'retrievedFullName' into request scope:
				model.addAttribute("retrievedFullName", retrievedFullName);
				
				
				//3.1 - Retrieving the other 3 user-profile data's from the session Scope & forwarding them too!:
				String retrievedEmail = (String) session.getAttribute("email");
				
				String retrievedPassword = (String) session.getAttribute("password");
				
				String retrievedPhoneNo = (String) session.getAttribute("phoneNo");
				
				//3.2 - Wrapping & forwarding this 3 into the request scope too!:
				model.addAttribute("retrievedEmail", retrievedEmail);
				
				model.addAttribute("retrievedPassword", retrievedPassword);
				
				model.addAttribute("retrievedPhoneNo", retrievedPhoneNo);
				
				
				//4. This keeps the Edit User-Profile Modal opened
				model.addAttribute("openEditModal", true);
				
				String successUserUpdateMessage = "FullName Successfully updated";
				
				model.addAttribute("successUserUpdateMessage", successUserUpdateMessage);
			}
			else {
				
				
                String failureUserUpdateMessage = "FullName failed to be updated";
				
				model.addAttribute("failureUserUpdateMessage", failureUserUpdateMessage);
			}
			
			
			destination = "view/customer";
			
		}
		else {
			
			String sessionExpiredMessage = "Your session is expired!";
			
			model.addAttribute("sessionExpiredMessage", sessionExpiredMessage);
			
			destination = "view/login";
		}
		
						
		return destination;
		
	}//closing brace of the 'updateUserFullName()' method
	
	
	
	//This method updates the user-email
	@PostMapping("/updateUserEmail")
	public String updateUserEmail(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
			
         String destination = "";
		
		//Retrieving the new email.
		String newEmail = input.get("newEmail");
		
		//Instantiating a session object
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			
			//Retrieving the userId from the session scope:
			int userId = (Integer) session.getAttribute("userId");
			
			//Instantiating an object from the 'DaoUsers' class.
			DaoUsers daoUsersObj = new DaoUsers();
			
			//calling the 'updateUserFullName()' method via the 'daoUsersObj' object:
			boolean isNewEmailUpdated = daoUsersObj.updateUserEmail(userId, newEmail);
			
			if(isNewEmailUpdated) {
				
                //Retrieving the new Email from the DB & re-saving it into the request Scope. 
				
				//1. Calling the 'retrieveEmail()' method from the 'DaoUsers' class.
				String retrievedEmail = daoUsersObj.retrieveEmail(userId);
				 
				//2. Re-saving the retrieved fullName back into the session scope:
				session.setAttribute("email", retrievedEmail);
				
				//3. Wrapping & forwarding the 'retrievedFullName' into request scope:
				model.addAttribute("retrievedEmail", retrievedEmail);
				
				
				//3.1 - Retrieving the other 3 user-profile data's from the session Scope & forwarding them too!:
				String retrievedFullName = (String) session.getAttribute("fullName");
				
				String retrievedPassword = (String) session.getAttribute("password");
				
				String retrievedPhoneNo = (String) session.getAttribute("phoneNo");
				
				//3.2 - Wrapping & forwarding this 3 into the request scope too!:
				model.addAttribute("retrievedFullName", retrievedFullName);
				
				model.addAttribute("retrievedPassword", retrievedPassword);
				
				model.addAttribute("retrievedPhoneNo", retrievedPhoneNo);
				
				
				//4. This keeps the Edit User-Profile Modal opened
				model.addAttribute("openEditModal", true);
				
				
				String successUserUpdateMessage = "Email Successfully updated";
				
				model.addAttribute("successUserUpdateMessage", successUserUpdateMessage);
			}
			else {
				
                String failureUserUpdateMessage = "Email failed to be updated";
				
				model.addAttribute("failureUserUpdateMessage", failureUserUpdateMessage);
			}
			
			
			destination = "view/customer";
			
		}
		else {
			
			String sessionExpiredMessage = "Your session is expired!";
			
			model.addAttribute("sessionExpiredMessage", sessionExpiredMessage);
			
			destination = "view/login";
		}
		
		
		
		
		
		return destination;
			
		}//closing brace of the 'updateUserEmail()' method
	

	
	//This method updates the user-password
	@PostMapping("/updateUserPassword")
	public String updateUserPassword(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
			
        String destination = "";
		
		//Retrieving the new password.
		String newPassword = input.get("newPassword");
		
		//Instantiating a session object
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			
			//Retrieving the userId from the session scope:
			int userId = (Integer) session.getAttribute("userId");
			
			//Instantiating an object from the 'DaoUsers' class.
			DaoUsers daoUsersObj = new DaoUsers();
			
			//calling the 'updateUserFullName()' method via the 'daoUsersObj' object:
			boolean isNewPasswordUpdated = daoUsersObj.updateUserPassword(userId, newPassword);
			
			if(isNewPasswordUpdated) {
				
                //Retrieving the new Password from the DB & re-saving it into the request Scope. 
				
				//1. Calling the 'retrievePassword()' method from the 'DaoUsers' class.
				String retrievedPassword = daoUsersObj.retrievePassword(userId);
				 
				//2. Re-saving the retrieved fullName back into the session scope:
				session.setAttribute("password", retrievedPassword);
				
				//3. Wrapping & forwarding the 'retrievedFullName' into request scope:
				model.addAttribute("retrievedPassword", retrievedPassword);
				
				
				//3.1 - Retrieving the other 3 user-profile data's from the session Scope & forwarding them too!:
				String retrievedFullName = (String) session.getAttribute("fullName");
				
				String retrievedEmail = (String) session.getAttribute("email");
				
				String retrievedPhoneNo = (String) session.getAttribute("phoneNo");
				
				//3.2 - Wrapping & forwarding this 3 into the request scope too!:
				model.addAttribute("retrievedFullName", retrievedFullName);
				
				model.addAttribute("retrievedEmail", retrievedEmail);
				
				model.addAttribute("retrievedPhoneNo", retrievedPhoneNo);
				
				
				//4. This keeps the Edit User-Profile Modal opened
				model.addAttribute("openEditModal", true);
				
				String successUserUpdateMessage = "Password Successfully updated";
				
				model.addAttribute("successUserUpdateMessage", successUserUpdateMessage);
			}
			else {
				
                String failureUserUpdateMessage = "Password failed to be updated";
				
				model.addAttribute("failureUserUpdateMessage", failureUserUpdateMessage);
			}
			
			
			destination = "view/customer";
			
		}
		else {
			
			String sessionExpiredMessage = "Your session is expired!";
			
			model.addAttribute("sessionExpiredMessage", sessionExpiredMessage);
			
			destination = "view/login";
		}
		
		
		
		
		
		return destination;
			
		}//closing brace of the 'updateUserPassword()' method
	
	
	
	//This method updates the user-phoneNo
	@PostMapping("/updateUserPhoneNo")
	public String updateUserPhoneNo(@RequestParam Map<String, String> input, HttpServletRequest req, Model model) {
			
         String destination = "";
		
		//Retrieving the new phoneNo.
		String newPhoneNo = input.get("newPhoneNo");
		
		//Instantiating a session object
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			
			//Retrieving the userId from the session scope:
			int userId = (Integer) session.getAttribute("userId");
			
			//Instantiating an object from the 'DaoUsers' class.
			DaoUsers daoUsersObj = new DaoUsers();
			
			//calling the 'updateUserFullName()' method via the 'daoUsersObj' object:
			boolean isNewFullNameUpdated = daoUsersObj.updateUserphoneNo(userId, newPhoneNo);
			
			if(isNewFullNameUpdated) {
				
                //Retrieving the new phoneNo from the DB & re-saving it into the request Scope. 
				
				//1. Calling the 'retrievePhoneNo()' method from the 'DaoUsers' class.
				String retrievedPhoneNo = daoUsersObj.retrievePhoneNo(userId);
				 
				//2. Re-saving the retrieved fullName back into the session scope:
				session.setAttribute("phoneNo", retrievedPhoneNo);
				
				//3. Wrapping & forwarding the 'retrievedFullName' into request scope:
				model.addAttribute("retrievedPhoneNo", retrievedPhoneNo);
				
				
				//3.1 - Retrieving the other 3 user-profile data's from the session Scope & forwarding them too!:
				String retrievedFullName = (String) session.getAttribute("fullName");
				
				String retrievedPassword = (String) session.getAttribute("password");
				
				String retrievedEmail = (String) session.getAttribute("email");
				
				//3.2 - Wrapping & forwarding this 3 into the request scope too!:
				model.addAttribute("retrievedFullName", retrievedFullName);
				
				model.addAttribute("retrievedPassword", retrievedPassword);
				
				model.addAttribute("retrievedEmail", retrievedEmail);
				
				
				//4. This keeps the Edit User-Profile Modal opened
				model.addAttribute("openEditModal", true);
				
				String successUserUpdateMessage = "phoneNo Successfully updated";
				
				model.addAttribute("successUserUpdateMessage", successUserUpdateMessage);
			}
			else {
				
                String failureUserUpdateMessage = "phoneNo failed to be updated";
				
				model.addAttribute("failureUserUpdateMessage", failureUserUpdateMessage);
			}
			
			
			destination = "view/customer";
			
		}
		else {
			
			String sessionExpiredMessage = "Your session is expired!";
			
			model.addAttribute("sessionExpiredMessage", sessionExpiredMessage);
			
			destination = "view/login";
		}
		
		
		
		
		
		return destination;
			
		}//closing brace of the 'updateUserPhoneNo()' method
	
	
	
}//closing brace of the class.
