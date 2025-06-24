<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Below is Taglib directive -->	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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


 <!-- Load Google Charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <!-- Prepare the chart -->
    <script type="text/javascript">
    
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Item Name', 'Count'],
                <c:forEach var="item" items="${ordersListForAnalytics}" varStatus="status">
                    ['${item.itemName}', ${item.itemCount}]${!status.last ? ',' : ''}
                </c:forEach>
            ]);
            
            var options = {
                title: 'Items Ordered on Selected Date',
                pieHole: 0.5,
                width: 800,
                height: 500
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
        
    </script>



	
	
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

/*============================================================================*/

.order-table-wrapper {
  width: 100vw;              
  margin: 0;                 
  padding: 20px 0;           
  background-color: #C9B194;
  border-radius: 0;          
}



.order-table {
  width: 100%;
  table-layout: fixed;
  font-size: 18px;
}


.order-table th,
.order-table td {
  padding: 14px 16px;
  text-align: center;
}


.order-table .dropdown-menu div {
  margin-bottom: 6px;
}

@media (max-width: 768px) {
  .order-table-wrapper {
    padding: 15px;
  }

  .order-table {
    font-size: 16px;
  }
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
		

          


          
           <a href="" id="box" style="float: right;" data-toggle="modal" data-target="#Inbox">
              
             <img src="${pageContext.request.contextPath}/images/gifs/deliveredOrders.gif" alt="Inbox" style="width: 40px; height: 40px;">
 
             <span class="inbox-items"> ( <c:if test="${empty sessionScope.inboxCounter }"> 0 </c:if> ${sessionScope.inboxCounter} ) </span>
        
           </a>
           
  
           
           <a href="${pageContext.request.contextPath}/accessAnalytics" style="float: right;">
           
             <img src="${pageContext.request.contextPath}/images/gifs/charts.gif" alt="Inbox" style="width: 40px; height: 40px;">
         
           </a>



           <a href="${pageContext.request.contextPath}/accessEditUserViewItems" style="float: right;">
           
             <img src="${pageContext.request.contextPath}/images/gifs/editItems.gif" alt="Inbox" style="width: 40px; height: 40px;">
         
           </a>

           
           		
		</div>


	</div>



<!-- ==============================================MODAL'S(POP-UP WINDOWS)====================================================== -->


<!-- ============--- Analytics Modal ---============ -->

<!-- This JS Code opens the Edit User Profile Modal -->
   <c:if test="${openAnalyticsModal}">
     
     <script>
   
          $(document).ready(function() { $('#openAnalyticsModal').modal('show'); });
 
     </script>
     
   </c:if>




    <!-- Modal for seeing sales Info -->
	<div class="modal fade" id="openAnalyticsModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
			
			<div class="modal-content">
				
				<div class="modal-header" style="background: #C9B194; padding: 20px;">
					
					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-size: 24px;">
					
					   Sales Analytics
						
				    </h5>
				    
				</div>

				<div class="modal-body" style="padding: 25px;">



					<form id="analyticsForm" method="post" action="${pageContext.request.contextPath}/retrieveOrdersForAnalytics">

						<label for="orderDate">Select Date:</label> 
						
						<input type="date" id="orderDate" name="orderDate" required pattern="\d{4}-\d{2}-\d{2}" title="Please use YYYY-MM-DD format">
						
						<button type="submit">Retrieve Orders</button>
					
					</form>



					<div id="donutchart" style="width: 100%; height: 500px; margin: auto;"></div>
							
							
									
				
				</div>

				<div class="modal-footer" style="padding: 20px; display: flex; justify-content: flex-end;">
					
					<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 8px 20px; font-size: 16px;">
					
					   Cancel
					   
					</button>
				
				</div>
			
			</div>
		
		</div>
	
	</div> <!-- Closing tag of the User-info Modal -->



<script>
  document.getElementById('analyticsForm').addEventListener('submit', function (e) {
    const input = document.getElementById('orderDate');
    const value = input.value.trim(); // Avoid empty spaces

    // Basic blank-check
    if (!value || value === "--") {
      alert("Please select a valid date before submitting.");
      e.preventDefault(); // Stop form from submitting
      return;
    }

    // If format is dd-mm-yyyy, convert it
    const parts = value.split('-');
    if (parts.length === 3 && parts[2].length === 4) {
      const [dd, mm, yyyy] = parts;
      if (yyyy.length === 4 && mm.length === 2 && dd.length === 2) {
        input.value = `${yyyy}-${mm}-${dd}`;
      }
    }
  });
</script>






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

					<h3 class="modal-title" style="font-weight: bold;">Delivered Orders</h3>

				</div>

				<div class="modal-body" style="display: flex; justify-content: space-between; gap: 20px;">



                   <div class="table-responsive">
				
				<table class="table table-bordered table-hover table-striped order-table">
					
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
					
						<c:forEach var="order" items="${sessionScope.retrievedOrders}">
						
						 <c:if test="${order.status eq 'delivered'}">
						
							<tr>
							
								<td><strong>${order.orderId}</strong></td>
								
								<td>
								
									<div class="dropdown">
									
										
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">
											    
											    User Info
											    
									    </button>
									    
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
								
								<td>
									<div class="dropdown">
										
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">Item Info</button>
										
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
								
								
								<td class="text-center text-danger font-weight-bold price-cell"> ${order.itemPriceSum}  IQD  </td>
								
								
								<td>
								
									<div class="dropdown">
									
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">
											    
											    Delivery Info
											    
									    </button>
									    
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
								
								<td class="text-center">
  
                                      ${order.status}
                                              
                                 <img src="${pageContext.request.contextPath}/images/gifs/delivered.gif" alt="Inbox" style="width: 40px; height: 40px;">                              
                                        
                                  
                                    
                                    
                               </td>

								
							</tr> 
							
							</c:if>


					

						</c:forEach>
						
					</tbody>
					
				</table>
				
			</div>
					
					

				</div> <!-- closing tag of the modal body -->


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
		<main class="order-table-wrapper">


			<h2 class="menu-title text-center mb-4"> Undelivered Orders</h2>


			<div class="table-responsive">
				
				<table class="table table-bordered table-hover table-striped order-table">
					
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
					
						<c:forEach var="order" items="${sessionScope.retrievedOrders}">
						
						 <c:if test="${order.status ne 'cancelled' && order.status ne 'delivered'}">
						
							<tr>
							
								<td><strong>${order.orderId}</strong></td>
								
								<td>
								
									<div class="dropdown">
									
										
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">
											    
											    User Info
											    
									    </button>
									    
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
								
								<td>
									<div class="dropdown">
										
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">Item Info</button>
										
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
								
								
								<td class="text-center text-danger font-weight-bold price-cell"> ${order.itemPriceSum}  IQD  </td>
								
								
								<td>
								
									<div class="dropdown">
									
										<button class="btn btn-outline-secondary btn-sm dropdown-toggle w-100"
											    type="button" data-toggle="dropdown">
											    
											    Delivery Info
											    
									    </button>
									    
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
								
								<td class="text-center">
                                   
                                    <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#statusModal${order.orderId}">
    
                                      ${order.status}
  
                                    </button>
                                    
                                    
                                    <c:choose>
                                    
                                       <c:when test="${order.status eq 'pending'}">
                                       
                                          <img src="${pageContext.request.contextPath}/images/gifs/pending.gif" alt="Inbox" style="width: 40px; height: 40px;">                              
                                        
                                       </c:when>
                                       
                                       <c:when test="${order.status eq 'processing'}">
                                       
                                          <img src="${pageContext.request.contextPath}/images/gifs/baking.gif" alt="Inbox" style="width: 40px; height: 40px;">                              
                                        
                                       </c:when>
                                       
                                       <c:when test="${order.status eq 'onway'}">
                                       
                                          <img src="${pageContext.request.contextPath}/images/gifs/onway.gif" alt="Inbox" style="width: 40px; height: 40px;">                              
                                        
                                       </c:when>
                                       
                                       
                                    
                                    </c:choose>
                                    
                                    
                               </td>

								
							</tr> 
							
							</c:if>





							<!-- Status Update Modal for this order -->
							<div class="modal fade" id="statusModal${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel${order.orderId}" aria-hidden="true">
								
								<div class="modal-dialog" role="document">
									
									<div class="modal-content">

										<div class="modal-header bg-light">
											
											<h5 class="modal-title" id="statusModalLabel${order.orderId}">
											
											    Update Order Status (ID: ${order.orderId})
											
											</h5>
											
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												
												<span aria-hidden="true">&times;</span>
												
											</button>
											
										</div>


										
										<form action="updateOrderStatus" method="post">
											
											<div class="modal-body">

												
												<input type="hidden" name="orderId" value="${order.orderId}" />
												<input type="hidden" name="userId" value="${order.userId}" />
												

												
												<div class="form-group">
													
													<label for="newStatus${order.orderId}"> Select New Status </label> 
						
						                            <select class="form-control" id="newStatus${order.orderId}" name="status">
														
														<option value="pending">pending</option>
														<option value="processing">processing</option>
														<option value="onway">onway</option>
														<option value="delivered">delivered</option>
														<option value="cancelled">cancelled</option>
														
													</select>
													
												</div>

											</div>

											<div class="modal-footer">
											
												<button type="submit" class="btn btn-success">
												   
												   Update Status
												   
												</button>
												
												<button type="button" class="btn btn-secondary" data-dismiss="modal">
												
												    Cancel
												    
												</button>
												
											</div>
											
										</form>

									</div>
									
								</div>
								
							</div>

						</c:forEach>
						
					</tbody>
					
				</table>
				
			</div>
			
			
			
			
			
			
			
			
		</main>





	</div> <!-- Closing brace of the main -->


<script>

 //This Java-script method below adds a ' , ' in the Price number (e.g. 1750 IQD -> 1,750 IQD)
  document.addEventListener("DOMContentLoaded", function () {
     
	                                                          const priceCells = document.querySelectorAll(".price-cell");

                                                              priceCells.forEach( cell => {
    	
                                                                                            let rawText = cell.textContent.trim().replace("IQD", "").trim();
      
                                                                                            let number = parseInt(rawText);
      
                                                                                             if (!isNaN(number)) {
    	  
                                                                                                                   // Formating with commas
                                                                                                                   cell.textContent = number.toLocaleString("en-US") + " IQD";
        
                                                                                                                 }
      
                                                                                            });
    
                                                            });
 
 
</script>




</body>

</html>