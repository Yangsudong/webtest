<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>test page</title>
</head>
<body>

 

 <header class="header-area">
     
        <div class="clever-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <nav class="classy-navbar justify-content-between" id="cleverNav">
				<a class="nav-brand" href="examination/mainpage.jsp">HOME</a>
				 </nav>
            </div>
        </div>
    </header>
    
    <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(img/bg-img/bg2.jpg);">
        <h3>Study Page</h3>
    </div>
    
	<section class="popular-courses-area section-padding-100">
        <div class="container">
            <div class="row">
                <!-- Single Popular Course -->
                <form action = "examCheck.do">
                <div class="col-25 col-md-15 col-lg-10">
                    <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="250ms">
                        
                        <!-- Course Content -->
                        <div class="course-content">
                            <h5>${exam.test_no}</h5><br>
                            <h4></h4>
                            <div class="meta d-flex align-items-center">
                                
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                <a href="#"> </a>
                            </div>
                            <input type ="hidden" name ="test_no" value= "${param.test_no}">	
		
		
			
	
                            <p>${exam.content}</p>
                        </div>
                        <!-- Seat Rating Fee -->
                        <div class="seat-rating-fee d-flex justify-content-between">
                            <div class="seat-rating h-100 d-flex align-items-center">
                                <div class="seat">
                                   	 정답<input type="text" name="answer" class="form-control" value="${param.answer}">
                                </div>                                
                            </div>
                           		<div class="course-fee h-100">
                          			<button type="submit" class="btn clever-btn w-100">확인</button>
                               	<div>${check}</div>                               
                            </div>
                        </div>
                    </div>
                </div>         
            </form>
    </section>
				
<form action = "examCheck.do">
<table border="1">
		<thead>
			<tr>
				<th width="100" height="50">문제번호</th>
				<th width="5000">문제</th>
			</tr>
		</thead>
		<tbody>
			<tr height="30">
				<td>${exam.test_no}</td>
				<td>${exam.content}</td>  
			</tr>
		</tbody>
	</table>
	<input type ="hidden" name ="test_no" value= "${param.test_no}">	
	<div>정답<input type="text" name="answer" value="${param.answer}">	
	<button type="submit">확인</button>	
	</div>		
	<div>${check}</div>
</form>

<c:if test="${param.test_no > 1}">		
<form action = "examSearch.do">	
	<input type ="hidden" name ="test_no" value= "${param.test_no-1}">
	<button type="submit">이전문제</button>	
</form>	
</c:if>
<c:if test="${param.test_no < count}">
<form action = "examSearch.do">	
	<input type ="hidden" name ="test_no" value= "${param.test_no+1}">
	<button type="submit">다음문제</button>	
</form>
</c:if>
</body>
</html>