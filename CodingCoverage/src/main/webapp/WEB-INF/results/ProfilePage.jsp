<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		 <!-- meta tags -->
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
		<title>Coding Coverage Profile Page</title>
		<!--  FavIcon Insert -->
		<link rel="shortcut icon" type="image/jpg" href="images/codingCoverage.png"/>
		<!-- Internal Resources -->
		<link rel="stylesheet" href="css/profilePage.css">
	</head>
  	<body>
		<div class="main-container">
            <!-- HEADER -->
            <header class="block">
                <ul class="header-menu horizontal-list">
                    <li>
                        <a class="header-menu-tab" href="#1"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="Resources.do"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="#########"><span class="icon fontawesome-envelope scnd-font-color"></span>Messages</a>
                        <a class="header-menu-number" href="#4"></a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="#5"><span class="icon fontawesome-star-empty scnd-font-color"></span>Favorites</a>
                    </li>
                </ul>
                <div class="profile-menu">
                    <p>${sessionScope.user.username } <a href="#26"><span class="entypo-down-open scnd-font-color"></span></a></p>
                    <div class="profile-picture small-profile-picture">
                        <img width="40px" alt="Anne Hathaway picture" src="images/profilePicture.png">
                    </div>
                </div>
            </header>
			<header class="block">
            	<ul class="header-menu horizontal-list">
                	<p> This is the block for the carousel </p>
            </header>
            <!-- LEFT-CONTAINER -->
            <div class="left-container container">
                <div class="profile block"> <!-- PROFILE PICTURE AND DESCRIPTION(MIDDLE-CONTAINER) -->
                    <a class="add-button" href="#28"><span class="icon entypo-plus scnd-font-color"></span></a>
                    	<div class="profile-picture big-profile-picture clear">
                        	<img width="150px" alt="Filler profile picture" src="images/profilePicture.png" >
                    	</div>
                    <h1 class="user-name">${sessionScope.user.firstName } </h1>
                    	<div class="profile-description">
                        	<p class="scnd-font-color">${sessionScope.user.bio }</p>
                    	</div>
              	</div>
            <div class="scrolling-box block">
            	<h2 class="titular">YOUR POSTS</h2>
                	<section id="1">PERSONAL POSTS</section>
            			<ul class= "scrolling-box-menu">
            				<c:forEach var="post" items="${sessionScope.user.posts }">
            					<li>
                            		<a class="menu-box-tab" href="viewForumPost.do?id=${post.id}">
                            			<span class="icon fontawesome-envelope scnd-font-color"></span>
                            				${post.subject }
                            			<div class="menu-box-number"></div>
                            		</a>                            
                        		</li>
            				</c:forEach>
            			</ul>
  					<p>COMMUNITY POSTS</p>
                    <p>Filler Post 1</p>
                    <p>Filler Post 2</p>
                    <p>Filler Post 3</p>
                    <p>Filler Post 4</p>
                    <p>Filler Post 5</p>
  						<ul class= "scrolling-box-menu">
            				<c:forEach var="post" items="${sessionScope.user.posts }">
            					<li>
                            		<a class="menu-box-tab" href="########">
                            			<span class="icon fontawesome-envelope scnd-font-color"></span>
                            				${post.subject }
                            			<div class="menu-box-number"></div>
                            		</a>                            
                        		</li>
            				</c:forEach>
            			</ul>
					<c:choose>
 					<c:when test="${user.role == 'admin'}">
 					<p>EXPERT POSTS</p>
            			<ul class= "scrolling-box-menu">
            				<c:forEach var="post" items="${sessionScope.user.posts }">
            					<li>
                            		<a class="menu-box-tab" href="########">
                            			<span class="icon fontawesome-envelope scnd-font-color"></span>
                            				${post.subject }
                            			<div class="menu-box-number"></div>
                            		</a>                            
                        		</li>
            				</c:forEach>
            			</ul>
					</c:when>
            		</c:choose>
              	</div>
            </div>
            <!-- MIDDLE-CONTAINER -->
            <div class="middle-container container">
                <div class="menu-box block"> <!-- MENU BOX (LEFT-CONTAINER) -->
          <h2 class="titular">MENU BOX</h2>
                    <ul class="menu-box-menu">
                        <li>
                            <a class="menu-box-tab" href="#6"><span class="icon fontawesome-envelope scnd-font-color"></span>View RoadMap<div class="menu-box-number"></div></a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#8"><span class="icon entypo-paper-plane scnd-font-color"></span>Post to Community Forum<div class="menu-box-number"></div></a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#10"><span class="icon entypo-calendar scnd-font-color"></span>Post to Expert Forum (EXPERT)<div class="menu-box-number"></div></a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#12"><span class="icon entypo-cog scnd-font-color"></span>View External Resources</a>
                        </li>
                        <li>
                            <a class="menu-box-tab" href="viewUserComments.do"><sapn class="icon entypo-chart-line scnd-font-color"></sapn>View My Comments</a>
                        </li>                        
                    </ul>
                </div>
            <ul class="social block"> <!-- SOCIAL (MIDDLE-CONTAINER) -->
            	<li>
            		<a href="#50">
            			<div class="facebook icon">
            				<span class="zocial-facebook"></span>
            			</div>
            		<h2 class="facebook titular">SHARE TO FACEBOOK</h2>
            	</li>
                </a>
                <li>
	                <a href="#51">
                		<div class="twitter icon">
                			<span class="zocial-twitter"></span>
                		</div>
                	<h2 class="twitter titular">SHARE TO TWITTER</h2>
                </li>
                </a>
                <li>
               		<a href="#52">
                		<div class="googleplus icon">
               				<span class="zocial-googleplus"></span>
               			</div>
               		<h2 class="googleplus titular">SHARE TO GOOGLE+</h2>
               	</li>
                </a>
            </ul>
            </div>
            <!-- RIGHT-CONTAINER -->
            <div class="right-container container">
               <div class="donut-chart-block block"> <!-- DONUT CHART BLOCK (LEFT-CONTAINER) -->
                    <h2 class="titular"> LEARNING METRICS</h2>
                    
                    	<div class="donut-chart">
                        	<!-- DONUT-CHART -->
                        	<div id="porcion1" class="recorte">
                        		<div class="quesito ios" data-rel="21"></div>
                        	</div>
                        	<div id="porcion2" class="recorte">
                        		<div class="quesito mac" data-rel="39"></div>
                        	</div>
                        	<div id="porcion3" class="recorte">
                        		<div class="quesito win" data-rel="31"></div>
                        	</div>
                        	<div id="porcionFin" class="recorte">
                        		<div class="quesito linux" data-rel="9"></div>
                        	</div>
                        	<!-- END DONUT-CHART -->    
                <p class="center-date">MARCH<br><span class="scnd-font-color">2021</span></p> 
                    	</div>
                    <ul class="os-percentages horizontal-list">
                        <li>
                            <p class="ios os scnd-font-color">Java</p>
                            <p class="os-percentage">21<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="mac os scnd-font-color">CSS</p>
                            <p class="os-percentage">48<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="linux os scnd-font-color">HTML</p>
                            <p class="os-percentage">9<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="win os scnd-font-color">JS</p>
                            <p class="os-percentage">32<sup>%</sup></p>
                        </li>
                    </ul>
                </div>
                <div class="line-chart-block block clear"> <!-- LINE CHART BLOCK (LEFT-CONTAINER) -->
                    <div class="line-chart">
                      <!-- LINE-CHART -->
                        <div class='grafico'>
                        	<ul class='eje-y'>
                            	<li data-ejeY='30'></li>
                             	<li data-ejeY='20'></li>
                             	<li data-ejeY='10'></li>
                             	<li data-ejeY='0'></li>
                           </ul>
                           <ul class='eje-x'>
                             <li>Jan</li>
                             <li>Feb</li>
                             <li>Mar</li>
                           </ul>
                           <span data-valor='25'>
								<span data-valor='8'>
                                	<span data-valor='13'>
                                    	<span data-valor='5'>   
                                     		<span data-valor='23'>   
                                     			<span data-valor='12'>
                                        			<span data-valor='15'>
                                         			</span>
                                     			</span>
                                     		</span>
                                   		</span>
                                	</span>
                            	</span>
                        	</span>
                        </div>
                        <!-- END LINE-CHART -->
                    </div>
                    	<!-- END OF LINE CHART BLOCK -->
                    <ul class="time-lenght horizontal-list">
                        <li><a class="time-lenght-btn" href="#14">Week</a></li>
                        <li><a class="time-lenght-btn" href="#15">Month</a></li>
                        <li><a class="time-lenght-btn" href="#16">Year</a></li>
                    </ul>
                    <ul class="month-data clear">
                        <li>
                            <p>APR<span class="scnd-font-color"> 2013</span></p>
                            <p><span class="entypo-plus increment"> </span>21<sup>%</sup></p>
                        </li>
                        <li>
                            <p>MAY<span class="scnd-font-color"> 2013</span></p>
                            <p><span class="entypo-plus increment"> </span>48<sup>%</sup></p>
                        </li>
                        <li>
                            <p>JUN<span class="scnd-font-color"> 2013</span></p>
                            <p><span class="entypo-plus increment"> </span>35<sup>%</sup></p>
                        </li>
                    </ul>
                </div> 
            </div> <!-- END OF RIGHT-CONTAINER -->
        </div> <!-- END OF MAIN CONTAINER -->
	<footer>
		<span>Created By <a href="https://github.com/BryceShearn">Bryce Shearn,</a>
						<a href="https://github.com/BryceShearn">Tylor Shearn,</a>
						<a href="https://github.com/BryceShearn">Thomas Webel</a> | <span class="far fa-copyright"></span> CodingCoverage.</span>
	</footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>   