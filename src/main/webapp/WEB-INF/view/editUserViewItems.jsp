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


.order-table-wrapper {
  width: 100%;
  display: flex;
  justify-content: center;
  padding: 40px 0;
  box-sizing: border-box;
  clear: both;
}



.category-btn {
  background-color: #fff;
  border: 2px solid #885539;
  color: #885539;
  font-family: "Pacifico", cursive;
  padding: 8px 16px;
  font-size: 18px;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.category-btn:hover {
  background-color: #885539;
  color: white;
}

.category-buttons {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 15px;
  flex-wrap: wrap; /* Optional: wrap on small screens */
  margin-bottom: 30px;
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
		
        

           <form method="get" action="getBackToOwnerView" style="float: left; margin: 0; padding: 0;">
            
                 <button class="detailsBtn" type="submit" style="margin-top: 10px; margin-left: 4px; padding: 5px; font-size: 22px; border: none; ">       
             
                               <i class="fas fa-arrow-left"></i>                               
                 </button>
                 
            </form>

           
           
           		
		</div>


	</div>






	<!--=========================--  M A I N   C O N T E N T  --====================-->

	<div id="heading">

		<h1 id="heading-title" style="font-family: 'Pacifico', cursive; font-style: normal; margin-top: 40px; color: #4a403a;"> Edit Items</h1>

	</div>


	<!--  I T E M   C A R D S  -->

	<div id="main" style="margin-top: 40px;">


		<main class="menu-container" style="background-color: #C9B194; padding: 30px;">

			<div>
			
				<h2 class="menu-title" style="font-family: 'Pacifico', cursive; font-style: normal; font-weight: bold; font-size: 46px; color: #4a403a;">Items
					
					Available in the Menu
					
				</h2>

			
				<div style="display: flex; justify-content: center; gap: 30px; margin-bottom: 30px;">
					
					<form method="get" action="EditUserViewCategoryController">
						
						<input type="hidden" name="category" value="Breads">
						
						<button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; background-color: white; color: #4a403a; border: 2px solid white; padding: 8px 20px; font-size: 18px; font-weight: bold; cursor: pointer;">
							
							Breads
							
					    </button>
					    
					</form>


					<form method="get" action="EditUserViewCategoryController">
						
						<input type="hidden" name="category" value="Cakes">
						
						<button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; background-color: white; color: #4a403a; border: 2px solid white; padding: 8px 20px; font-size: 18px; font-weight: bold; cursor: pointer;">
							
							Cakes
							
						</button>
						
					</form>
					
				</div>


				<div style="display: flex; justify-content: center; margin-bottom: 30px;">
					
					<form method="get" action="${pageContext.request.contextPath}/AddItem">
						
						<button type="submit" style="font-family: 'Pacifico', cursive; background-color: #00b300; color: white; border: none; border-radius: 8px; padding: 12px 30px; font-size: 18px; font-weight: bold; cursor: pointer; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); transition: background-color 0.3s;">
							 
							 Add Item
							 
					    </button>
					    
					</form>
					
				</div>



				<div class="menu-items" style="background-color: #F2F3F1; padding: 20px; border-radius: 10px;">
					
					<div class="menu-grid" style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">



						<c:choose>
									
							<c:when test="${showCategory == 'Breads' || empty showCategory }">
								
								
								<c:forEach var="bread" items="${sessionScope.retrievedBreads}">
									
									<div class="card" style="background: white; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 260px; text-align: center; overflow: hidden;">
										
										
										<div class="card-content" style="padding: 15px;">
											
											<img src="${bread.imgURL}" alt="Bread Image" class="item-img"
												
												style="width: 100%; height: 160px; object-fit: cover; border-radius: 8px;">
											
											<h1 style="font-size: 20px; color: #4a403a; margin-top: 10px;">${bread.itemName}</h1>
											
											<p style="font-size: 16px; color: #6d5c54;">ID: ${bread.breadsId} </p>
										
										</div>


										<div class="card-action" style="padding: 10px; display: flex; justify-content: center; gap: 10px; align-items: center;">

											<form method="get" action="${pageContext.request.contextPath}/openEditItemModal" style="margin: 0;">
												
												<input type="hidden" name="breadsId" value="${bread.breadsId}">
												
												<input type="hidden" name="itemType" value="${bread.itemType}">
																												
												<button type="submit" class="btn btn-primary">Edit</button>
											
											</form>

											<form method="get" action="${pageContext.request.contextPath}/verifyDeleteItem">
 
                                                <input type="hidden" name="breadsId" value="${bread.breadsId}"> 
												
											    <input type="hidden" name="itemType" value="${bread.itemType}">
											    
											    <input type="hidden" name="itemName" value="${bread.itemName}">
                                               
											  <button type="submit" class="btn btn-danger">Delete</button>

                                            </form>

										</div>



									</div>
									
									
								</c:forEach>
								
								
							</c:when>
						
							
							<c:when test="${showCategory == 'Cakes'}">
							
								
								<c:forEach var="desert" items="${sessionScope.retrievedDeserts}">
									
									<div class="card" style="background: white; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 260px; text-align: center; overflow: hidden;">
										
										<div class="card-content" style="padding: 15px;">
											
											<img src="${pageContext.request.contextPath}${desert.imgURL}" alt="Cake Image" class="item-img" style="width: 100%; height: 160px; object-fit: cover; border-radius: 8px;">
											
											<h1 style="font-size: 20px; color: #4a403a; margin-top: 10px;">${desert.itemName}</h1>
											
											<p style="font-size: 16px; color: #6d5c54;">ID: ${desert.desertsId} </p>
										
										</div>

										<div class="card-action"
											style="padding: 10px; justify-content: center; display: flex; gap: 10px; align-items: center;">

											<form method="get" action="${pageContext.request.contextPath}/openEditItemModal" style="margin: 0;">
												
												<input type="hidden" name="desertId" value="${desert.desertsId}"> 
												
												<input type="hidden" name="itemType" value="${desert.itemType}">
												
												<button type="submit" class="btn btn-primary">Edit</button>
											
											</form>

                                            <form method="get" action="${pageContext.request.contextPath}/verifyDeleteItem">
 
                                                <input type="hidden" name="desertId" value="${desert.desertsId}"> 
												
											    <input type="hidden" name="itemType" value="${desert.itemType}">
											    
											    <input type="hidden" name="itemName" value="${desert.itemName}">
                                               
											  <button type="submit" class="btn btn-danger">Delete</button>

                                            </form>

										</div>


									</div>
									
								</c:forEach>
								
								
							</c:when>

						</c:choose>
						
					</div>
					
				</div>
				
			</div>
			
		</main>


<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->



 <!-- This JS Code opens the Edit User Profile Modal -->
   <c:if test="${openEditItemModal}">
     
     <script>
   
          $(document).ready(function() { $('#editItemModal').modal('show'); });
 
     </script>
     
   </c:if>
   
  
  
  
	<!-- Modal for Editing Item Info -->
	<div class="modal fade" id="editItemModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
			
			<div class="modal-content">
				
				<div class="modal-header" style="background: #C9B194; padding: 20px;">
					
					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-size: 24px;">
					
					   Edit Item
						
				    </h5>
				    
				</div>

				<div class="modal-body" style="padding: 25px;">
					
					<table class="table table-bordered" style="font-size: 16px;">
						
						<thead>
						
							<tr class="table-light">
							
								<th style="padding: 15px; font-size: 18px;">Field</th>
								
								<th style="padding: 15px; font-size: 18px;">Current Data</th>
								
								<th style="padding: 15px; font-size: 18px;">Update To</th>
								
							</tr>
							
						</thead>
						
						<tbody>
						
							<tr>
								<td style="padding: 15px;">Item Name</td>
								
								<td style="padding: 15px;">${sessionScope.retrievedItemName}</td>
								
								<td style="padding: 15px;">
								
									<form action="${pageContext.request.contextPath}/updateItemName" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="text" name="newItemName" class="form-control"  required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<input type="hidden" name="itemType" value="${sessionScope.itemType}">
										
										<input type="hidden" name="itemId" value="${sessionScope.itemId}">
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Item Price</td>
								
								<td style="padding: 15px;">${sessionScope.retrievedItemPrice}</td>
								
								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateItemPrice" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="text" name="newItemPrice" class="form-control" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
								        <input type="hidden" name="itemType" value="${sessionScope.itemType}">
										
										<input type="hidden" name="itemId" value="${sessionScope.itemId}">
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Img URL</td>

								<td style="padding: 15px;"> ${sessionScope.retrievedImgURL} </td>


								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateImgURL" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="text" name="newImgURL" class="form-control" required  style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<input type="hidden" name="itemType" value="${sessionScope.itemType}">
										
										<input type="hidden" name="itemId" value="${sessionScope.itemId}">
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Item Desc</td>
								
								<td style="padding: 15px;">${sessionScope.retrievedItemDesc}</td>
								
								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateItemDesc" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										
										<textarea rows="5" cols="30" name="newItemDesc" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;">
										
										</textarea>
										
										<input type="hidden" name="itemType" value="${sessionScope.itemType}">
										
										<input type="hidden" name="itemId" value="${sessionScope.itemId}">
										
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
						
						
						</tbody>
					
					</table>
				
				</div>

				<div class="modal-footer" style="padding: 20px; display: flex; justify-content: flex-end;">
					
					<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 8px 20px; font-size: 16px;">
					
					   Cancel
					   
					</button>
				
				</div>
			
			</div>
		
		</div>
	
	</div> <!-- Closing tag of the User-info Modal -->


<!-- This JS below replaces the static reload IMG with the reload GIF onClick -->
<script>

document.querySelectorAll('.reload-img').forEach(button => {
 
	const img = button.querySelector('img');
  
	const originalSrc = img.src;
  
	const clickedSrc = '${pageContext.request.contextPath}/images/gifs/reloadGif.gif';

 
	button.addEventListener('click', function (e) {
    
		e.preventDefault(); // Stop form submission until the GIF animates

   
		// Show reload GIF on button
        img.src = clickedSrc;

   
		// Step 1: Show the reload GIF for ~500ms
        setTimeout(() => {
      
        	
        // Step 2: Display full-screen strike GIF
        const overlay = document.getElementById('strikeOverlay');
        
        overlay.style.display = 'flex';
        
        setTimeout(() => { overlay.style.opacity = '1';  overlay.style.visibility = 'visible'; }, 10); // slight delay to trigger transition


        
       // Step 3: Keep strike GIF for ~1.5s, then submit form
       setTimeout(() => {
                         
    	                overlay.style.opacity = '0';
    	                overlay.style.visibility = 'hidden';

    	                setTimeout(() => { overlay.style.display = 'none'; }, 500); // match transition time


                          const form = button.closest('form');
       
                          if (form) { form.submit(); }

                         }, 2600); // Length of strike.gif

   
           }, 500); // Delay before showing strike
  
	});

});
</script>


<!-- Strike GIF Overlay Modal -->
<div id="strikeOverlay" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(255, 255, 255, 0.2);
    
     backdrop-filter: blur(6px);
 
     z-index: 9999;
 
     justify-content: center;
  
     align-items: center;

     opacity: 0;
  
     visibility: hidden;
 
     transition: opacity 0.5s ease-in-out, visibility 0.5s ease-in-out; ">
 
     <img src="${pageContext.request.contextPath}/images/gifs/PrimaryRocketLauncch.gif" alt="Reloading..." style="width: 250px; height: 250px;" />
  
</div>



<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


<!-- This JS Code opens the Verify Deletion Modal -->
   <c:if test="${openVerifyDeletionModal}">
     
     <script>
   
          $(document).ready(function() { $('#deleteItemModal').modal('show'); });
 
     </script>
     
   </c:if>


  <!-- Modal for Verifying Item Deletion -->
	<div class="modal fade" id="deleteItemModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
			
			<div class="modal-content">
				
				<div class="modal-header" style="background: #C9B194; padding: 20px;">
					
					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-size: 24px;">
					
					   Delete Item !?
						
				    </h5>
				    
				</div>

				<div class="modal-body" style="padding: 25px;">
					
					Are you sure to delete <c:out value="${sessionScope.itemNameForDeletion}" />
				
				</div>

				<div class="modal-footer" style="padding: 20px; display: flex; justify-content: flex-end;">
					
					<form method="get" action="${pageContext.request.contextPath}/deleteItem">
					
					    <button type="submit" class="btn btn-default" style="padding: 8px 20px; font-size: 16px;">
					
					        Delete
					   
					    </button>
					
					</form>
					
					
					<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 8px 20px; font-size: 16px;">
					
					   Cancel
					   
					</button>
				
				</div>
			
			</div>
		
		</div>
	
	</div> <!-- Closing tag of the User-info Modal -->


<!-- ---------------------------------------------------------------------------------------------------------------------- -->


<!-- This JS Code opens the Add Item Modal -->
   <c:if test="${openAddItemModal}">
     
     <script>
   
          $(document).ready(function() { $('#AddItemModal').modal('show'); });
 
     </script>
     
   </c:if>



  <!-- Modal for Adding Item -->
	<div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
			
		
		 <form method="post" action="${pageContext.request.contextPath}/AddItemIntoTable">	
			
			<div class="modal-content">
				
				<div class="modal-header" style="background: #C9B194; padding: 20px;">
					
					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-size: 24px;">
					
					   Add Item
						
				    </h5>
				    
				</div>

				<div class="modal-body" style="padding: 25px;">
					
					<table class="table table-bordered" style="font-size: 16px;">
						
						<thead>
						
							<tr class="table-light">
							
								<th style="padding: 15px; font-size: 18px;">Field</th>
								
								<th style="padding: 15px; font-size: 18px;">Input Data</th>
								
															
							</tr>
							
						</thead>
						
						<tbody>
						
						   
						    <tr>
							
								<td style="padding: 15px;">Item Category</td>
								
																
								<td style="padding: 15px;">
								
										
										<select class="price-dropdown" name="itemType">
                                
                                          <option value="breads">Bread</option>
                                          
                                          <option value="deserts">Desert</option>
                                                                           
                                       </select>
							
								</td>
							
							</tr>
						
						
						
							<tr>
							
								<td style="padding: 15px;">Item Name</td>
								
																
								<td style="padding: 15px;">
								
										
										<input type="text" name="itemName" class="form-control"  required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
							
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Item Price</td>
								
							
								
								<td style="padding: 15px;">
									
										
										<input type="text" name="itemPrice" class="form-control" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
     
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Img URL</td>

								


								<td style="padding: 15px;">
									
									<input type="text" name="imgURL" class="form-control" required  style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Item Desc</td>
								
								 
								   
								
								<td style="padding: 15px;">
									
									<textarea rows="5" cols="30" name="itemDesc" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;">
										
									</textarea>
								
								</td>
							
							</tr>
						
						
						</tbody>
					
					</table>
				
				
				
				</div>

				<div class="modal-footer" style="padding: 20px; display: flex; justify-content: flex-end;">
					
					<button type="submit" class="btn btn-default"  style="background-color: #00b300; padding: 8px 20px; font-size: 16px;">
					
					   Add Item
					   
					</button>
					
					<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 8px 20px; font-size: 16px;">
					
					   Cancel
					   
					</button>
				
				</div>
			
			</div>
			
			</form>
		
		</div>
	
	</div> 








	</div>






</body>

</html>