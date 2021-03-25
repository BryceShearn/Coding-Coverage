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
  <form action="updateComment.do" method="POST">
  <input type="text" value= '${sessionScope.user.comments.get(0).content}' name="content"/>
  <br>
  ${sessionScope.user.comments.get(0).commentVote}
  <br>
  <input type="hidden" value= ${sessionScope.user.comments.get(0).post.id} name="id" />
  <input type="hidden" value= ${sessionScope.user.comments.get(0).id} name="id" />
  <input class="button" type="submit" value="Submit Edit" />
  </form>
</body>
</html>