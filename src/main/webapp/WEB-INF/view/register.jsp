
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Register Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">



<style type="text/css">


input[type="text"] {
  padding: 10px 15px;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  outline: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  width: 100%;
  box-sizing: border-box;
}

input[type="text"]:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 20px 5px white;
}


input[type="email"] {
  padding: 10px 15px;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  outline: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  width: 100%;
  box-sizing: border-box;
}

input[type="email"]:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 20px 5px white;
}


input[type="password"] {
  padding: 10px 15px;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  outline: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  width: 100%;
  box-sizing: border-box;
}

input[type="password"]:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 20px 5px white;
}


input[type="tel"] {
  padding: 10px 15px;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  outline: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  width: 100%;
  box-sizing: border-box;
}

input[type="tel"]:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 20px 5px white;
}


.submit-btn {
    padding: 10px;
    font-size: 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    flex: 1; /* maintain the width behavior inside .button-row */
}

.submit-btn:hover {
    transform: translateY(-5px);
    box-shadow: 0 0 20px 5px white;
}

.cancel-btn {
    padding: 10px;
    font-size: 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    flex: 1; /* maintain the width behavior inside .button-row */
}

.cancel-btn:hover {
    transform: translateY(-5px);
    box-shadow: 0 0 20px 5px white;
}





h1 {
  
  transition: transform 0.3s ease, text-shadow 0.3s ease;
  
}

h1:hover {
  transform: translateY(-5px);
 
}






</style>



</head>

<body style=" background: url('https://img.freepik.com/free-vector/hand-drawn-pattern-background_23-2150820517.jpg') no-repeat center center fixed;
              background-size: cover;  
            ">

<!-- If the user couldn't be Inserted into DB -->
 <c:if test="${not empty insertingError}">
    
    <script type="text/javascript">
    
      alert('${insertingError}');
      
    </script>
    
  </c:if>





 <div id="main">

        <div id="heading" style="background-color: #C9B194;">
        
            <h1 style="color: #4a403a;">Sign Up</h1>
            <h4 style="color: #DBDBDB; font-weight: bold;">Create your account</h4>
            
        </div>


        <div class="card" style="background-color: #C9B194;">

            <form name="registerForm" method="post" action="registerUser">


                <label for="fullname" style="color: #4a403a;"> Full Name: </label>
                <input type="text" id="fullname" name="fullName" placeholder="Enter your full name" value="${fullName}" required>

                <label for="email" style="color: #4a403a;"> Email: </label>
                <input type="email" id="email" name="email" placeholder="Enter your email" value="${email}" required>
                <c:if test="${not empty emailError}">
                
                   <div style="color:red;">${emailError}</div> <br>
                   
                </c:if>

                <label for="password" style="color: #4a403a;"> Password: </label>
                <input type="password" id="password" name="password" placeholder="Enter your password" value="${password}" required>

                <label for="phone" style="color: #4a403a;"> Phone: </label>
                <input type="tel" id="phone" name="phoneNo" placeholder="07xx-xxx-xxxx" value="${phoneNo}" required>
                <c:if test="${not empty phoneError}">
                
                  <div style="color:red;">${phoneError}</div> <br>
                  
                </c:if>


                <div class="button-container">
                
                      <button type="submit" name="register" value="signup" class="submit-btn" style="background-color: #DBDBDB; color: #4a403a;">Sign Up</button>
                    
                      <button type="button" class="cancel-btn" style="background-color: #DBDBDB; color: #4a403a;" onclick="window.location.href='${pageContext.request.contextPath}/backToViewOnlyFromRegistration'"> Cancel </button>
              
                </div>


            </form>

        </div>

    </div>



</body>
</html>