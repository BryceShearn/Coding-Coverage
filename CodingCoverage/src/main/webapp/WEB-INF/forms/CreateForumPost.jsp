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
		<form:form id="createPost" action="createForumPost.do" method="POST" modelAttribute="post">
  			<!-- subject -->
  			<form:input path="subject"  placeholder="Subject"/>
  			<form:errors path="subject"/>
  			<!-- content -->
  			<form:textarea path="content" placeholder="Content"/>
  			<form:errors path="content"/>
  			<!-- Language Radio Selection -->
  			<label for="langId">What language is this post about?</label>
			<select name="langId" id="langId">
			    <option value="">--Please choose an option--</option>
			    <option value="1">Java</option>
			    <option value="2">HTML</option>
			    <option value="3">CSS</option>
			    <option value="4">SQL</option>
			</select>

  			<!-- hidden visibility booleans  -->
  			<form:hidden path="isForumVisable" value="true"/>
  			<form:hidden path="isBlog" value="false"/>
  			<form:hidden path="isExpert" value="false"/>
		</form:form>	
      		<button type="submit" name = "submit" value = "createPost" form ="createPost">SUBMIT POST</button>
      			
      		<form id = "returnHome" action="profilePageResults.do" method="get"></form>
     		<button type="submit" name = "submit" form = "returnHome" class="animation a7">RETURN TO PROFILE</button>
	</div>
  
  
  <!-- 
'subject','varchar(500)
'content','text',
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