<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Taglib directive -->
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Viewer Only Page</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chewy&family=Delius&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- link to the css file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexStyle.css">



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
    
  
.appbar{

background-color: #C9B194;
}  
    
.appbar-brand h1{

color: #4a403a;
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
 
h3{

color: #4a403a;
} 
 
h3:hover {
  color: #FFFFFF;
  text-shadow: 0 0 8px #FFFFFF;
  transition: all 0.3s ease;
}

.paragraphs{

color: #4a403a;
font-weight: bold;
}

.paragraphs:hover {
	
  color: #FFFFFF;
  text-shadow: 0 0 8px #FFFFFF;
  transition: all 0.3s ease;
} 
 
 
/* Glowing text and button styles */
.carousel-caption h5, .carousel-caption p, .carousel-control-prev, .carousel-control-next {
    color: black !important; /* Black text color */
    text-shadow: 0 0 10px white, 0 0 20px white, 0 0 30px white, 0 0 40px white, 0 0 50px white, 0 0 75px white; /* White glowing effect */
    
}

.carousel-caption h5, .carousel-caption p{
font-weight: bold;
font-size: 21px;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
    filter: drop-shadow(0 0 10px white) drop-shadow(0 0 20px white); /* White glowing effect for carousel icons */
}

/* Ensure buttons are visible */
.carousel-control-prev:hover, .carousel-control-next:hover {
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for better visibility */
}


#seeMoreBtn {
  background-color: #C9B194; 
  border: 1px solid #C9B194; 
  padding: 0; 
  margin: 0;
  font-size: 30px;
  transition: transform 0.3s ease, text-shadow 0.3s ease;
  outline: none;
}


#seeMoreBtn:hover {
	
	text-shadow: 0 0 5px #F2F3F1, 0 0 10px #F2F3F1, 0 0 15px #F2F3F1;
	 transform: scale(1.1);
}
 
    
</style>


</head>


<body style="background-color: #DBDBDB;">



<!-- App bar -->
<nav class="appbar">

    <div class="appbar-brand">
    
        <h1>Suly Bakery</h1> 
        
    </div>


		<div class="appbar-actions">

			<form method="get" action="accessAboutUsPage">

				<button class="btn login-btn" type="submit" style="background-color: #DBDBDB; color: #4a403a; font-weight: bold; margin-right: 20px;">
					
					About Us
					
				</button>

			</form>


			<form method="get" action="accessRegisterPage">

				<button class="btn login-btn" type="submit" style="background-color: #DBDBDB; color: #4a403a; font-weight: bold;">
					
					Register
					
				</button>

			</form>

			<form method="get" action="accessLoginPage">

				<button class="btn login-btn" type="submit" style="background-color: #DBDBDB; color: #4a403a; font-weight: bold;">
					
					Login
					
				</button>

			</form>


		</div> <!-- closing tag of the appbar-actions div -->

</nav>


<!-- Hero Section with Gallery -->
<section class="hero" style="background-color: #DBDBDB;">

  <div class="hero-content">
  
        <h2 style="color: #4a403a;">Fresh from the Bakery</h2>
        <p style="color: #4a403a;">Savor the aroma of our oven-baked delights, made with love and the finest ingredients</p>

        
    </div>

  <div style="display: flex; justify-content: center;">

    <!-- Carousel inserted here -->
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  
  
  
  <div class="carousel-inner">
  
    <div class="carousel-item active" data-bs-interval="5000">
    
      <img src="https://sandgateguide.com.au/wp-content/uploads/2024/08/1200-x-680px-2024-08-05T110329.737.png" class="d-block" alt="Bread 1">
      
    </div>
    
    <div class="carousel-item" data-bs-interval="3000">
    
      <img src="${pageContext.request.contextPath}/images/newC2.jpg" class="d-block" alt="Croissant">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="https://www.shutterstock.com/image-photo/outside-view-bakery-glass-showcase-600nw-2207207873.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="https://t3.ftcdn.net/jpg/02/15/97/76/360_F_215977651_ckAFK1elBF7SRMBbTe0RS9YTOVrxtsOL.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="https://i.pinimg.com/736x/21/0e/81/210e81d267f3690cde8484bab5ee63b0.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/newC1.JPG" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/newC4.jpg" class="d-block" alt="Pastry">
      
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


<!-- 2nd Hero section -->
<div id="carouselExampleCaptions" class="carousel slide">

  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
  
  <div class="carousel-inner">
  
    <!-- Img-1 -->
    <div class="carousel-item active">
     
      <img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/ciabatta-bread-july222020-min.jpg" class="d-block w-100" alt="...">
      
      <div class="carousel-caption d-none d-md-block">
       
        <h5>Frequent Ordered Bread</h5>
       
        <p>Ciabatta bread is a rustic Italian loaf with a crisp crust and a light, chewy interior full of airy holes.</p>
    
      </div>
      
    </div>
   
    <!-- Img-2 -->
    <div class="carousel-item">
     
      <img src="${pageContext.request.contextPath}/images/cakes/baklava2.jpg" class="d-block w-100" alt="...">
     
      <div class="carousel-caption d-none d-md-block">
       
        <h5>Frequent Ordered Desert</h5>
       
        <p>kanafa is a rich, golden-crisp dessert made with shredded phyllo dough, filled with melted cheese</p>
     
      </div>
      
    </div>
    
    <!-- Img-3 -->
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/cakes/chocoloateCake.jpeg" class="d-block w-100" alt="...">
      
      <div class="carousel-caption d-none d-md-block">
       
        <h5>Customers favourite Cake</h5>
        
        <p>Chocolate cake is a moist, decadent dessert layered with rich, velvety chocolate goodness.</p>
     
      </div>
      
    </div>
    
    
  </div> <!-- closing brace of the 'carousel-inner' -->
  
  
  
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  
  
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  
  
</div> <!-- closing tag of the 2nd carousel -->



<div class="menu-container" style="text-align: center; margin-top: 60px; margin-bottom: 30px; background-color: #C9B194;  color: #F2EAD5; padding: 40px; box-sizing: border-box;">

   <button type="button" id="seeMoreBtn"  class="cancel" onclick="window.location.href='${pageContext.request.contextPath}/gotToMenuAndGalleryPage'">

      <div style="display: flex; align-items: center; gap: 10px; background-color: #C9B194;">
    
         <h3 style="margin: 0; color: #4a403a; font-weight: bold;">See more Breads and Cakes..</h3>
     
         <img src="${pageContext.request.contextPath}/images/plus.png" width="32" height="32">

      </div>

        
   </button>
              
</div>


<!-- Main Content - Menu Section -->
<main class="menu-container" style="background-color: #C9B194; color: #F2EAD5; padding: 40px; box-sizing: border-box; margin-top: 75px;">

   <div style="margin: 20px 0; width: 100%; max-width: 600px; text-align: left;">
   
     <div style="display: flex; align-items: center; gap: 10px;">
    
        <h3 style="margin: 0;">Date of Establishment</h3>
     
        <img src="${pageContext.request.contextPath}/images/bakery-shop.png" width="32" height="32">

     </div>
   
    <p class="paragraphs" style="margin: 5px 0;">Our bakery was founded in 1986, born from a small family kitchen.</p>
    <p class="paragraphs"  style="margin: 5px 0;">We started with a passion for homemade recipes and heartfelt service.</p>
    <p class="paragraphs"  style="margin: 5px 0;">Through the years, we’ve grown while keeping our traditional touch alive.</p>
    <p class="paragraphs" style="margin: 5px 0;">Today, we proudly serve generations of loyal customers every day.</p>
 
  </div>
  
  
  <div style="margin: 20px 0; width: 100%; max-width: 600px; text-align: left; margin-top: 35px;">
   
   
      <div style="display: flex; align-items: center; gap: 10px;">
    
         <h3 style="margin: 0;">Our Location</h3>
     
         <img src="${pageContext.request.contextPath}/images/windmill.png" width="32" height="32">

      </div>

    
   
     <p class="paragraphs" style="margin: 5px 0;">Nestled in the heart of Rotterdam, our bakery brings warmth to every street corner.</p>
     <p class="paragraphs" style="margin: 5px 0;">We're just a short stroll from the bustling Markthal, inviting locals and visitors alike.</p>
     <p class="paragraphs" style="margin: 5px 0;">Come enjoy fresh bakes in a city where tradition meets modern charm.</p>
 
     <div style="display: flex; align-items: center; gap: 10px; margin-top: 15px;">
    
          <img src="${pageContext.request.contextPath}/images/location.png" width="28" height="28">
          
         <p class="paragraphs" style="margin: 0; font-weight: bold;"> Nieuwe Binnenweg 322, 3023 ES Rotterdam, Netherlands </p>  

      </div>
 
  </div>
  
  
  
  
 
  
  

</main>



<!-- Footer -->
	<div class="footer" style="background-color: #C9B194; margin-top: 40px;">

		<!-- Phone Numbers -->
		<div class="footer__contact">
		
			<i style="color: #4a403a; font-weight: bold;">+964 750 141 8006</i> <br> <i style="color: #4a403a; font-weight: bold;">+964 771 152 8011</i>
			
		</div>

		<!-- Social Media Icons -->
		<div class="footer__social">
		
			<ul class="horizontal-list text-center social-icons">
			
				<!-- Instagram Icon -->
				<li > <a href="#"> <i class="fab fa-instagram" style="color: #4a403a;"></i> </a> </li>
				
				<!-- YouTube Icon -->
				<li > <a href="#"> <i class="fab fa-youtube" style="color: #4a403a;"></i> </a> </li>
				
				<!-- Facebook Icon -->
				<li > <a href="#"> <i class="fab fa-facebook" style="color: #4a403a;"></i> </a> </li>
				
			</ul>
			
		</div>

		<!-- Email -->
		<div class="footer__mail">
		
			<i style="color: #4a403a; font-weight: bold;">SulyBakery@gmail.com</i>
			
		</div>

</div>

<!-- Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>