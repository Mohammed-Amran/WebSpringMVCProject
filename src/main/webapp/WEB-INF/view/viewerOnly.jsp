<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chewy&family=Delius&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- link to the css file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexStyle.css">

<title>Viewer Only Page</title>

 <style>
    
    .carousel {
      width: 100%;
      max-width: 1200px; /* Adjust as needed */
      margin: 20px auto;
    }
    
    .carousel-inner {
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      overflow: hidden;
    }
    
    .carousel-item img {
      width: 100%;
      height: 500px; /* Adjust height as needed */
      object-fit: cover;
    }
    
    .hero-content {
  text-align: center;
  padding: 20px;
}




.menu-container {
  position: relative;
  padding: 60px 20px;
  
}


.menu-title, 
.menu-items {
  position: relative;
  z-index: 1;
}

.login-btn{

transition: transform 0.2s ease;
}

.login-btn:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px #F2F3F1;
	
}


.category-btn{
transition: transform 0.2s ease;
}

.category-btn:hover {
	transform: scale(1.08);
	 box-shadow: 0 4px 12px rgba(255, 255, 255, 0.6);
}

.menu-title{

transition: transform 0.2s ease;
}

.menu-title:hover{

   transform: scale(1.08);
}
    
    
.appbar-brand h1{

transition: transform 0.2s ease;
}    

.appbar-brand h1:hover {
	
  transform: scale(1.08);
}   


.hero-content h2 {

transition: transform 0.2s ease;
}    

.hero-content h2:hover {
	
  transform: scale(1.08);
} 
 
    
</style>


</head>

<body>


<!-- APP bar -->
<nav class="appbar">

    <div class="appbar-brand">
    
        <h1>Suly Bakery</h1> 
        
    </div>
    
    
    <div class="appbar-actions">
    
    
    
       
     
     <form method="get" action="accessLoginPage">  
     
        <button class="btn login-btn" type="submit" style="background-color: #F5F5DD; color: #885539; font-weight: bold;" >       
             Login         
        </button>
        
     </form>
        
    </div>
    
</nav>


<!-- Hero Section with Gallery -->
<section class="hero">

  <div class="hero-content">
  
        <h2>Fresh from the Bakery</h2>
        <p>Savor the aroma of our oven-baked delights, made with love and the finest ingredients</p>

        
    </div>

  <div style="display: flex; justify-content: center;">

    <!-- Carousel inserted here -->
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  
  
  
  <div class="carousel-inner">
  
    <div class="carousel-item active" data-bs-interval="5000">
    
      <img src="${pageContext.request.contextPath}/images/c1.jpg" class="d-block" alt="Bread 1">
      
    </div>
    
    <div class="carousel-item" data-bs-interval="3000">
    
      <img src="${pageContext.request.contextPath}/images/c2.png" class="d-block" alt="Croissant">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/c3.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/baklavaStore1.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/c4.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/candyShop1.jpeg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/candy.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    
    
   
    
    
    
  </div>
  
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
  
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
    
  </button>
  
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
  
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
    
  </button>
  
</div>

</div>
    
</section>




<!-- Main Content - Menu Section -->
<main class="menu-container" style="background-color: #A57A5A;">

 <div >
 
    <h2 class="menu-title" style="font-weight: bold; font-size: 46px; ">  Our Menu </h2>
    
    
    
    
    <!-- Category Buttons -->
     <div style="display: flex; justify-content: center; gap: 30px; margin-bottom: 8px;">
               
           <form method="get" action="categoryController">    
            
                <input type="hidden" name="category" value="Breads">
                
                <button type="submit" class="category-btn" style="background-color: #F5F5DD; color: #885539; border: 2px solid #F5F5DD; 
                        padding: 8px 20px;  font-size: 18px; font-weight: bold; cursor: pointer;">
                        
                    Breads
                                    
                </button>
                
           </form>     
            
              <form method="post" action="categoryController">  
                  
                <input type="hidden" name="category" value="Cakes">
                
                <button type="submit" class="category-btn" style="background-color: #F5F5DD; color: #885539; border: 2px solid #F5F5DD; 
                        padding: 8px 20px;  font-size: 18px;  font-weight: bold; cursor: pointer;">
                        
                    Cakes
                    
                </button>
                
              </form>  
      </div>
    
    
    <div class="menu-items" style="background-color: #F2F3F1">
       
       
       <div class="menu-grid" style="margin-top: 40px;">
       
    <c:choose>
    
       <c:when test="${showCategory == 'Breads' || empty showCategory }">
        
       <!-- Item 1 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/baguette-bread-july222020-min-e1595406425983.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Baguette Bread</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 2 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/brioche-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Brioche Bread</h1>
				
			</div>
			
			
			
		</div>
       
        <!-- Item 3 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/ciabatta-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Ciabatta Bread</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 4 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/multigrain-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Multigrain Bread</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 5 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/whole-wheat-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Whole Wheat</h1>
				
			</div>
			
			
			
		</div>
       
        <!-- Item 6 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/lavash-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Lavash Bread</h1>
				
			</div>
			
			
		</div>
       
        <!-- Item 7 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/matzo-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Thin Bread</h1>
				
			</div>
			
			
		</div>
		
		 <!-- Item 8 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/naan-bread-july222020-min.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Naan Bread</h1>
				
			</div>
			
			
		</div>
		
		 <!-- Item 9 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/tortilla-bread-july222020-min-e1595407483238.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Tortilla</h1>
				
			</div>
			
			
		</div>

         <!-- Item 10 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/crispyBread.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Crispy Bread</h1>
				
			</div>
			
			
		</div>       
      
      </c:when>
      
      
      <c:when test="${showCategory == 'Cakes'}">
      
       <!-- Item 1 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/baklava2.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Kunafa</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 2 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/cherryCake.jpeg" class="item-img">
				
				<h1 style="margin-top: 78px;">Cherry Cake</h1>
				
			</div>
			
			
			
		</div>
       
        <!-- Item 3 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/lemonCake.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Lemon Cake</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 4 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/strawberyCake.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Strawberry Cake</h1>
				
			</div>
			
			
			
		</div>
       
       <!-- Item 5 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/donut.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Donut</h1>
				
			</div>
			
			
			
		</div>
       
        <!-- Item 6 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/criossant.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Criossant</h1>
				
			</div>
			
			
		</div>
       
        <!-- Item 7 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/baklava.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Baklava</h1>
				
			</div>
			
			
		</div>
		
		 <!-- Item 8 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/appleCake.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Apple Cake</h1>
				
			</div>
			
			
		</div>
		
		 <!-- Item 9 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/caramel.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Caramel candy</h1>
				
			</div>
			
			
		</div>


         <!-- Item 10 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="${pageContext.request.contextPath}/images/cakes/chocoloateCake.jpeg" class="item-img">
				
				<h1 style="margin-top: 78px;">Chocoloate Cake</h1>
				
			</div>
			
			
		</div>
              
        
      </c:when>
      
      </c:choose>
       
       </div>
       
       
    </div>
    
    </div>
    
</main>


<!-- Footer -->
	<div class="footer" style="margin-top: 40px;">

		<!-- Phone Numbers -->
		<div class="footer__contact">
		
			<i>+964 750 141 8006</i> <br> <i>+964 771 152 8011</i>
			
		</div>

		<!-- Social Media Icons -->
		<div class="footer__social">
		
			<ul class="horizontal-list text-center social-icons">
			
				<!-- Instagram Icon -->
				<li> <a href="#"> <i class="fab fa-instagram"></i> </a> </li>
				
				<!-- YouTube Icon -->
				<li> <a href="#"> <i class="fab fa-youtube"></i> </a> </li>
				
				<!-- Facebook Icon -->
				<li> <a href="#"> <i class="fab fa-facebook"></i> </a> </li>
				
			</ul>
			
		</div>

		<!-- Email -->
		<div class="footer__mail">
		
			<i>SulyBakery@gmail.com</i>
			
		</div>

</div>

<!-- Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>