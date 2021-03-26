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
    <link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
	<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <title>Create A Forum Post</title>
  	<link rel="stylesheet" href="css/CreatePost.css">
  </head>
<body class="userPostFormBody">
	<div class="userPostFormDiv">
		<h2 class="active"> Create a Post </h2>
		<a href="profilePageResults.do"><h2 class="nonactive"> Return Home </h2></a>
		
		<form:form class="userPostFormForm" id="thisForm" action="createForumPost.do" method="POST" modelAttribute="post">
			
			<form:input path="subject" type="text" class="text1" name="subject" value="${post.subject }" />
			<span class = "title-span">Title</span>
			<form:errors path="subject"/>
			<br>
			
			<br>
			<span class = "body-span">Body</span>
			<form:textarea path="content" type="text" class="text2" name="content" value="${post.content }" />
			<form:errors path="content" />
			<br>
			
			<label class="radio" for="langId" >What language is this post about?</label><br>
			<input type="radio" id="langId1" name="langId" value="1" checked/>
			<label for="langId">Java</label>
			<input type="radio" id="langId2" name="langId" value="2"/>
			<label for="langId">HTML</label>
			<input type="radio" id="langId3" name="langId" value="3"/>
			<label for="langId">CSS</label>
			<input type="radio" id="langId4" name="langId" value="4"/>
			<label for="langId">SQL</label>
			
			<form:hidden path="id" value="${post.id }" />
			<form:hidden path="isForumVisable" value="true" />
			<form:hidden path="isBlog" value="false" />
			<form:hidden path="isExpert" value="false" />
		</form:form>
		
		<button type="submit"  form="thisForm" class="signInButton">
        Submit Post
      </button>
      
	<hr></hr>
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   