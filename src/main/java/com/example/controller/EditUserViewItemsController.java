package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DAO.DaoBreads;
import com.example.DAO.DaoDeserts;
import com.example.model.Breads;
import com.example.model.Deserts;

@Controller
public class EditUserViewItemsController {

	
	// This method below opens the 'editUserViewItems.jsp' page:
	@GetMapping("/accessEditUserViewItems")
	protected String accessEditUserViewItems(HttpServletRequest req) {

		HttpSession session = req.getSession();

		// I: Instantiating an object from the 'DaoBreads' class.
		DaoBreads breadsObj = new DaoBreads();

		try {

			// II: getting the bread items via the 'getBreads()' method.
			List<Breads> retrievedBreads = breadsObj.getBreads();

			// III: saving the retrieved breads into the session scope:
			session.setAttribute("retrievedBreads", retrievedBreads);

			// IV: this allows the 'when' tag in the 'customer' page to loop through the
			// 'retrievedBreads'
			session.setAttribute("showCategory", "Breads");
		} 
		catch (Exception e) {

			e.printStackTrace();
		}

		return "view/editUserViewItems";

	}// closing brace of the 'accessEditUserViewItems()' method.

	
	
	
	
	// This method below! returns back the user from the 'editUserView' to the
	// 'ownerView' page.
	@GetMapping("/getBackToOwnerView")
	protected String getBackToOwnerView(HttpServletRequest req, Model model) {

		return "view/ownerView";

	}// closing brace of the 'getBackToOwnerView()' method.
	
	
	
	//This method retrieves the bread & desert items into the 'customer' page based on the chosen category(either Breads or Cakes)
		@GetMapping("/EditUserViewCategoryController")
		public ModelAndView customerCategoryController(@RequestParam Map<String, String> req, HttpServletRequest request) {
			
			
			//Capturing the chosen category by the user & saving it in 'showCategory' variable.
			String showCategory = req.get("category");
			
			
			
			/*Instantiating a model Object from the ModelAndView
			And, Specifying the targeted file that we want to go for "view/customer": */
			ModelAndView model = new ModelAndView("view/editUserViewItems");
			
			
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
				
				
				
			} 
			catch (Exception e) {
			   
				model.addObject("ErrorMessage", e);
			}
			
	        
	        
	        
			
					
			
			return model;
			
		}//closing brace of the 'customerCategoryController'.
		
		
	
	
	
	
	
	
	
	
	
	
}//closing brace of the class
