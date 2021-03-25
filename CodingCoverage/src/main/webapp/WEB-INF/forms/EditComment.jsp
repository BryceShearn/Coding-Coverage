<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Your Comment</title>
</head>
<body>
<br>
  ${sessionScope.user.comments.get(0).dateCreated}    ${sessionScope.user.comments.get(0).user.image} ${sessionScope.user.comments.get(0).user.username} <b><i>${sessionScope.user.comments.get(0).user.role}</i></b>
  <br>
  ${sessionScope.user.comments.get(0).content}
  <br>
  ${sessionScope.user.comments.get(0).commentVote}
</body>
</html>