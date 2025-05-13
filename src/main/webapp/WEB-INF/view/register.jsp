
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Register Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">

</head>

<body>

<!-- If the user couldn't be Inserted into DB -->
 <c:if test="${not empty insertingError}">
    
    <script type="text/javascript">
    
      alert('${insertingError}');
      
    </script>
    
  </c:if>





 <div id="main">

        <div id="heading">
        
            <h1>Sign Up</h1>
            <h4>Create your account</h4>
            
        </div>


        <div class="card">

            <form name="registerForm" method="post" action="registerUser">


                <label for="fullname"> Full Name: </label>
                <input type="text" id="fullname" name="fullName" placeholder="Enter your full name" value="${fullName}" required>

                <label for="email"> Email: </label>
                <input type="email" id="email" name="email" placeholder="Enter your email" value="${email}" required>
                <c:if test="${not empty emailError}">
                
                   <div style="color:red;">${emailError}</div> <br>
                   
                </c:if>

                <label for="password"> Password: </label>
                <input type="password" id="password" name="password" placeholder="Enter your password" value="${password}" required>

                <label for="phone"> Phone: </label>
                <input type="tel" id="phone" name="phoneNo" placeholder="07xx-xxx-xxxx" value="${phoneNo}" required>
                <c:if test="${not empty phoneError}">
                
                  <div style="color:red;">${phoneError}</div> <br>
                  
                </c:if>


                <div class="button-container">
                
                      <button type="submit" name="register" value="signup" class="btn">Sign Up</button>
                    
                      <button type="button" class="cancel" onclick="window.location.href='${pageContext.request.contextPath}/backTologinFromRegistration'"> Cancel </button>
              
                </div>


            </form>

        </div>

    </div>



</body>
</html>