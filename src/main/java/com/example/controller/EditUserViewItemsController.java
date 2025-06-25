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
		
		
	
	//===============================================================================================================================
		
		
		//This Method opens the Edit item modal.
		@GetMapping("/openEditItemModal")
		public String openEditUserProfileModal(@RequestParam Map<String, String> input,Model model, HttpServletRequest req) {
			
			HttpSession session = req.getSession(false);
			
			//Retrieving the itemId.
			String itemType = input.get("itemType");
			session.setAttribute("itemType", itemType);
			
			System.out.println("Getted itemType: " + itemType);
			
			if("breads".equals(itemType)) {
				
				int breadId = Integer.parseInt( input.get("breadsId") );
				System.out.println("Getted breadId: " + breadId);
				
				session.setAttribute("itemId", breadId);
				
				
				DaoBreads daoBreadsObj = new DaoBreads();
				
				//Retrieve the itemName for the 'breads' table:
				String retrievedItemName = daoBreadsObj.retrieveItemName(breadId);
				
				
				session.setAttribute("retrievedItemName", retrievedItemName);
				
				//Retrieve the itemPrice for the 'breads' table:
				int retrievedItemPrice = daoBreadsObj.retrieveItemPrice(breadId);
				
				
				session.setAttribute("retrievedItemPrice", retrievedItemPrice);
				
				//Retrieve the imgURL for the 'breads' table:
				String retrievedImgURL = daoBreadsObj.retrieveBreadsImgURL(breadId);
				
			
				session.setAttribute("retrievedImgURL", retrievedImgURL);
				
				//Retrieve the itemDesc for the 'breads' table:
				String retrievedItemDesc = daoBreadsObj.retrieveItemDesc(breadId);
								
				session.setAttribute("retrievedItemDesc", retrievedItemDesc);
				
				
				//This Triggers opening the Edit User-Profile Modal
				model.addAttribute("openEditItemModal", true);
				
			}
			else if("deserts".equals(itemType)) {
				
				int desertId = Integer.parseInt( input.get("desertId") );
				
				session.setAttribute("itemId", desertId);
				
				DaoDeserts daoDesertObj = new DaoDeserts();
				
				//Retrieve the itemName for the 'deserts' table:
				String retrievedItemName = daoDesertObj.retrieveItemName(desertId);
								
				session.setAttribute("retrievedItemName", retrievedItemName);
				
				//Retrieve the itemPrice for the 'deserts' table:
				int retrievedItemPrice = daoDesertObj.retrieveItemPrice(desertId);
				
				session.setAttribute("retrievedItemPrice", retrievedItemPrice);
				
				//Retrieve the imgURL for the 'deserts' table:
				String retrievedImgURL = daoDesertObj.retrieveDesertsImgURL(desertId);
				
				session.setAttribute("retrievedImgURL", retrievedImgURL);
				
				//Retrieve the itemDesc for the 'deserts' table:
				String retrievedItemDesc = daoDesertObj.retrieveItemDesc(desertId);
				
				session.setAttribute("retrievedItemDesc", retrievedItemDesc);
				
				
				//This Triggers opening the Edit User-Profile Modal
				model.addAttribute("openEditItemModal", true);
				
			}
		
			
			
			
			
			return "view/editUserViewItems";
			
		}//closing brace of the 'openEditUserProfileModal()'method.	
	
	
		
		
	  @PostMapping("/updateItemName")
	  protected String updateItemName(@RequestParam Map<String, String> input, Model model, HttpServletRequest req) {
		  
		  String itemType = input.get("itemType");
		  
		  System.out.println("Retrieved itemType: " + itemType);
		  
		  int itemId = Integer.parseInt( input.get("itemId") );
		  System.out.println("Retrieved itemId: " + itemId);
		  
		  String newItemName = input.get("newItemName");
		  System.out.println("Retrieved newItemName: " + newItemName);
		  
		  
		  if("breads".equals(itemType)) {
			  
			  //update itemName in breads table
			  DaoBreads obj = new DaoBreads();
			  
			  obj.updateItemName(itemId, newItemName);
			  
			  try {
				  
				  HttpSession session = req.getSession(false);
				
				  List<Breads> retrievedBreads = obj.getBreads();
				  
				  session.setAttribute("retrievedBreads", retrievedBreads);
				  
				//Retrieve the itemName for the 'breads' table:
				String retrievedItemName = obj.retrieveItemName(itemId);
					
				session.setAttribute("retrievedItemName", retrievedItemName);
				  
				model.addAttribute("openEditItemModal", true);
				  
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			  
			  
		  }
		  else if("deserts".equals(itemType)) {
			  
			  //update itemName in deserts table
			  DaoDeserts obj = new DaoDeserts();
			  
			  obj.updateItemName(itemId, newItemName);
			  
			  try {
				
				  HttpSession session = req.getSession(false);
				  
				  List<Deserts> retrievedDeserts = obj.getDesert();
     	
	              session.setAttribute("retrievedDeserts" , retrievedDeserts);
				  
	            //Retrieve the itemName for the 'deserts' table:
					String retrievedItemName = obj.retrieveItemName(itemId);
									
					session.setAttribute("retrievedItemName", retrievedItemName);
	              
					model.addAttribute("openEditItemModal", true);
	              
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			  
			
			  
		  }
		  
		  
		  model.addAttribute("openEditItemModal", true);
		  
		  
		  return "view/editUserViewItems";
	  }
	
	
	  //0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	  
	  
	  
	  @PostMapping("/updateItemPrice")
	  protected String updateItemPrice(@RequestParam Map<String, String> input, Model model, HttpServletRequest req) {
		  
		  String itemType = input.get("itemType");
		  
		  int itemId = Integer.parseInt( input.get("itemId") );
		  
		  String newItemPrice = input.get("newItemPrice");
		  
		  if("breads".equals(itemType)) {
			  
			  //update itemPrice in breads table
			  DaoBreads obj = new DaoBreads();
			  
			  obj.updateItemPrice(itemId, newItemPrice);
			  
             try {
				  
				  HttpSession session = req.getSession(false);
				
				  List<Breads> retrievedBreads = obj.getBreads();
	  
				  session.setAttribute("retrievedBreads", retrievedBreads);
				  
				  
				//Retrieve the itemPrice for the 'breads' table:
					int retrievedItemPrice = obj.retrieveItemPrice(itemId);
					
					
					session.setAttribute("retrievedItemPrice", retrievedItemPrice);
					
					model.addAttribute("openEditItemModal", true);
				  
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			
			  
		  }
		  else if("deserts".equals(itemType)) {
			  
			  //update itemPrice in deserts table
			  DaoDeserts obj = new DaoDeserts();
			  
			  obj.updateItemPrice(itemId, newItemPrice);
			  
			  try {
					
				  HttpSession session = req.getSession(false);
				  
				  List<Deserts> retrievedDeserts = obj.getDesert();
     	
	              session.setAttribute("retrievedDeserts" , retrievedDeserts);
				  
	            //Retrieve the itemPrice for the 'deserts' table:
					int retrievedItemPrice = obj.retrieveItemPrice(itemId);
					
					session.setAttribute("retrievedItemPrice", retrievedItemPrice);
	              
					model.addAttribute("openEditItemModal", true);
	              
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			  
			  
			  
		  }
		  
		  model.addAttribute("openEditItemModal", true);
		  
		  return "view/editUserViewItems";
	  }
	
	  
	  
//0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	  
	  
	  
	  @PostMapping("/updateImgURL")
	  protected String updateImgURL(@RequestParam Map<String, String> input, Model model, HttpServletRequest req) {
		  
		  String itemType = input.get("itemType");
		  
		  int itemId = Integer.parseInt( input.get("itemId") );
		  
		  String newImgURL = input.get("newImgURL");
		  
		  if("breads".equals(itemType)) {
			  
			  //update imgURL in breads table
			  DaoBreads obj = new DaoBreads();
			  
			  obj.updateImgURL(itemId, newImgURL);
			  
           
			  try {
				  
				  HttpSession session = req.getSession(false);
				
				  List<Breads> retrievedBreads = obj.getBreads();
				  
				  session.setAttribute("retrievedBreads", retrievedBreads);
				  
				//Retrieve the imgURL for the 'breads' table:
					String retrievedImgURL = obj.retrieveBreadsImgURL(itemId);
					
				
					session.setAttribute("retrievedImgURL", retrievedImgURL);
				  
					model.addAttribute("openEditItemModal", true);
					
					
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
		  }
		  else if("deserts".equals(itemType)) {
			  
			  //update imgURL in deserts table
			  DaoDeserts obj = new DaoDeserts();
			  
			  obj.updateImgURL(itemId, newImgURL);
			  
			  
			  try {
					
				  HttpSession session = req.getSession(false);
				  
				  List<Deserts> retrievedDeserts = obj.getDesert();
     	
	              session.setAttribute("retrievedDeserts" , retrievedDeserts);
				  
	            //Retrieve the imgURL for the 'deserts' table:
					String retrievedImgURL = obj.retrieveDesertsImgURL(itemId);
					
					session.setAttribute("retrievedImgURL", retrievedImgURL);
	              
					model.addAttribute("openEditItemModal", true);
					
	              
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			 
		  }
		  
		  
		  model.addAttribute("openEditItemModal", true);
		  
		  return "view/editUserViewItems";
	  }
	  
	  

//0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	  
	  
	  
	  @PostMapping("/updateItemDesc")
	  protected String updateItemDesc(@RequestParam Map<String, String> input, Model model, HttpServletRequest req) {
		  
		  String itemType = input.get("itemType");
		  
		  int itemId = Integer.parseInt( input.get("itemId") );
		  
		  String newItemDesc = input.get("newItemDesc");
		  
		  if("breads".equals(itemType)) {
			  
			  //update itemDesc in breads table
			  DaoBreads obj = new DaoBreads();
			  
			  obj.updateItemDesc(itemId, newItemDesc);
			  
			  
             try {
				  
				  HttpSession session = req.getSession(false);
				
				  List<Breads> retrievedBreads = obj.getBreads();
				  
				  session.setAttribute("retrievedBreads", retrievedBreads);
				  
				//Retrieve the itemDesc for the 'breads' table:
					String retrievedItemDesc = obj.retrieveItemDesc(itemId);
										
					session.setAttribute("retrievedItemDesc", retrievedItemDesc);
				  
					model.addAttribute("openEditItemModal", true);
					
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			 
		  }
		  else if("deserts".equals(itemType)) {
			  
			  //update itemDesc in deserts table
			  DaoDeserts obj = new DaoDeserts();
			  
			  obj.updateItemDesc(itemId, newItemDesc);
			  
			  try {
					
				  HttpSession session = req.getSession(false);
				  
				  List<Deserts> retrievedDeserts = obj.getDesert();
     	
	              session.setAttribute("retrievedDeserts" , retrievedDeserts);
				  
	            //Retrieve the itemDesc for the 'deserts' table:
					String retrievedItemDesc = obj.retrieveItemDesc(itemId);
					
					session.setAttribute("retrievedItemDesc", retrievedItemDesc);
	              
					model.addAttribute("openEditItemModal", true);
					
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			  
			  
			  
			
		  }
		  
		  model.addAttribute("openEditItemModal", true);
		  
		  return "view/editUserViewItems";
	  }
	  
	
	
}//closing brace of the class
