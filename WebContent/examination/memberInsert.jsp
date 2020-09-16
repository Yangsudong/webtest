<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<script>
function inputCheck() {
	//id, pw 필수입력체크
	if(frm.id.value == ""){
		window.alert("id 입력");
		frm.id.focus();
		return false; 
	}
	if(frm.pass.value == ""){
		alert("pw 입력");
		frm.pass.focus();
		return false;		
	}	
	
	//job(select태그)
	if(frm.job.value == "") {
		alert("job 선택");
		frm.job.focus();
		return false;
	}
	//radio, checkbox
	var gender =
		document.querySelectorAll("[name ='gender']:checked").length;
	if(gender == 0) {
		alert("성별 적어도 하나는 선택");
		return false;
	}
	
	//frm.submit();
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
     <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(img/bg-img/bg2.jpg);">
        <h3>Member Insert Page</h3>
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

						<form method="post" name="frm" id="frm" action = "memberInsert" onsubmit="return inputCheck()">
								<div class="regist">
									<p>ID : <input type="text" name="id"><br></p>
									<p>PW : <input type="password" name="pass"></p>
								</div>			
								<div>
									<label>Gender</label> <br>
									<input type="radio" name="gender" value=man checked>남자 
							    	<input type="radio" name="gender" value=woman>여자 
							    </div><br>
								<p> 가입동기 <br><textarea rows="8" cols="70" id="reason" name="reason"></textarea></p>
								<p><button type="reset" class="btn btn-success">초기화</button> &nbsp;&nbsp;
								<button class="btn btn-success">등록</button></p>
						</form>
						</div>
		 			</div>
         		</div>
    	 	</div>
 	</div>
</body>
</html>