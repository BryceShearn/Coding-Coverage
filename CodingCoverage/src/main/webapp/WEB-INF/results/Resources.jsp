<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/Resources.css">
<title>Resources</title>
<link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
</head>
<body>
	<div class="container1">
	<div class="container2">
	<h3>Find The Resources That Work For You</h3>
	</div>
	</div>
	<form action="SearchFilter.do" method="GET">
		<div class="searchBox"><input class="search" type="text" name="keyword" placeholder="Search Our Resources" /> 
		<select class="language"
		name="language_id" id="Language">
		<option value="1">Java</option>
		<option value="2">HTML</option>
		<option value="3">CSS</option>
   <!-- <option value="4">SQL</option> -->
		</select>
		</div>
		<div class="searchResources">
		<input class="button" type="submit" value="Search Resources" />
		</div>
		<img src="images/codingCoverage.png">
	</form>
	
	<c:choose>
		<c:when test="${empty resources}">
        Your search criteria did not return any results. Please Try Again.
    </c:when>
		<c:otherwise>
			<c:forEach var="r" items="${resources}">
  ${r.id}
  <br>
  ${r.link}
  <br>
  ${r.description}
  <br>
  ${r.difficulty}
  <br>
  ${r.dateAdded}
  <br>
  ${r.languages}
  <br>
  ${r.tasks}
  </c:forEach>
		</c:otherwise>
	</c:choose>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>
