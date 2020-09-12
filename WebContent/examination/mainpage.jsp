<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> &amp; main page</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="style.css">
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
  <section class="hero-area bg-img bg-overlay-2by5" style="background-image: url(img/bg-img/bg1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <!-- Hero Content -->
                    <div class="hero-content text-center">
                        <h2>Let's Study Together</h2>
                        <form action = "examSearch">
						<input type ="hidden" name ="test_no" value= "1">
						<input type ="hidden" name ="subject_no" value= "1">
						<input type ="hidden" name ="subject_name" value= "요구사항 확인">
						<button class="btn clever-btn" type="submit" id="test_no">Get Started</button>	
						</form>                        
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    <section class="cool-facts-area section-padding-100-0">
        <div class="container">
            <div class="row">
                 <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                <a href="/webtest/examination/examSearch?test_no=1&subject_no=1">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <h2><span class="classynav">STEP1</span></h2>
                        <h5>요구사항<br>확인</h5>
                    </div>
                </a>
                </div>
				<!-- Single Cool Facts Area -->
               <div class="col-12 col-sm-6 col-lg-3">
                <a href="/webtest/examination/examSearch?test_no=11&subject_no=2">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                        
                        <h2><span class="classynav">STEP2</span></h2>
                        <h5>데이터 입출력<br>구현</h5>
                    </div>
                </a>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                <a href="/webtest/examination/examSearch?test_no=21&subject_no=3">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                        
                        <h2><span class="classynav">STEP3</span></h2>
                        <h5>통합 <br>구현</h5>
                    </div>
                </a>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                <a href="/webtest/examination/examSearch?test_no=31&subject_no=3">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <h2><span class="classynav">STEP4</span></h2>
                        <h5>서버 프로그램 <br>구현</h5>
                    </div>
                </a>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                <a href="/webtest/examination/examSearch?test_no=41&subject_no=4">
                    <div class="single-cool-facts-area text-center mb-100 wow fadeInUp" data-wow-delay="250ms">
                        <h2><span class="classynav">STEP5</span></h2>
                        <h5>인터페이스<br>구현</h5>
                    </div>
                </a>
                </div>
               
            </div>
        </div>
    </section>
</body>
</html>