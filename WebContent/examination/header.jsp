<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> header.jsp</title>
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
                    
                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>
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
                                <c:if test="${not empty sessionScope.id && sessionScope.id == 'admin'}">
                                <li><a href="/webtest/examination/testInsert">ExamInsert</a></li>  
                                <li><a href="/webtest/examination/examAll">ExamList</a></li>   
                                <li><a href="/webtest/examination/updateTest">ExamUpdate</a></li>
                                <li><a href="/webtest/examination/memberSelectAll">MemberList</a></li>
                                <li><a href="/webtest/examination/memberInsert">MemberInsert</a></li>                                
                                <li><a href="/webtest/examination/memberUpdate">MemberUpdate</a></li>
                                </c:if>   
                            </ul>
                            
                            <!-- Search Button -->
                            <div class="search-area">
                                <form action="mainpage.jsp" method="post">
                                    <input type="search" name="search" id="search" placeholder="Search">
                                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <!-- Register / Login -->
                            <div class="register-login-area">	
                                <c:if test="${not empty sessionScope.id}">
	                                 Connect Id :  ${sessionScope.id}
	                                <a href="/webtest/examination/logout" class="btn active">Logout</a>
                                </c:if>
                                
	                            <c:if test="${empty sessionScope.id}">   
	                            	<a href="memberInsert.jsp" class="btn">Register</a>
	                                <a href="/webtest/examination/login" class="btn active">Login</a>
                                </c:if>
                            </div>
                            
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    </body>
</html>