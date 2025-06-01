package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DAO.*;
import com.example.model.*;

@Controller
public class addToCartController {

	
	//This method only redirects the user back to the same 'customer' page after successfully adding item into the cart!
	//The benefit of this METHOD is to prevent: re-submiting the previous item accidently into the cart on page reloads. 
	@GetMapping("/getBackToCustomerPage")
	public String showCustomerPage(HttpServletRequest request) {
	    
		
	    return "view/customer";
	}
	

//##############################################################################################
	
	
	
	//This method adds item into the 'cartItems' table.
	@PostMapping("/addToCartController")
	public String addItemsToCart(@RequestParam Map<String, String> req,  HttpServletRequest request, HttpServletRequest response, RedirectAttributes redirectAttributes) {
		

	 //Instantiating a session object	
     HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		
		
		 
	/*
	     5 things are required to be inserted into the Cart!: 
       
         1.userId - 2.itemId - 3.itemName - 4.selectedQuantity -5.itemPrice. 
		     
     */
		
     
//.........................................................................................................................	
     
     /*Retrieving the 'itemName', 'itemType', 'selectedQuantity', 'itemPrice' of item
       that the user has sent to this method */
     

/*----1-----= Retrieving the itemName =----------*/
     
     
   /* 1 of 5 */  String itemName = req.get("itemName");
	             
	             
	             
//.........................................................................................................................	             

   

/*----2-----= Retrieving the selectedQuantity =----------*/   
   
	             String strSelectedQuantity = req.get("selectedQuantity");
	 	 
	             //Parsing the retrieved 'strSelectedQuantity' into Integer:
   /* 2 of 5 */  int intSelectedQuantity = Integer.parseInt(strSelectedQuantity);
	
   

//.........................................................................................................................   
 
   

/*----3-----= Retrieving the userId =----------*/    
   
                 //Retrieve the userId from the session scope & parsing it into Integer:
   /* 3 of 5 */  int userId = (Integer) session.getAttribute("userId");
  
                 
              
  
   
   
//.........................................................................................................................   
   
  
   
/*----4-----= Retrieving the itemId =----------*/   
      
      
      String itemType = req.get("itemType");
	 	  
	  //Instantiating an object from the 'DaoBreads' class:  
	  DaoBreads breadObj = new DaoBreads();
	  
	  
	  //Instantiating an object from the 'DaoCakes' class:
	  DaoDeserts desertObj = new DaoDeserts();
		  
	  
		 int itemId = 0;
		 int itemPrice = 0; 
		 
		 /* 4 of 5 */
		 try {
			
			 //so, if the itemType was 'Bread':
			 if("Bread".equals(itemType)) {
				 
				 //Then, retrieve the itemId of them item from the 'breads' table via the 'getBreadIdByName()' method.
				 itemId = breadObj.getBreadIdByName(itemName);
				 
				 /*----5-----= Retrieving the itemPrice =----------*/	
				 itemPrice = breadObj.getBreadItemPrice(itemName);
				 
				 
			 }
			 //And if the itemType was 'Desert':
			 else if("Desert".equals(itemType)) {
				 
				 //Then, retrieve the itemId of them item from the 'deserts' table via the 'getDesertIdByName()' method.
				 itemId = desertObj.getDesertIdByName(itemName);
				 
				 /*----5-----= Retrieving the itemPrice =----------*/	
				 itemPrice = desertObj.getDesertItemPrice(itemName);
				 
				 
			 }
			  
			 	 
		} 
		 catch (Exception e) {
			
			System.out.print(e);
		} 
		 



		 /* so, at the moment! we have all 4 necessary data's
		    
		    1.userId - 2.itemId - 3.itemName - 4.selectedQuantity -5.itemPrice
		     
		 */
	


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	

		//Inserting the (userId, itemId, itemName, selectedQuantity, itemPrice) into the 'cartItems' table.
        		  
        //1st: Instantiating an object from the 'DoaAddToCart' class.
        DaoCart daoAddToCartObj = new DaoCart();
         
         
        //2nd: Inserting the item into the 'cartItems' table via the 'insertIntoCartItem()' method.
        boolean isInserted = daoAddToCartObj.insertIntoCartItem(userId, itemId, itemName, intSelectedQuantity, itemPrice);
		
       
        //So, if the item successfully has inserted into the 'cartItems' table - this part below will run
		if(isInserted) {
			
			
			//1st: Retrieving the items number in the 'cartItems' table
			
			
			//I: Instantiating an object from the daoCart class.
			DaoCart daoCartObj = new DaoCart();
			
			
			//II: Retrieving the items number via the 'getCartItemCount()' method:
			int itemsCount = daoCartObj.getCartItemCount(userId);
			
			
			//III: Saving the retrieved items number into the session scope:
			session.setAttribute("cartCounter", itemsCount); 
			
			
			
			
			
			//2nd: Getting the Items from the cartItems table.
					
			
			
		    try {
				
		    	//I: Retrieving the items from the 'cartItems' table using specific userId via the 'getCartItemsByUserId()' method.
		    	List<CartItems> retrievedItems = daoCartObj.getCartItemsByUserId(userId);
		    	
		    	
		    	//II: Saving the retrieved items into the session scope:
		    	session.setAttribute("retrievedCartItems", retrievedItems);
		    	
		    	
		    	return "redirect:/getBackToCustomerPage"; 

			} 
		    catch (Exception e) {
		    	
				String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
				session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
					
				return "redirect:/getBackToCustomerPage";
			
			}
			
			
							 
		}
		else {
			
			//So, if the insertion of adding items into the 'cartItems' table FAILED, this part will run:
			
			String addToCartError = "Failed to Add Item into Cart!";
			
			session.setAttribute("addToCarErrorMessage", addToCartError);
			
			return "redirect:/getBackToCustomerPage";
			//destination = "view/customer";
						
		}
		
		
				
		//return destination;

		
		
	}//closing brace of the 'addItemsToCart' method.
	
	
	
	
//##############################################################################################	

	
	
	
	//This Method Increments the itemQuantity by 1.
	@PostMapping("/incrementItem")
	public String incrementItem(@RequestParam Map<String, String> req, HttpServletRequest request, ModelAndView model, RedirectAttributes redirectAttributes) {
		
		//Initializing a session object:
		HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
	
		
		
//.........................................................................................................................	             

		   
/*----1-----= Retrieving the itemId =----------*/		
		
		//Retrieving the itemId that the user has sent as request to this method:
		String strItemId =  req.get("itemId");
		
		
		//Parsing the 'strItemId' into Integer:
		int intItemId = Integer.parseInt(strItemId);
		



/*----2-----= Retrieving the userId =----------*/		  
		
	     //Retrieving the 'userId' from the session scope via the 'retrieveId()' method:
		 int userId = (Integer) session.getAttribute("userId");
		 
		 

		 
		 

/*----3-----= Incrementing the selectedQuantity of the item =----------*/
		 
		 
		 //I. Instantiating an object from the 'daoCart' class.
		 DaoCart cartObj = new DaoCart();
			
		 
		 //II. Calling the 'IncrementUpdateCartItemQuantity()' method:
		 boolean isIncremented = cartObj.IncrementUpdateCartItemQuantity(userId, intItemId); 
				 
			
		 
		 
		 if(isIncremented) {
			 
			//III. If the item successfully incremented:
			 
			 try {
					
				    //1. Retrieve the items from the 'cartItems' methods:
			    	List<CartItems> retrievedItems = cartObj.getCartItemsByUserId(userId);
			    		
			    	
			    	//2. Saving the retrieved items into the session scope:
			    	session.setAttribute("retrievedCartItems", retrievedItems);
			    	
			    	
			    	//3. Retrieving the items number in the 'cartItems' table.
			    	int itemsCount = cartObj.getCartItemCount(userId);
					
			    	
			    	//4. Saving the retrieved items number into the session scope:
					session.setAttribute("cartCounter", itemsCount);
					
					
					//5. This will keep the Cart Modal opened! - till the user manually closes the modal:
					session.setAttribute("openCartModal", true);

			    	
		    	
			    	return "view/customer";
			    	
				} 
			    catch (Exception e) {
					
					String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
					session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
		
				}
			 
		 }
		 else {
			 
			 //If the item FAILED to be incremented!
			 
			 String incrementError = "Failed to Increment item";	 
			 model.addObject("incrementError",incrementError);
			 			 
		 }
				
				    
				 
		 return "view/customer";			 
				   
		
		
	}//closing brace of the 'incrementItem()' method.
	

	
//##############################################################################################	

	
	
	

	//This Method Decrements the itemQuantity by 1. 
    @PostMapping("/decrementItem")	
    public String decrementItem(@RequestParam Map<String, String> req, HttpServletRequest request, ModelAndView model, RedirectAttributes redirectAttributes) {
		
    	
    	//Initializing a session object:
		HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
		

		

//.........................................................................................................................	             

		
		
/*----1-----= Retrieving the itemId =----------*/		
			
		
		
		//Retrieving the itemId that the user has sent as request to this method:		
		String strItemId =  req.get("itemId");
		
		//Parsing the 'strItemId' into Integer:
		int intItemId = Integer.parseInt(strItemId);
		
		
		
		
		
/*----2-----= Retrieving the userId =----------*/		  
		
	     //Retrieving the 'userId' from the session scope via the 'retrieveId()' method:
		 int userId = (Integer) session.getAttribute("userId");		
				
		        

		 
				
/*----3-----= Incrementing the selectedQuantity of the item =----------*/
		 
		 
		         //I. Instantiating an object from the 'daoCart' class.
				 DaoCart cartObj = new DaoCart();
				 
				 
				 
				//II. Calling the 'IncrementUpdateCartItemQuantity()' method:
			    boolean isDecremented = cartObj.decrementUpdateCartItemQuantity(userId, intItemId); 
				 
			    
				 
			    if(isDecremented) {
			    
			    	//III. If the item successfully decremented:
			    	
			    	
			    	try {
						
					    //1. Retrieve the items from the 'cartItems' methods:
				    	List<CartItems> retrievedItems = cartObj.getCartItemsByUserId(userId);
				    		
				    	
				    	//2. Saving the retrieved items into the session scope:
				    	session.setAttribute("retrievedCartItems", retrievedItems);
				    	
				    	
				    	//3. Retrieving the items number in the 'cartItems' table.
				    	int itemsCount = cartObj.getCartItemCount(userId);
						
				    	
				    	//4. Saving the retrieved items number into the session scope:
						session.setAttribute("cartCounter", itemsCount);
						
						
						//5. This will keep the Cart Modal opened! - till the user manually closes the modal:
						session.setAttribute("openCartModal", true);

				    	
			    	
				    	return "view/customer";
				    	
					} 
				    catch (Exception e) {
						
						String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
						session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
			
					}
			    	
			    	
			    }
			    else{
			    	
			    	 //If the item FAILED to be decremented!
					 
					 String decrementError = "Failed to deccrement item";	 
					 model.addObject("decrementError",decrementError);
			    	
			    }
			

		return "view/customer";
		
		
	}//closing brace of the 'decrementItem()' method.

  
    

//##############################################################################################    
    

    
      
  //This Method Removes Item from the cart.
  @PostMapping("/removeItem")
  public String removeItem(@RequestParam Map<String, String> req, HttpServletRequest request, ModelAndView model, RedirectAttributes redirectAttributes) {
	
	  
	  //Initializing a session object:
	  HttpSession session = request.getSession(false); //That false within the 'getSession(false)' is to not create session if it already exists
	
	
	
//.........................................................................................................................	             

		
		
      /*----1-----= Retrieving the itemId =----------*/		

	  
	  		//Retrieving the itemId that the user has sent as request to this method:		
	  		String strItemId =  req.get("itemId");
	  		
	  		//Parsing the 'strItemId' into Integer:
	  		int intItemId = Integer.parseInt(strItemId);
	  		
	  		
	  		
	  		
	  		
	  /*----2-----= Retrieving the userId =----------*/		  
	  		
	  	     //Retrieving the 'userId' from the session scope via the 'retrieveId()' method:
	  		 int userId = (Integer) session.getAttribute("userId");	
	
			

	  		 
	  		 
	  /*----3-----= Removing the item from the 'cartItems' table =----------*/
			 
	  		 
			 //I. Instantiating an object from the 'daoCart' class.
			 DaoCart cartObj = new DaoCart();
			 
			 //II. Calling the 'removeCartItem()' method:
			 boolean isRemoved = cartObj.removeCartItem(userId, intItemId); 
			 
			 
			 if(isRemoved) {
				 
				//III. If the item successfully removed:
				 
				 
				 try {
						
					    //1. Retrieve the items from the 'cartItems' methods:
				    	List<CartItems> retrievedItems = cartObj.getCartItemsByUserId(userId);
				    		
				    	
				    	//2. Saving the retrieved items into the session scope:
				    	session.setAttribute("retrievedCartItems", retrievedItems);
				    	
				    	
				    	//3. Retrieving the items number in the 'cartItems' table.
				    	int itemsCount = cartObj.getCartItemCount(userId);
						
				    	
				    	//4. Saving the retrieved items number into the session scope:
						session.setAttribute("cartCounter", itemsCount);
						
						
						//5. This will keep the Cart Modal opened! - till the user manually closes the modal:
						session.setAttribute("openCartModal", true);

				    	
			    	
				    	return "view/customer";
				    	
					} 
				    catch (Exception e) {
						
						String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
						session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
			
					}
				 
				 
			 }
			 else {
				 
				//If the item FAILED to be removed!
				 
				 String removingError = "Failed to remove item";	 
				 model.addObject("removingError",removingError);
				 
			 }
			 
			 
			
			 
			 
			    return "view/customer";
	
	
}//closing brace of the 'removeItem()' method.







	
}//closing brace of the class.
