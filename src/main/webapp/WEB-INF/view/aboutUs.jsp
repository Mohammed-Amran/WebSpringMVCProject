<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>About Us</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chewy&family=Delius&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<!-- link to the css file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexStyle.css">

<style type="text/css">

.paragraphs{

color: #4a403a;
}

.paragraphs:hover {
	
  color: #FFFFFF;
  text-shadow: 0 0 8px #FFFFFF;
  transition: all 0.3s ease;
}

h3{
 color: #4a403a;
}

h3:hover{

 color: #FFFFFF;
  text-shadow: 0 0 8px #FFFFFF;
  transition: all 0.3s ease;

}

.appbar-brand h1{

transition: transform 0.2s ease;
}    

.appbar-brand h1:hover {
	
  transform: scale(1.08);
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


</style>


</head>

<body style="background-color: #DBDBDB;">


<!-- APP bar -->
<nav class="appbar" style="background-color: #C9B194;">

    <div class="appbar-brand">
    
        <h1 style="color: #4a403a">Suly Bakery</h1> 
        
    </div>
    
    
    <div class="appbar-actions">
   
     <!-- Controller for this button is in 'AboutUsController' file. -->       
     <form method="get" action="getBackToViewOnlyFromAboutUs">  
     
        <button class="btn login-btn" type="submit" style="background-color: #DBDBDB; color: #4a403a; font-weight: bold;" >       
             Back         
        </button>
        
     </form>
      
        
    </div>
    
</nav>




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





</body>

</html>