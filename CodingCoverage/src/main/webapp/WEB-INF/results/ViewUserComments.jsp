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
    <title>Your Comments</title>
    <link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
  </head>
  <body>
  <br>
  
  <c:if test="${sessionScope.user.comments.size() > 0}">
  ${sessionScope.user.comments.get(0).post.dateCreated}    ${sessionScope.user.comments.get(0).post.user.image} ${sessionScope.user.comments.get(0).post.user.username} <b><i>${sessionScope.user.comments.get(0).post.user.role}</i></b>
  <br>
  ${sessionScope.user.comments.get(0).post.subject}
  <br>
  Includes ${sessionScope.user.comments.get(0).post.language}
  <br>
  ${sessionScope.user.comments.get(0).post.content}
  <br>
  ${sessionScope.user.comments.get(0).post.postVote}
  <br>
  ----------------------------------------------------------
  <br>
  ${sessionScope.user.comments.get(0).dateCreated}    ${sessionScope.user.comments.get(0).user.image} ${sessionScope.user.comments.get(0).user.username} <b><i>${sessionScope.user.comments.get(0).user.role}</i></b>
  <br>
  ${sessionScope.user.comments.get(0).content}
  <br>
  ${sessionScope.user.comments.get(0).commentVote}
  <br>
  <form action="showIndividualComment.do" method="GET">
  <input type="hidden" value= ${sessionScope.user.comments.get(0).id} name="id"/>
  <input class="button" type="submit" value="Edit Comment" />
  </form>
  
  <form action="deleteComment.do" method="POST">
   <input type="hidden" value= "${sessionScope.user.comments.get(0).id}" name="commentId" />
   <input type="hidden" value= "${sessionScope.user.id}" name="userId" />
  <input class="button" type="submit" value="Delete Comment" />
  </form>
  <br>
  </c:if>
  
  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   