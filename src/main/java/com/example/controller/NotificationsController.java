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

import com.example.DAO.DaoNotifications;

import com.example.model.Notifications;


@Controller
public class NotificationsController {

	@GetMapping("/openNotificationModal")
	protected String openNotificationModal(HttpServletRequest req, Model model) {
		
		//Instantiating a session object:
		HttpSession session = req.getSession();
		
		
		//Retrieve the 'unReadNotificationsList':
		
		//I. Retrieve the 'userId' from the session scope:
		int userId = (Integer) session.getAttribute("userId");
		
		
		//II. Instantiating an object from the 'DaoNotifications' class:
    	DaoNotifications notiObj = new DaoNotifications();
    	 
    	 
    	try {
    		
    		//II. Calling the 'getUnReadNotifications()' method and saving into a list of type 'Notifications':
        	List<Notifications> unReadNotifications = notiObj.getUnReadNotifications(userId, false);
        	 
        	//III. Save it into the session scope:
        	session.setAttribute("unReadNotificationsList", unReadNotifications);
        	
        	//III. Retrieve the 'unReadNotificationsCounter':
	     	int unReadNotificationsCounter = notiObj.getUnreadNotificationsCount(userId, false);
	     	 
	     	//IV. Re-saving it into the session scope:c
	     	session.setAttribute("unReadNotificationsCounter", unReadNotificationsCounter);
			
		} 
    	catch (Exception e) {
			
    		e.printStackTrace();
		}
		
		
		
		
		//Trigger to open the 'Notification Modal':
		model.addAttribute("openNotificationModal", true);
		
		
		
		return "view/customer";
	}
	
	
	@PostMapping("/markNotificationAsRead")
	protected String markNotificationAsRead(@RequestParam Map<String, String> input ,HttpServletRequest req, Model model) {
		
		
		//Instantiating a session object:
		HttpSession session = req.getSession();
		
		//Retrieving the 'orderId' & the 'userId' from the user:
		int userId = Integer.parseInt( input.get("userId") );
		int orderId = Integer.parseInt( input.get("orderId") );
		
		//Instantiating an object from the 'DaoNotifications' class:
		DaoNotifications obj = new DaoNotifications();
		
		//calling the
		obj.updateIsRead(userId, orderId, false, true);
		
		
		//Re-retrieving the unReadNotificationsList:
        try {
    		
    		//I. Calling the 'getUnReadNotifications()' method and saving into a list of type 'Notifications':
        	List<Notifications> unReadNotifications = obj.getUnReadNotifications(userId, false);
        	 
        	//II. Save it into the session scope:
        	session.setAttribute("unReadNotificationsList", unReadNotifications);
			
        	
        	//III. Retrieve the 'unReadNotificationsCounter':
	     	int unReadNotificationsCounter = obj.getUnreadNotificationsCount(userId, false);
	     	 
	     	//IV. Re-saving it into the session scope:c
	     	session.setAttribute("unReadNotificationsCounter", unReadNotificationsCounter);
        	
		} 
    	catch (Exception e) {
			
    		e.printStackTrace();
		}
		
		
		

		
		//Trigger to open the 'Notification Modal':
		model.addAttribute("openNotificationModal", true);
		
		
		return "view/customer";
		
	}//closing brace of the 'markNotificationAsRead()' method
	
	
	
	
}//closing brace of the class
