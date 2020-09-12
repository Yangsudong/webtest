<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">  
    <title> &amp; main page</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
<meta charset="UTF-8">

</head>
<body>
<header class="header-area">    
        <div class="clever-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="cleverNav">
                    <!-- Logo -->
                    <a class="nav-brand" href="mainpage.jsp">HOME</a>
                    <!-- Menu -->
                    <div class="classy-menu">
                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="mainpage.jsp">Home</a></li>                              
                                <li><a href="/webtest/examination/testInsert">ExamInsert</a></li>                               
                                <li><a href="/webtest/examination/examAll">ExamList</a></li>
                            </ul>
                            <!-- Search Button -->
                            <div class="search-area">
                                <form action="#" method="post">
                                    <input type="search" name="search" id="search" placeholder="Search">
                                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <!-- Register / Login -->
                            <div class="register-login-area">
                                <a href="#" class="btn">Register</a>
                                <a href="index-login.html" class="btn active">Login</a>
                            </div>
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    
    <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    
    
    <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(img/bg-img/bg2.jpg);">
        <h3>Study Page</h3>
    </div>
    
    <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
     <section class="popular-courses-area section-padding-100">
	<div class="container">		
		<form action="examCheck">	
			<div class="alert alert-info" role="alert"><h5>문제</h5>${exam.content}</div>
			<div class="col-xl-4 col-md-6  col-sm-12">
				<div class="form-group row">
					<label class="col-3">정답</label>
					<div class="col-7">
						<input type="text" name="answer" class="form-control" value="${param.answer}">
					</div>
					<input type="hidden" name="test_no" value="${param.test_no}">
					<button type="submit" class="btn btn-outline-primary">확인</button>
					
					<label class="col-3">정답여부</label>
					<div class="col-7">
						<h4><span class="badge badge-secondary">${check}</span></h4>
					</div>
				</div>
			</div>
		</form>
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
	  		<div class="btn-group mr-2" role="group" aria-label="First group">
	  			<div class="col-5">
	  				<c:if test="${param.test_no > 1}">
						<form action="examSearch">
							<input type="hidden" name="test_no" value="${param.test_no-1}">
							<button type="submit" class="btn btn-outline-warning">Previous</button>
						</form>
					</c:if>
				</div>
				<div class="col-5">
					<c:if test="${param.test_no < count}">
						<form action="examSearch">
							<input type="hidden" name="test_no" value="${param.test_no+1}">
							<button type="submit" class="btn btn-outline-warning">Next</button>
						</form>
					</c:if>
				</div>
			</div>
	  		</div>
  		</div>
  		</section>
</body>
</html>