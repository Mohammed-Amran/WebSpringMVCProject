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

<title>Menu & Gallery Page</title>

 <style>
    

.card-content{

background-color: #C9B194;
}

.card-content h1{

color: #4a403a;
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

<body style="font-family: ''Pacifico', cursive;

             font-style: normal;

             background: linear-gradient(rgba(255, 255, 255, 0.5)), 
             
             url('https://hicaps.com.ph/wp-content/uploads/2022/12/bakery-products.jpg') no-repeat center center fixed;
  
             background-size: cover;
     
             margin: 0;
  
             height: 100vh; ">


<!-- APP bar -->
<nav class="appbar" style="background-color: #C9B194;">

    <div class="appbar-brand">
    
        <h1 style="color: #4a403a;">Suly Bakery</h1> 
        
    </div>
    
    
    <div class="appbar-actions">
   
     <!-- Controller for this button is in '' file. -->      
     <form method="get" action="getBackToViewPageFromMenuAndGallery">  
     
        <button class="btn login-btn" type="submit" style="background-color: #DBDBDB; color: #4a403a;; font-weight: bold;" >       
             Back         
        </button>
        
     </form>
      
        
    </div>
    
</nav>







<!-- Main Content - Menu Section -->
<main class="menu-container" style="background-color: #C9B194; margin-top: 50px;">

 <div >
 
    <h2 class="menu-title" style="font-weight: bold; font-size: 46px; color: #4a403a;">  Our Menu </h2>
    
    
    
    
    <!-- Category Buttons -->
     <div style="display: flex; justify-content: center; gap: 30px; margin-bottom: 8px;">
               
           <form method="get" action="categoryController">    
            
                <input type="hidden" name="category" value="Breads">
                
                <button type="submit" class="category-btn" style="background-color: #DBDBDB; color: #4a403a; border: 2px solid #C9B194; border-radius: 8px; 
                        padding: 8px 20px;  font-size: 18px; font-weight: bold; cursor: pointer;">
                        
                    Breads
                                    
                </button>
                
           </form>     
            
              <form method="post" action="categoryController">  
                  
                <input type="hidden" name="category" value="Cakes">
                
                <button type="submit" class="category-btn" style="background-color: #DBDBDB; color: #4a403a;; border: 2px solid #C9B194; border-radius: 8px; 
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
	<div class="footer" style="margin-top: 40px; background-color: #C9B194;">

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