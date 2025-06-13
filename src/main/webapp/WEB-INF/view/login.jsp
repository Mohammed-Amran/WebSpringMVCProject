<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	
	
<!DOCTYPE html>

<html>


<head>

<meta charset="UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginErrorModalStyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style type="text/css">

.button-row {
    display: flex;
    justify-content: space-between;
    gap: 15px;
    margin-top: 15px;
}

.button-row .btn {
    flex: 1;
    padding: 10px;
}


/*Animation and glowing of the login & cancel buttons - and the email & pass inputs.*/

.login-btn {
    padding: 10px;
    font-size: 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    flex: 1; /* maintain the width behavior inside .button-row */
}

.login-btn:hover {
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
    flex: 1; 
}

.cancel-btn:hover {
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


</style>


</head>



<body style=" background: url('https://img.freepik.com/free-vector/hand-drawn-pattern-background_23-2150820517.jpg') no-repeat center center fixed;
              background-size: cover;  
            ">


<!-- If login failed! the 'Login-Error' pop-up window will be shown -->
<c:if test="${not empty loginError}">

  <script type="text/javascript">
  
    window.onload = function () { $('#loginErrorModal').modal('show'); };
 
  </script>
  
</c:if>

 
<!-- If session expired! the 'SessionExpired-alert' pop-up window will be shown --> 
<c:if test="${not empty requestScope.sessionExpiredMessage}">

  <script type="text/javascript">
  
    $(document).ready(function () { $('#sessionExpiredModal').modal('show'); });
    
  </script>
  
</c:if>

  
  
<!-- If the user logged out! the 'Logout-alert' pop-up window will be shown -->  
<c:if test="${not empty logOutMessage}">
  
  <script type="text/javascript">
 
   $(document).ready(function () { $('#logoutModal').modal('show'); });
 
   </script>
  
</c:if>
 
  
  

	<div id="main">

		<div id="heading" style="background-color: #C9B194;">
		
			<h1 style="color: #4a403a; font-weight: bold;">Suli Bakery</h1>
			
			<h4 style="font-weight: bold; color: #DBDBDB;" >Please log in to continue</h4>
			
		</div>




		<div class="card" style="background-color: #C9B194;">

			<form name="loginForm" action="logIn" method="post">


				<label for="email" style="color: #4a403a;"> <b>Email</b> </label> 
				<input type="email" id="email" name="email" style="background-color: #DBDBDB;" placeholder="Enter your email" value="${email}" required> 
				
				<label for="password" style="color: #4a403a;"> <b>Password</b> </label>
				<input type="password" id="password" name="password" style="background-color: #DBDBDB;" placeholder="Enter your password" required>


				<div class="button-row">
                   
                    <button type="submit" class="login-btn" style="background-color: #DBDBDB; color: #4a403a;">Login</button>
   
                    <button type="button" class="cancel-btn" style="background-color: #DBDBDB; color: #4a403a;" onclick="window.location.href='${pageContext.request.contextPath}/backToView'">Cancel</button>
            
                </div>


			</form>



			<div class="signup-link">
		
               <p style="color: #4a403a;">Don't have an account? <a href="<%= request.getContextPath() %>/goToRegisterFromLogin" style="color: #AF3E3E;">Sign Up</a></p>

			</div>

		</div>


	</div>



	<!-- Login Error Modal -->
	<div class="modal fade" id="loginErrorModal" tabindex="-1" role="dialog" aria-labelledby="loginErrorModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">
			
			<div class="modal-content">

				<div class="modal-header">
				
					<h5 class="modal-title" id="loginErrorModalLabel">Login Failed</h5>
					
						
				</div>


				<div class="modal-body">
				
					<p> <c:out value="${loginError}" /> </p>
					
				</div>



				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
				</div>


			</div>
			
		</div>
		
	</div>
	<!-- closing brace of the error message pop-up modal -->


    <!-- Session Expired Modal -->
	<div class="modal fade" id="sessionExpiredModal" tabindex="-1" role="dialog" aria-labelledby="sessionExpiredModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
					
					<h5 class="modal-title" id="sessionExpiredModalLabel">Session Expired</h5>
				
				</div>

				<div class="modal-body">
					
					<p> <c:out value="${param.sessionExpiredMessage}" /> </p>
					
				</div>

				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>
					
				</div>

			</div>

		</div>
		
	</div> <!-- Closing tag of the 'Session Expired' modal -->


   <!-- Logout Message Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
				
					<h5 class="modal-title" id="logoutModalLabel">Logged Out</h5>
					
				</div>

				<div class="modal-body">
					
					<p> <c:out value="${logOutMessage}" /> </p>
				
				</div>

				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
				</div>

			</div>

		</div>
		
	</div> <!-- Closing tag of the 'Logout Message' modal -->



</body>


</html>