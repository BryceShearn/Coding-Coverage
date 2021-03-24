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
		<title>Coding Coverage Account Creation Page</title>
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
      				<h4 class="animation a2"><b>We're happy to see you join the team!</b></h4>
      				<h4 class="animation a2"><b>Complete your registration below!</b></h4>
    			</div>
    			<div class="form">
      		<form:form id="registerForm" action="createAccount.do" method="POST" modelAttribute="user">
  			<!-- firstName -->
  			<form:input path="firstName" class="form-field animation a1" placeholder="First Name"/>
  			<form:errors path="firstName"/>
  			<!-- lastName -->
  			<form:input path="lastName" class="form-field animation a2" placeholder="Last Name"/>
  			<form:errors path="lastName"/>
  			<!-- username -->
  			<form:input path="username" class="form-field animation a3" placeholder="Username"/>
  			<form:errors path="username"/>
  			<!-- password -->
  			<form:input type ="password" path="password" class="form-field animation a4" placeholder="Password"/>
  			<form:errors path="password"/>
  			<!-- bio -->
  			<form:input type="text" path="bio" class="form-field animation a5" placeholder="About Me!"/>
  			<form:errors path="bio"/>
  			<!-- enabled -->
  			<form:hidden path="enabled" value="true"/>
  			<!-- role -->
  			<form:hidden path="role" value="Student"/>
	  		</form:form>	
      			<button type="submit" name = "submit" value = "Register" form ="registerForm" class="animation a6">SUBMIT</button>
      			
      			<form id = "returnHome" action="login.do" method="get"></form>
     			<button type="submit" name = "submit" form = "returnHome" value = "value" class="animation a7">RETURN TO LOGIN</button>
     			</div>
  			</div>
		</div>
  	<div class="right"></div>
</body>
</html>
