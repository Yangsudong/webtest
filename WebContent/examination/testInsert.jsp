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
  
    <title> &amp; insert page</title>

    <link rel="icon" href="img/core-img/favicon.ico">

    <link rel="stylesheet" href="style.css">

<title>Insert test</title>
<script>
function inputCheck() {
	if(frm.test_no.value == ""){
		window.alert("문제번호 입력");
		frm.test_no.focus();
		return false; 
	}
	if(frm.answer.value == ""){
		alert("정답 입력");
		frm.answer.focus();
		return false;		
	}	
	if(frm.subject_no.value == "") {
		alert("과목 선택");
		frm.subject_no.focus();
		return false;
	}
	return true;
} 
</script>
</head>
<body>
<%@include file="/examination/header.jsp" %>

     <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    
     <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(img/bg-img/bg4.jpg);">
        <h3>Insert Page</h3>
    </div>
    
     <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    
     <div class="blog-details-content section-padding-100">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-15 col-lg-15" >
	                    <!-- Blog Details Text -->
	                    <div class="blog-details-text">
	                    	<form action="testInsert" method="post" name="frm" id="frm" onsubmit="return inputCheck()">
		                        <p>Exam Number : <input type="text" name="test_no"></p>
		                        <p>Last Number : ${count} </p>
		                        <p>Exam Content <br> <textarea rows="8" cols="70" name="content"></textarea>
		                        <p>Answer : <input type="text" name="answer"></p>
		                        <p>Subject 
		                        	<select name="subject_no" id ="subject_no">
									<option value="">선택 
									<c:forEach items="${subjectlist}" var="subject">
										<option value="${subject.subject_no}">${subject.subject_no}_${subject.subject_name}
									</c:forEach>	
									</select>
								</p>
								<p><button class="btn btn-success">등록</button></p>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
        </div>
</body>
</html>