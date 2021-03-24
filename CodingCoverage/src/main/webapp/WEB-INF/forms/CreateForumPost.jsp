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
    <title>Create A Post!</title>
  </head>
  <body>
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
  
  
  <!-- 
 'id','int(11)',
'subject','varchar(500)
'content','text',
'date_created','datetime'
'last_update','datetime',
'user_id','int(11)',
'is_blog','tinyint(1)',
'is_forum_visable','tinyint(4)''
'is_expert','tinyint(4)'
'language_id','int(11)'
   -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   