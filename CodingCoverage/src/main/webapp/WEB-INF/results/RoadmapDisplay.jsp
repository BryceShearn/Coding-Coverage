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
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>title</title>
    <link rel="stylesheet" href="css/roadmapDisplay.css">
  </head>
<body class = "main">
  <h1 class="display-4 text-center text-dark mb-5">Coding Road Map</h1>
  <div class="container">
    <div id="magicCarousel" class="carousel slide my-5" data-ride="carousel">
      
<!--    Carousel Indicators    -->
      <ol class="carousel-indicators">
        <li data-target="#magicCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#magicCarousel" data-slide-to="1"></li>
        <li data-target="#magicCarousel" data-slide-to="2"></li>
        <li data-target="#magicCarousel" data-slide-to="3"></li>
      </ol>
      
<!--    Carousel Slider    -->
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <img src="https://images.unsplash.com/photo-1588239034647-25783cbfcfc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" class="d-block w-100">
          <div class="carousel-caption">
            <h3>Slide 01</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At placeat dolore obcaecati perspiciatis neque in, iusto, quia aut molestias minus ipsam modi dolorem odit eos.</p>
          </div> 
        </div>
        
        <div class="carousel-item">
          <img src="https://picsum.photos/700/450" class="d-block w-100">
          <div class="carousel-caption">
            <h3>Slide 02</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia vel in placeat corrupti. Velit quidem eos, accusantium vitae nostrum reiciendis ratione libero? Aperiam, recusandae culpa.</p>
          </div> 
        </div>
        
        <div class="carousel-item">
          <img src="//unsplash.it/g/700/450" class="d-block w-100">
          <div class="carousel-caption">
            <h3>Slide 03</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam, ut beatae porro ullam quidem officia dignissimos facilis? Blanditiis nesciunt labore pariatur quaerat exercitationem quibusdam modi!</p>
          </div> 
        </div>
        
        <div class="carousel-item">
          <img src="https://picsum.photos/700/450" class="d-block w-100">
          <div class="carousel-caption">
            <h3>Slide 04</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis soluta accusamus sequi eos consectetur! Animi minima modi ad at similique velit quibusdam veritatis sequi placeat?</p>
          </div> 
        </div>
        
<!--     Carousel Controls     -->
        <a href="#magicCarousel" class="carousel-control-prev" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a href="#magicCarousel" class="carousel-control-next" role="button" data-slide="next">
          <span class="carousel-control-next-icon"></span>
          <span class="sr-only">Next</span>
        </a>
        
      </div>
    </div>
  </div>
  
  
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">    </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>





<%-- <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>title</title>
    <link rel="stylesheet" href="css/roadmapDisplay.css">
  </head>
  <body>
	<p>${sessionScope.user.roadmaps.get(0).codeConcepts}</p>
	<h1>Do this task:</h1>
	<h3> ${sessionScope.user.roadmaps.get(0).codeConcepts.get(0).task.get(0).name}</h3>
	<h6> ${sessionScope.user.roadmaps.get(0).codeConcepts.get(0).task.get(0).description}</h6>
	<h6> Here are your resources!</h6>
	<ul>
		<c:forEach var="rsrc" items="${sessionScope.user.roadmaps.get(0).codeConcepts.get(0).task.get(0).resources}">
			<li><a href="${rsrc.link }">${rsrc.description }</a></li>
		</c:forEach>
	</ul>
	<form action="completedTask.do" method="POST">
		<input type="hidden" name="taskId" value="${sessionScope.user.roadmaps.get(0).codeConcepts.get(0).task.get(0).id }" />
		<input type="submit" value="Task Completed!">
	</form>
	<c:choose>
		<c:when test="">
		Completed!
		</c:when>
		<c:otherwise>
		TODO!
		</c:otherwise>
	</c:choose>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>    --%>