<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<%


if(session == null || session.getAttribute("fullName") == null){
	
	response.sendRedirect("login.jsp?sessionExpiredMessage=Session+expired+please+logIn+again!");

	return;
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Bakery Order System</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerViewStyle.css">


<%-- Link to the CSS file for this userInfo modal view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userInfoModalStyle.css">


<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/CheckoutModalStyle.css">


<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	
	
<link rel = "shortcut icon" href="favicon.ico" type="image/x-icon">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
 <script src="https://kit.fontawesome.com/815d5311a8.js" crossorigin="anonymous"></script>
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="mycart.js"></script>
 <script src="myscript.js"></script>	
	
	
<style type="text/css">

	
/* ===== BASE STYLES ===== */
body {
  font-family: "Pacifico", cursive;
  font-style: normal;
  margin: 0;
  color: #885539;
}

#heading-title:hover{

text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff;

}

#person{

 color: #4a403a;
}

#person:hover{

color: #DBDBDB;
}


#cartBasket{

color: #4a403a;
}

#cartBasket:hover{

color: #DBDBDB;
}


#box{

color: #4a403a;
}

#box:hover{

color: #DBDBDB;
}




/* ===== MENU CONTAINER ===== */
.menu-container {
  background-color: #A57A5A;
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
  border-radius: 8px;
}

.menu-title {
  text-align: center;
  font-size: 46px;
  font-weight: bold;
  margin-bottom: 30px;
  text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
   transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.menu-title:hover {

  transform: translateY(-10px) scale(1.05);
  text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff;
}

/*=======================================================================*/


/* ===== CATEGORY BUTTONS ===== */
.category-buttons {
  display: flex;
  justify-content: center;
  gap: 30px;
  margin-bottom: 30px;
}

.category-btn {
  background: #F5F5DD;
  color: #885539;
  border: none;
  padding: 12px 30px;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.category-btn:hover {
  background: #885539;
  color: #F5F5DD;
  transform: translateY(-3px);
}

/*=======================================================================*/



/* ===== MODAL STYLES ===== */


.modal-header {
  margin-bottom: 20px;
  background-color: #C9B194;
  
}


.modal-title {
  font-size: 24px;
  color: #4a403a;
  margin: 0;
   
}

.modal-body {
  margin-bottom: 20px;
}

.modal-body p{

font-size:19px; 
}



.modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}





/*=======================================================================*/

.menu-items {
	
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px;
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
 
}




.menu-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px;
}
	

/* Card Styles */
.card {
    flex: 1 1 calc(33.33% - 20px);
    background-color: #C9B194;
    border: 2px solid #A08963;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 350px; 
    padding: 10px;
}





.card-content img {
    width: 100%;
    height: 200px; 
    object-fit: cover; 
    border-radius: 5px;
    display: block; 
}

.card-content h1 {
    font-family: 'Pacifico', cursive; 
    font-style: normal;
    font-size: 30px;
    margin: 10px 0;
    color: #4a403a;
}

.card-action {
    font-family: 'Pacifico', cursive; 
    font-style: normal;
    margin-top: auto; 
    text-align: center;
}

.card-action button {
    background-color: #A08963;
    color: #DBDBDB;
    border: none;
    padding: 10px 20px;
    font-size: 22px;
    border-radius: 5px solid #344C3D;
    cursor: pointer;
}

.card-action button:hover {
    background-color: white;
    color: #A57A5A;
      
}

#itemDropdown {
    width: 250px;          
    height: 45px;        
    font-size: 16px;    
    padding: 8px 12px;   
}


/*=======================================================================*/


/* CSS code of the cart +,-,trash buttons*/

.cart-item-header, .cart-item-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
}

.item-name, .item-quantity, .item-price, .item-actions {
    flex: 1;
    text-align: center;
}

.item-actions {
    display: flex;
    justify-content: center;
    gap: 8px;
}

.btn-quantity, .btn-delete {
    width: 30px;
    height: 30px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    
    /* Add transition for smooth animation */
    transition: all 0.2s ease-in-out;
    
    /* Add a subtle shadow for depth */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.btn-quantity {
    font-weight: bold;
    font-size: 16px;
}

.btn-delete {
    font-size: 14px;
}

/* Hover effects */
.btn-increase:hover {
    background-color: #218838 !important; /* Slightly darker green */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-decrease:hover {
    background-color: #e0a800 !important; /* Slightly darker yellow */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-delete:hover {
    background-color: #c82333 !important; /* Slightly darker red */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

/* Active/pressed effect */
.btn-increase:active, 
.btn-decrease:active, 
.btn-delete:active {
    transform: translateY(1px) scale(0.98);
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
}



</style>



</head>


<!--=========================-- Body of the WebPage --========================-->

<body style="font-family: ''Pacifico', cursive;

             font-style: normal;

             background: linear-gradient(rgba(255, 255, 255, 0.5)), 
             
             url('https://hicaps.com.ph/wp-content/uploads/2022/12/bakery-products.jpg') no-repeat center center fixed;
  
             background-size: cover;
     
             margin: 0;
  
             height: 100vh; ">









<!-- if adding item into the Cart failed! this message will be shown -->
<c:if test="${not empty sessionScope.addToCartErrorMessage}">

    <script type="text/javascript">
    
      alert('${sessionScope.addToCarErrorMessage}');
      
    </script>

</c:if>







	<!--  N A V I G A T I O N   B A R  -->
	<div class="topnav" id="myTopnav">


		<div class="navtop" id="mynavTop" style="background-color: #C9B194;">

            <a href="" id="person" style="float: right;" data-toggle="modal" data-target="#userModal"> <i class="fas fa-user" ></i> </a> 
			
            <a href="" id="cartBasket" style="float: right;" data-toggle="modal" data-target="#cart"> <i class="fas fa-shopping-cart"  ></i> <span class="cart-items"> (<c:if test="${empty sessionScope.cartCounter }"> 0 </c:if> ${sessionScope.cartCounter} ) </span> </a> 

            <a href="" id="box" style="float: right;" data-toggle="modal" data-target="#Inbox"> <i class="fas fa-box-open" ></i> <span class="inbox-items"> ( 0 ) </span> </a>

		</div>


	</div>


<!-- =========================================================================================================================== -->
<!-- ==============================================MODAL'S(POP-UP WINDOWS)====================================================== -->


<!-- ========- USER INFO MODAL -======= -->

	<!-- Modal(pop-up window) for the User Info -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document" >

			<div class="modal-content">

				<div class="modal-header" style="background: #C9B194;">

					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">User Information</h5>

				</div>

				<div class="modal-body">

                   
					<c:choose>
					
					<c:when test="${not empty sessionScope.fullName && not empty sessionScope.email && not empty sessionScope.phoneNo }">
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Name:</strong>
					    <span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.fullName}" /> </span>
					</p>
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Email:</strong>
						<span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.email}" /> </span>
					</p>
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Phone:</strong>
						<span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.phoneNo}" /> </span>
					</p>
					
					</c:when>

                    <c:otherwise>
                     
					   <p>User details not available.</p>

                    </c:otherwise>
                     
                     
					</c:choose>

                     

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                 <form name="logOutForm" method="get" action="${pageContext.request.contextPath}/logout" style="display:inline;">

					<button type="submit" class="btn btn-danger"> Logout </button>
					
				</form>	

				</div>


			</div>

		</div>

	</div> <!-- Closing tag of the User-info Modal -->



<!-- ################################################################################################################################ -->



<!-- ========- INBOX MODAL -=========== -->


<!-- Inbox Modal -->
	<div class="modal fade" id="Inbox" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Your Orders</h3>

				</div>

				<div class="modal-body"
					style="display: flex; justify-content: space-between; gap: 20px;">

					<!-- Left Section: Cart Items -->
					<div style="width: 50%;">

						<h5>Your Ordered Items</h5>

						<div class="checkout-cart-body"></div>

						<p style="font-size: 20px; margin-top: 10px;">

							<strong>Total Price: </strong><span id="checkoutTotalPrice">0</span>
							IQD

						</p>

					</div>


					<!-- Right Section: User Info Form -->
					<div style="width: 40%;">

						<h5>Status</h5>



					</div>

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>


			</div>

		</div>

	</div> <!-- Closing Tag of the Inbox Modal -->



<!-- ################################################################################################################################ -->



<!-- ========- CART MODAL -=========== -->

<!-- Cart Modal -->
	<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" >
			
			<div class="modal-content">
				
				<div class="modal-header" style="background-color: #C9B194;">
					
					<h3 class="modal-title" style="font-weight: bold; color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;"> Cart</h3>
				
				</div>


				<div class="modal-body">
				
					
					<div class="cart-body">
					
						<c:choose>
						
							<c:when test="${not empty sessionScope.retrievedCartItems}">
							
								<div class="cart-item-header" style="background-color: #C9B194;">
								
									<span class="item-name"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Item Name</strong></span>
									 
									<span class="item-quantity"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Quantity</strong></span>
									
									<span class="item-price"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Price</strong></span>
									
									<span class="item-actions"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Actions</strong></span>
								
								</div>

								<!-- Looping through the items -->
								<c:forEach var="x" items="${sessionScope.retrievedCartItems}">
									
									<div class="cart-item">
										
										<div class="cart-item-row">
											
											<span class="item-name"><strong style="color: #A08963; font-size: 22px; font-family: 'Pacifico', cursive; font-style: normal;"><c:out value="${x.itemName}" /></strong></span>
														 
											<span class="item-quantity" style="color: #4a403a; font-size: 22px;"><c:out value="${x.selectedQuantity}" /></span>
											
											<span class="item-price" style="color: #D5451B; font-size: 22px;"><c:out value="${x.selectedQuantity * 125}" /> IQD</span> 
											
											<span class="item-actions">
												
											    <button class="btn btn-quantity btn-increase" style="background-color: #28a745; color: white;">+</button>
												
											    <button class="btn btn-quantity btn-decrease" style="background-color: #ffc107; color: black;">-</button>
												
											    <button class="btn btn-delete" style="background-color: #dc3545; color: white;"> <i class="fas fa-trash"></i> </button>
											
											</span>
											
										</div>
										
									</div>
									
								</c:forEach>
								
							</c:when>

							<c:otherwise>
							
								<div class="empty-cart">
								
									<i class="fas fa-shopping-cart"></i>
									
									<p>Your cart is empty</p>
									
								</div>
								
							</c:otherwise>
							
						</c:choose>
						
					</div>  <!-- Closing tag of the cart body -->


					<!-- Total Price -->
					<div class="total-price-container">
						
						<div class="total-line">
							
							<strong style="color: #4a403a; font-size: 24px; font-family: 'Pacifico', cursive; font-style: normal;">Total:</strong>
							
							<span id="totalPrice" style="color: #D5451B; font-size: 22px;">
								
								<c:if test="${not empty sessionScope.retrievedCartItems}">
									
									<c:set var="total" value="0" />
									
									<c:forEach var="x" items="${sessionScope.retrievedCartItems}">
										
										<c:set var="total" value="${total + (x.selectedQuantity * 125)}" />
									
									</c:forEach>
                           
                           
                                       ${total}
               
                               </c:if>
                
                              
                               <c:if test="${empty sessionScope.retrievedCartItems}">0</c:if>
								
								   IQD
							</span>
							
						</div>
						
					</div>
					
					
					
				</div> <!-- Closing tag of the modal body -->


				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
					<button type="button" class="btn btn-primary checkout-btn" onclick="Checkout()">Checkout</button>
				
				</div>
				
				
			</div>
			
		</div>
		 
		
	</div> <!-- Closing Tag of the Cart Modal -->




<!-- ################################################################################################################################ -->



<!-- ========- CHECKOUT MODAL -=========== -->


<!-- Checkout Modal -->
	<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Checkout</h3>

				</div>

				<div class="modal-body" style="display: flex; justify-content: space-between; gap: 20px;">

					<!-- Left Section: Cart Items -->
					<div style="width: 50%;">

						<h5>Your Items</h5>

						<div class="checkout-cart-body"></div>

						<p style="font-size: 20px; margin-top: 10px;">

							<strong>Total Price: </strong><span id="checkoutTotalPrice">0</span> IQD

						</p>

					</div>


					<!-- Right Section: User Info Form -->
					<div style="width: 40%;">

						<h5>Delivery Information</h5>

						<form id="deliveryForm">

							<div class="form-group">

								<label for="citySelect">City</label> <select id="citySelect" class="form-control" required>

									<option value="">Select District</option>
									<option value="Sulaymaniyah">Sulaymaniya</option>
									<option value="Erbil">Erbil</option>
									<option value="Duhok">Duhok</option>

								</select>

							</div>

							<div class="form-group">

								<label for="addressInput">Address</label>

								<textarea id="addressInput" class="form-control" rows="3" placeholder="Enter your address" required></textarea>

							</div>

							<button type="button" class="btn btn-success" onclick="processDelivery()">Order</button>

						</form>

					</div>

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>

				</div>


			</div>


		</div>

	</div> <!-- Closing Tag of the Checkout Modal -->



<!-- =========================================================================================================================== -->
<!-- =========================================================================================================================== -->






	<!--=========================--  M A I N   C O N T E N T  --====================-->

	<div id="heading">

		<h1 id="heading-title" style="font-family: 'Pacifico', cursive; font-style: normal; margin-top: 40px; color: #4a403a;"> Suly Bakery</h1>

	</div>


	<!--  I T E M   C A R D S  -->

	<div id="main" style="margin-top: 40px;">

   <!-- Main Content - Menu Section -->
<main class="menu-container" style="background-color: #C9B194;">

 <div >
 
    <h2 class="menu-title" style="font-family: 'Pacifico', cursive; font-style: normal; font-weight: bold; font-size: 46px; color: #4a403a;">  Our Menu </h2>
    
    
    
    
    <!-- Category Buttons -->
     <div style="display: flex; justify-content: center; gap: 30px; margin-bottom: 8px;">
               
           <form method="get" action="customerViewCategoryController">    
            
                <input type="hidden" name="category" value="Breads">
                
                <button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; font-style: normal;
                                                                  background-color: white; color: #4a403a; border: 2px solid white; 
                                                                  padding: 8px 20px;  font-size: 18px; font-weight: bold; cursor: pointer;">
                        
                    Breads
                                    
                </button>
                
           </form>     
            
              <form method="get" action="customerViewCategoryController">  
                  
                <input type="hidden" name="category" value="Cakes">
                
                <button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; font-style: normal;
                                                                  background-color: white; color: #4a403a; border: 2px solid white; 
                                                                  padding: 8px 20px;  font-size: 18px;  font-weight: bold; cursor: pointer;">
                        
                    Cakes
                    
                </button>
                
              </form>  
      </div>
    
    
    <div class="menu-items" style="background-color: #F2F3F1">
       
       
       <div class="menu-grid" style="margin-top: 40px;">
       
        <c:choose>
    
          
           <c:when test="${showCategory == 'Breads' || empty showCategory }">
       
               <c:forEach var="bread" items="${retrievedBreads}">
      
                  <div class="card">
       
                       <div class="card-content">
           
                            <img src="${bread.imgURL}" class="item-img" />
            
                            <h1>${bread.itemName}</h1>
               
                       </div>
       
       
                       <div class="card-action">
          
                           <button class="btn btn-primary" onclick="openModal('${bread.id}', '${bread.itemName}', '${bread.itemDesc}')">
                              
                              Select
                   
                           </button>
            
                       </div>
        
                   </div>
     
                 </c:forEach>
  
          </c:when>
       
       
          
          <c:when test="${showCategory == 'Cakes'}">
       
       
                 <c:forEach var="desert" items="${retrievedDeserts}">
      
                      <div class="card" >
       
       
                            <div class="card-content" >
           
                                <img src="${pageContext.request.contextPath}${desert.imgURL}" class="item-img" />
            
                                <h1>${desert.itemName}</h1>
               
                            </div>
       
       
                            <div class="card-action" >
          
                                 <button class="btn btn-primary" onclick="openModal('${desert.id}', '${desert.itemName}', '${desert.itemDesc}')">
                      
                                        Select
                    
                                 </button>
            
                            </div>
        
        
                      </div>
     
                 </c:forEach>
       
       
         </c:when>
       
       
      </c:choose>
       
   </div>
       
       
    </div>
    
    </div>
    
</main>

    
   
   
    </div> <!-- Closing brace of the main -->




<!-- All Modals (placed at the bottom of the page) -->

<!-- Bread Modals -->

<!-- Modal 1 -->
<div class="modal fade" id="itemModal1" tabindex="-1" role="dialog" aria-hidden="true">
    
    <div class="modal-dialog" role="document">
       
        <div class="modal-content">
        
            <div class="modal-header">
            
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
                
            </div>
            
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm1" autocomplete="off">
                
                <div class="modal-body">
                
                    <p id="itemDescription"></p>
                    
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                        
                    </select>
                    
                </div>
                
                <div class="modal-footer">
                
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    
                    <input type="hidden" name="itemName" value="Baguette Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                    
                </div>
                
            </form>
            
        </div>
        
    </div>
    
</div>

<!-- Modal 2 -->
<div class="modal fade" id="itemModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm2" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Brioche Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 3 -->
<div class="modal fade" id="itemModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm3" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Ciabatta Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 4 -->
<div class="modal fade" id="itemModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm4" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Multigrain Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 5 -->
<div class="modal fade" id="itemModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm5" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Whole Wheat">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 6 -->
<div class="modal fade" id="itemModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm6" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Lavash Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 7 -->
<div class="modal fade" id="itemModal7" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm7" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Thin Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 8 -->
<div class="modal fade" id="itemModal8" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm8" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Naan Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 9 -->
<div class="modal fade" id="itemModal9" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm9" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Tortilla">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 10 -->
<div class="modal fade" id="itemModal10" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm10" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Crispy Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 21 -->
<div class="modal fade" id="itemModal21" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm21" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Kurdish Bread">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 22 -->
<div class="modal fade" id="itemModal22" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm22" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Kulera">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal 30 -->
<div class="modal fade" id="itemModal30" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm30" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="German Breads">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal 31 -->
<div class="modal fade" id="itemModal31" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm31" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Crotian Breads">
                    <input type="hidden" name="itemType" value="Bread">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Cake Modals -->
<!-- Modal 11 -->
<div class="modal fade" id="itemModal11" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm11" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Kunafa">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 12 -->
<div class="modal fade" id="itemModal12" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm12" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Cherry Cake">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 13 -->
<div class="modal fade" id="itemModal13" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm13" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Lemon Cake">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 14 -->
<div class="modal fade" id="itemModal14" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm14" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Strawberry Cake">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 15 -->
<div class="modal fade" id="itemModal15" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm15" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Donut">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 16 -->
<div class="modal fade" id="itemModal16" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm16" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Croissant">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 17 -->
<div class="modal fade" id="itemModal17" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm17" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Baklava">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 18 -->
<div class="modal fade" id="itemModal18" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm18" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Apple Cake">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 19 -->
<div class="modal fade" id="itemModal19" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm19" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Caramel Candy">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 20 -->
<div class="modal fade" id="itemModal20" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemModalLabel" style="font-family: 'Pacifico', cursive; font-style: normal;"></h5>
            </div>
            <form name="AddtoCartForm" method="post" action="${pageContext.request.contextPath}/addToCartController" id="itemForm20" autocomplete="off">
                <div class="modal-body">
                    <p id="itemDescription"></p>
                    <select id="itemDropdown" class="price-dropdown" name="selectedQuantity">
                        <option value="2">2 pieces ~ 250iqd</option>
                        <option value="4">4 pieces ~ 500iqd</option>
                        <option value="8">8 pieces ~ 1000iqd</option>
                        <option value="12">12 pieces ~ 1500iqd</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="itemName" value="Chocolate Cake">
                    <input type="hidden" name="itemType" value="Desert">
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script>

//This 'openModal()' method! allows us to select the items & and be able to Add them into the cart.

 let selectedItem = {}; // Object to hold the details of the selected item.

 // Function to open the modal and populate details
 function openModal(id, title, description) {
	 
	 selectedItem.id = id;
	    selectedItem.title = title;
	    
	    // Get the specific modal for this item
	    var modal = $('#itemModal' + id);
	    
	    // Update the modal content
	    modal.find('.modal-title').text(title);
	    modal.find('#itemDescription').text(description);
	    
	    // Open the correct modal
	    modal.modal('show');
    
    
 }//closing brace of the 'openModal()' method.




</script>

	
		


<!--********************************************************************************************************-->






	<!-- Footer -->
	<div id="footer" style="margin-top: 40px; background-color: #C9B194;" >

		<!-- Phone Numbers -->
		<div class="footer__contact">
		
			<i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">+964 750 141 8006</i> <br> <i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">+964 771 152 8011</i>
			
		</div>

		<!-- Social Media Icons -->
		<div class="footer__social">
		
			<ul class="horizontal-list text-center social-icons">
			
				<!-- Instagram Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-instagram"></i> </a> </li>
				
				<!-- YouTube Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-youtube"></i> </a> </li>
				
				<!-- Facebook Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-facebook"></i> </a> </li>
				
			</ul>
			
		</div>

		<!-- Email -->
		<div class="footer__mail">
		
			<i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">SulyBakery@gmail.com</i>
			
		</div>

	</div>




</body>

</html>