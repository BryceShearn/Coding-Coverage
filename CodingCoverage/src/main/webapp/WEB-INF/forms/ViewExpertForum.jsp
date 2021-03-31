<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">
<head>
		<!-- Meta Info -->
	<meta charset="UTF-8">
	<title>User Forum</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
		<!--  Internal Resources -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome-font-awesome.min.css">
	<link href="css/all.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	<link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
	<link rel="stylesheet" type="text/css" href="css/navBar.css">
	<!-- External Resources -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
		<header>
		<br><br><br>	
		</header>
		<section class="forum-sec">
			<div class="container">
				<div class="menu">
					<ul id="nav">
						<li class="link"><a href="#" title="">Latest</a></li>
						<li class="link"><a href="#" title="">Unanswered</a></li>
						<li class="link"><a href="#" title="">Treading</a></li>
						<li class="link"><a href="#" title="">Popular This Week</a></li>
						<li class="link"><a href="#" title="">Popular of Month</a></li>
						
						<li class="link">
							<form id="searchBarForm" action="searchFiltersExpertForum.do" method="GET">
							<input type="text" name="keyword" placeholder="Search...">
							<button type="submit"><i class="la la-search"></i></button>
								<select form="searchBarForm" class="searchDrop" name="language_id" id="Language">
  									<option value="0" selected>All Languages</option>
  									<option value="1">Java</option>
 									<option value="2">HTML</option>
									<option value="3">CSS</option>
									<option value="4">SQL</option>
 								</select>
							</form>
						</li>
						<li>
							<div class="login_register">
								<ul>
									<li><a href="profilePageResults.do" title="">Home</a></li>
									<!-- <li><a href="sign-in.html" title="">Register</a></li> -->
								</ul>
							</div>
						</li>
					</ul>
				</div><!--forum-links end-->
				<div class="forum-links-btn">
					<a href="#" title=""><i class="fa fa-bars"></i></a>
				</div>
			</div>
		</section>
		<section class="forum-page">
			<div class="container">
				<div class="forum-questions-sec">
					<div class="row">
						<div class="col-lg-8">
							<div class="forum-questions">
							<!-- Where the fun begins -->
							<!-- NO RESULTS FOUND -->
							<c:choose>
							<c:when test="${empty posts}">
								<div class="usr-question">
									<div class="usr_img">
										<img src="images/resources/usrr-img1.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>No Results Found</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i>Try New Search!</a></li>
										</ul>
									</div><!--usr_quest end-->
								</div><!--usr-question end-->
							</c:when>
							<c:otherwise></c:otherwise>
							</c:choose>
							<!-- NO RESULTS FOUND -->
							<c:forEach var="post" items="${posts }">
							<c:choose>
								<c:when test="${post.isExpert }">
								<div class="usr-question">
									<div class="usr_img">
										<img src="images/resources/usrr-img1.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>${post.subject }</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comment on post</a></li>
											<li><a href="viewForumPost.do?id=${post.id }" title=""><i class="fas fa-eye"></i> View Post Content</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">${post.language }</a></li>
										</ul>
									</div><!--usr_quest end-->
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>Authored By: ${post.user.username }</span>
								</div><!--usr-question end-->
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							<!-- Where the fun ends -->
							<!-- <div class="usr-question"></div> COMMENTED OUT UNTIL FURTHER IMPLEMENTATIONS DUE TO SOLID BORDER ACROSS MAIN QUESTION BLOCK -->
							</div><!--forum-questions end-->
							<nav aria-label="Page navigation example" class="full-pagi">
							<ul class="pagination">
								<li class="page-item"><a class="page-link pvr" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link active" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">6</a></li>
								<li class="page-item"><a class="page-link pvr" href="#">Next</a></li>
							</ul>
							</nav>
						</div>
						<div class="col-lg-4"></div>
					</div>
				</div><!--forum-questions-sec end-->
			</div>
		</section><!--forum-page end-->
<!-- 		<footer>
			<div class="footy-sec mn no-margin">
				<div class="container">
					<ul>
						<li><a href="help-center.html" title="">Help Center</a></li>
						<li><a href="about.html" title="">About</a></li>
						<li><a href="#" title="">Privacy Policy</a></li>
						<li><a href="#" title="">Community Guidelines</a></li>
						<li><a href="#" title="">Cookies Policy</a></li>
						<li><a href="#" title="">Career</a></li>
						<li><a href="forum.html" title="">Forum</a></li>
						<li><a href="#" title="">Language</a></li>
						<li><a href="#" title="">Copyright Policy</a></li>
					</ul>
					<p><img src="images/copy-icon2.png" alt="">Copyright 2021</p>
					<img class="fl-rgt" src="images/logo2.png" alt="">
				</div>
			</div>
		</footer> -->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/popper.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="js/slick.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</body>
</html>