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
    <title>Expert Forum</title>
    <link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
  </head>
  <body>
  
  <h3> Expert Forum </h3>
  <br>
  <form action="searchFiltersExpertForum.do" method="GET">
  <input class="search" type="text" name="keyword" placeholder="Search" />
  <select class="language"
  name="language_id" id="Language">
  <option value="1">Java</option>
  <option value="2">HTML</option>
  <option value="3">CSS</option>
<!-- <option value="4">SQL</option> -->
  </select>
  <input class="button" type="submit" value="Search Forum" />
  </form>
  <br>
  
  <c:choose>
  <c:when test="${empty post}">
  Your search criteria did not return any results. Please Try Again.
  </c:when>
  <c:otherwise>

  <c:forEach var="p" items="${post}">
  <c:choose>
  <c:when test="${p.isExpert}">
  ${p.user.username} <b><i>${p.user.role}</i></b>
  <br>
  ${p.subject}
  <br>
  Includes ${p.language}<br>
  <form action="viewForumPost.do" method="GET">
  <input type="hidden" value= ${p.id} name="id"/>
  <input class="button" type="submit" value="View Post" />
  </form>
  <br> 
  </c:when>
  </c:choose>  
  </c:forEach>
  </c:otherwise>
  </c:choose>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   