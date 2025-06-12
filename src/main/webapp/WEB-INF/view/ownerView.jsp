<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Below is Taglib directive -->	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	




<!DOCTYPE html>

<html>

<head>

<title>Bakery Order System</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



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


.dropdown-menu div {
    margin-bottom: 5px;
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



/* Checkout modal css code for the items list */
.items-list {
    max-height: 300px;  /* Adjust height as needed */
    overflow-y: auto;   /* Adds vertical scroll */
    padding-right: 10px; /* Prevents content from hiding behind scrollbar */
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



	<!--  N A V I G A T I O N   B A R  -->
	<div class="topnav" id="myTopnav">


		<div class="navtop" id="mynavTop" style="background-color: #C9B194;">

            <a href="" id="person" style="float: right;" data-toggle="modal" data-target="#userModal"> <i class="fas fa-user" ></i> </a> 
			
            
            <a href="" id="box" style="float: right;" data-toggle="modal" data-target="#Inbox" > <i class="fas fa-box-open" ></i> <span class="inbox-items"> ( <c:if test="${empty sessionScope.inboxCounter }"> 0 </c:if> ${sessionScope.inboxCounter} ) </span> </a>

		</div>


	</div>



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

<!-- 
<c:if test="${not empty sessionScope.showInboxModal}">
    <script>
        $(function() {
            $('#Inbox').modal('show');
        });
    </script>
    <c:remove var="showInboxModal" scope="session" />
</c:if>


-->


<!-- Inbox Modal -->
	<div class="modal fade" id="Inbox" tabindex="-1" role="dialog" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Your Orders</h3>

				</div>

				<div class="modal-body" style="display: flex; justify-content: space-between; gap: 20px;">
 
 
					<!-- Left Section: Cart Items -->
					<div style="width: 100%;">

						<h5>Your Ordered Items</h5>

						<div class="checkout-cart-body">


							<!-- Table Header -->
							<div class="cart-item-header" style="display: flex; justify-content: space-between; padding: 12px 20px; background-color: #f8f9fa; border-bottom: 1px solid #dee2e6; font-weight: bold; margin-bottom: 10px;">


								<span style="width: 50%;">Item Name</span> 
								
								<span style="width: 20%; text-align: center;">Quantity</span>
								
								<span style="width: 30%; text-align: right;">Sum</span>
								
								<span style="width: 30%; text-align: right;">Status</span>


							</div>


							<!-- Initialize total price -->
							<c:set var="total" value="0" />



							<div class="items-list">

								<!-- Loop through ordered items -->
								<c:forEach var="o" items="${sessionScope.retrievedOrderedItems}">


									<c:set var="itemTotal" value="${o.itemPriceSum}" />

									<c:set var="total" value="${total + itemTotal}" />


									<div class="cart-item-row" style="display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; border-bottom: 1px solid #eee; margin-bottom: 8px;">


										<span style="width: 50%; font-weight: 500;">${o.itemName}</span>

										<span style="width: 20%; text-align: center;">${o.selectedQuantity}</span>

										<span style="width: 30%; text-align: right; color: #D5451B;">${o.itemPriceSum} IQD</span>
										
										<span style="width: 20%; text-align: center;">${o.status}</span>


									</div>


								</c:forEach>


							</div>


							<!-- Total price display -->
							<div style="margin-top: 25px; text-align: right; padding: 15px 20px; background-color: #f8f9fa; border-top: 1px solid #dee2e6; font-size: 18px;">

								<strong>Total Price: </strong> 
								
								<span id="checkoutTotalPrice" style="color: #D5451B; font-weight: bold;">${total}</span> IQD

							</div>


						</div> 


					</div>
					
				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>

				</div>


			</div>

		</div>

	</div> <!-- Closing Tag of the Inbox Modal -->



<!-- ################################################################################################################################ -->




	<!--=========================--  M A I N   C O N T E N T  --====================-->

	<div id="heading">

		<h1 id="heading-title" style="font-family: 'Pacifico', cursive; font-style: normal; margin-top: 40px; color: #4a403a;"> Suly Bakery</h1>

	</div>


	<!--  I T E M   C A R D S  -->

	<div id="main" style="margin-top: 40px;">

   <!-- Main Content - Menu Section -->
   <main class="menu-container" style="background-color: #C9B194;">

   
 
    <h2 class="menu-title" style="font-family: 'Pacifico', cursive; font-style: normal; font-weight: bold; font-size: 46px; color: #4a403a;">  All Undelivered Orders </h2>


			<!-- Order Table -->
			<div class="table-responsive">
				<table
					class="table table-bordered table-hover table-striped bg-light text-dark">
					<thead class="thead-dark">
						<tr>
							<th>Order ID</th>
							<th>User Info</th>
							<th>Item Info</th>
							<th>Total Price</th>
							<th>Delivery Info</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${retrievedOrders}">
							<tr>
								<!-- Order ID -->
								<td><strong>${order.orderId}</strong></td>

								<!-- User Info Dropdown -->
								<td>
									<div class="dropdown">
										<button
											class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											type="button" data-toggle="dropdown" aria-expanded="false">
											User Info</button>
										<div class="dropdown-menu p-2">
											<div>
												<strong>User ID:</strong> ${order.userId}
											</div>
											<div>
												<strong>Phone:</strong> ${order.userPhoneNo}
											</div>
										</div>
									</div>
								</td>

								<!-- Item Info Dropdown -->
								<td>
									<div class="dropdown">
										<button
											class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											type="button" data-toggle="dropdown" aria-expanded="false">
											Item Info</button>
										<div class="dropdown-menu p-2">
											<div>
												<strong>Item ID:</strong> ${order.itemId}
											</div>
											<div>
												<strong>Name:</strong> ${order.itemName}
											</div>
											<div>
												<strong>Qty:</strong> ${order.selectedQuantity}
											</div>
										</div>
									</div>
								</td>

								<!-- Price Sum -->
								<td class="text-right text-danger font-weight-bold">
									${order.itemPriceSum} IQD</td>

								<!-- Delivery Info Dropdown -->
								<td>
									<div class="dropdown">
										<button
											class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											type="button" data-toggle="dropdown" aria-expanded="false">
											Delivery Info</button>
										<div class="dropdown-menu p-2">
											<div>
												<strong>Location:</strong> ${order.location}
											</div>
											<div>
												<strong>Address:</strong> ${order.deliveryAddress}
											</div>
										</div>
									</div>
								</td>

								<!-- Status -->
								<td class="text-center font-weight-bold">${order.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>





		</main>

    
   
   
    </div> <!-- Closing brace of the main -->




</body>

</html>