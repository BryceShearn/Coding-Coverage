<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">
	<head>
    	<meta charset="UTF-8">
    	<title>Coding Coverage User Comment Page</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<meta name="keywords" content="">
    	<link rel="stylesheet" type="text/css" href="css/animate.css">
    	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="css/jquery.range.css">
    	<link rel="stylesheet" type="text/css" href="css/line-awesome.css">
    	<link rel="stylesheet" type="text/css" href="css/line-awesome-font-awesome.min.css">
		<link href="css/all.min.css" rel="stylesheet" type="text/css">
    	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css">
    	<link rel="stylesheet" type="text/css" href="css/slick.css">
    	<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
    	<link rel="stylesheet" type="text/css" href="css/style.css">
    	<link rel="stylesheet" type="text/css" href="css/responsive.css">
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	</head>
	<body>
	<div class="wrapper">
		<header>
			<div class="container">
				<div class="header-data">
					<div class="logo pd-btm">
						<a href="index.html" title=""><img src="images/logo.png" alt=""></a>
					</div><!--logo end-->
					<div class="forum-bar">
						<h2>Forum</h2>
						<ul>
							<li><a href="#" title="">Tags</a></li>
							<li><a href="#" title="">Users</a></li>
							<li><a href="#" title="" class="ask-question">LINE 39 BUTTON</a></li>
						</ul>
					</div><!--search-bar end-->
					<div class="login_register">
						<ul>
							<li><a href="profilePageResults.do" title="">Home</a></li>
						</ul>
					</div><!--login_register end-->
					<div class="search-bar st2">
						<%-- <form> --%>
							<!-- <input type="text" name="search" placeholder="Search..."> -->
							<!-- <button type="submit"><i class="la la-search"></i></button> -->
						<%-- </form> --%>
					</div><!--search-bar end-->
				</div><!--header-data end-->
			</div>
		</header>	
		<section class="forum-sec">
			<div class="container">
				<div class="forum-links">
					<ul>
						<li class="active"><a href="#" title="">Latest</a></li>
						<li><a href="#" title="">Unanswered</a></li>
						<li><a href="#" title="">Treading</a></li>
						<li><a href="#" title="">Popular This Week</a></li>
						<li><a href="#" title="">Popular of Month</a></li>
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
							<div class="forum-post-view">
								<div class="usr-question">
									<div class="usr_img">
										<!-- user profile image insert position -->
										<img src="images/DefaultProfilePictures/Avatar-34.png" alt="Default Profile Picture"> 
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<span><i class="fa fa-clock-o"></i>3 min ago</span>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fa fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fa fa-share-alt"></i> Share</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">JAVA</a></li>
											<li><a href="#" title="">HTML</a></li>
											<li><a href="#" title="">CSS</a></li>
											<!-- <li><a href="#" title="">SQL</a></li> -->
											<!-- <li><a href="#" title="">JS</a></li> -->
										</ul>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at libero elit. Mauris ultrices sed lorem nec efficitur. Donec sit amet facilisis lorem, quis facilisis tellus. Nullam mollis dignissim nisi sit amet tempor. Nullam sollicitudin neque a felis commodo gravida at sed nunc. In justo nunc, sagittis sed venenatis at, dictum vel erat. Curabitur at quam ipsum. Quisque eget nibh aliquet, imperdiet diam pharetra, dapibus lacus. Sed tincidunt sapien in dui imperdiet eleifend. Ut ut sagittis purus, non tristique elit. Quisque tincidunt metus eget ligula sodales luctus. Donec convallis ex at dui convallis malesuada. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut pretium euismod mollis. Pellentesque convallis gravida ante eu pretium. Integer rutrum mi nec purus tincidunt, nec rhoncus mauris porttitor. Donec id tellus at leo gravida egestas. Suspendisse consequat mi vel euismod efficitur. Donec sed elementum libero.</p>
										<p> Etiam rutrum ut urna eu tempus. Curabitur suscipit quis lorem vel dictum. Aliquam erat volutpat. Pellentesque volutpat viverra pulvinar. Mauris ac sapien ac metus tincidunt volutpat eu eu purus. Suspendisse pharetra quis quam id auctor. Pellentesque feugiat venenatis urna, vitae suscipit enim volutpat vitae. Nunc egestas tortor est, at sodales ligula auctor efficitur.</p>
										<div class="comment-section">
											<h3>03 Comments</h3>
											<div class="comment-sec">
												<ul>
													<li>
														<div class="comment-list">
															<div class="bg-img">
																<img src="images/resources/bg-img1.png" alt="">
															</div>
															<div class="comment">
																<h3>John Smith</h3>
																<span><img src="images/clock.png" alt=""> 3 min ago</span>
																<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at libero elit. Mauris ultrices sed lorem nec efficitur.</p>
															</div>
														</div><!--comment-list end-->
													</li>
													<li>
														<div class="comment-list">
															<div class="bg-img">
																<img src="images/resources/bg-img2.png" alt="">
															</div>
															<div class="comment">
																<h3>John Doe</h3>
																<span><img src="images/clock.png" alt=""> 3 min ago</span>
																<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam luctus hendrerit metus, ut ullamcorper quam finibus at.</p>
															</div>
														</div><!--comment-list end-->
													</li>
													<li>
														<div class="comment-list">
															<div class="bg-img">
																<img src="images/resources/bg-img4.png" alt="">
															</div>
															<div class="comment">
																<h3>John Doe</h3>
																<span><img src="images/clock.png" alt=""> 3 min ago</span>
																<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam luctus hendrerit metus, ut ullamcorper quam finibus at.</p>
															</div>
														</div><!--comment-list end-->
													</li>
												</ul>
											</div><!--comment-sec end-->
										</div>
									</div><!--usr_quest end-->
								</div><!--usr-question end-->
							</div><!--forum-post-view end-->
							<div class="post-comment-box">
								<h3>03 Comments</h3>
								<div class="user-poster">
									<div class="usr-post-img">
										<img src="images/DefaultProfilePictures/Avatar-34.png" alt="">
									</div>
									<div class="post_comment_sec">
										<form>
											<textarea placeholder="Your Answer"></textarea>
											<button type="submit">Post Answer</button>
										</form>
									</div><!--post_comment_sec end-->
								</div><!--user-poster end-->
							</div><!--post-comment-box end-->
							<div class="next-prev">
								<a href="#" title="" class="fl-left">Preview</a>
								<a href="#" title="" class="fl-right">Next</a>
							</div><!--next-prev end-->
						</div>
						<div class="col-lg-4">
							<!-- <div class="widget widget-feat"> -->
								<!-- <ul> -->
									<!-- <li> -->
										<!-- <i class="fa fa-heart"></i> -->
										<!-- <span>1185</span> -->
									<!-- </li> -->
									<!-- <li> -->
										<!-- <i class="fa fa-comment"></i> -->
										<!-- <span>1165</span> -->
									<!-- </li> -->
									<!-- <li> -->
										<!-- <i class="fa fa-share-alt"></i> -->
										<!-- <span>1120</span> -->
									<!-- </li> -->
									<!-- <li> -->
										<!-- <i class="fa fa-eye"></i> -->
										<!-- <span>1009</span> -->
									<!-- </li> -->
								<!-- </ul> -->
							<!-- </div>widget-feat end -->
							<!-- <div class="widget widget-user"></div> --><!--widget-user end--><!-- right side bar upper -->
							<!-- <div class="widget widget-adver"> --> <!-- right side bar lower -->
							<!-- </div> --><!--widget-adver end-->
						<!-- </div> -->
					<!-- </div> -->
				<!-- </div> --><!--forum-questions-sec end-->
			</div>
		</section><!--forum-page end-->

		<footer>
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
					<p><img src="images/copy-icon2.png" alt="">Copyright 2019</p>
					<img class="fl-rgt" src="images/logo2.png" alt="">
				</div>
			</div>
		</footer>


		<div class="overview-box" id="question-box">
			<div class="overview-edit">
				<h3>Ask a Question</h3>
				<form>
					<input type="text" name="question" placeholder="Type Question Here">
					<input type="text" name="tags" placeholder="Tags">
					<textarea placeholder="Description"></textarea>
					<button type="submit" class="save">Submit</button>
					<button type="submit" class="cancel">Cancel</button>
				</form>
				<a href="#" title="" class="close-box"><i class="la la-close"></i></a>
			</div><!--overview-edit end-->
		</div><!--overview-box end-->

	</div><!--theme-layout end-->



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="lib/slick/slick.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>


</body>
	</html>