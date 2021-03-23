<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
		 <!-- meta tags -->
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
		<title>Coding Coverage Login Page</title>
		<!--  FavIcon Insert -->
		<link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
		<!-- Internal Resources -->
		<link rel="stylesheet" href="css/index.css">
	</head>
	<body class = loginPage>
		<div class="container">
  			<div class="left">
    			<div class="header">
     				<h2 class ="animation a1"><img src="images/codingCoverage.png" alt="Coding Coverage Logo" width="200" height="175"></h2><br>
     				<h2 class="animation a1">Coding Coverage</h2>
      				<h4 class="animation a2"><b>Being a self-taught programmer is hard</b></h4>
      				<h4 class="animation a2"><b>and it's easy to get lost along the way.</b></h4>
    				<h4 class="animation a2"><b>Let us be your light in the dark</b></h4>
    			</div>
    			<div class="form">
      				<!-- \/ begin post request for username and password \/ -->
      				<form id="loginForm" action="${testPath}/testpath" method="POST"> 
      				<input type="text" id="username" class="form-field animation a3" placeholder="Username">
      				<input type="password" id="password" class="form-field animation a4" placeholder="Password">
     				</form>
      				<!-- /\ end post request for username and password /\ -->
      				<p class="animation a5"><a href="#">Forgot Password</a></p>
      				<!-- \/ This is the link that sends the post request \/ -->
      				<button type="submit" name = "submit" value = "value" form ="loginForm" class="animation a6">LOGIN</button>
      				<!-- \/ needs to be moved to it's own page exactly replicated for user account creation unless shortcut found \/ -->
      				<form id = "signUp" action="createAccountForm.do" method="get"></form>
      				<button type="submit" name = "submit" form = "signUp" value = "value" class="animation a7">SIGN UP</button>
     			</div>
  			</div>
		</div>
  	<div class="right"></div>
</body>
</html>
