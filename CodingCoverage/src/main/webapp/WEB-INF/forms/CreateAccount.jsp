<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>title</title>
  </head>
  <body>
	<div>
  		<form:form action="createAccount.do" method="POST" modelAttribute="user">
  			<!-- firstName -->
  			<form:label path="firstName">First Name:</form:label>
  			<form:input path="firstName"/>
  			<form:errors path="firstName"/>
  			<br/>
  			<!-- lastName -->
  			<form:label path="lastName">Last Name:</form:label>
  			<form:input path="lastName"/>
  			<form:errors path="lastName"/>
  			<br/>
  			<!-- username -->
  			<form:label path="username"> Username:</form:label>
  			<form:input path="username"/>
  			<form:errors path="username"/>
  			<br/>
  			<!-- password -->
  			<form:label path="password">Password:</form:label>
  			<form:password path="password"/>
  			<form:errors path="password"/>
  			<br/>
  			<!-- bio -->
  			<form:label path="bio">Short Bio:</form:label>
  			<form:textarea path="bio"/>
  			<form:errors path="bio"/>
  			<br/>
  			<!-- enabled -->
  			<form:hidden path="enabled" value="true"/>
  			<!-- role -->
  			<form:hidden path="role" value="Student"/>
  			
			<input type="submit" value="Register"/>
  		</form:form>	
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   