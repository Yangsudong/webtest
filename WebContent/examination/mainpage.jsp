<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인페이지 입니다.</h3>	
<form action="examination/examinationSelect" method="post">
	<div><input type="text" name="test_no" value ="${param.test_no}"></div>
	<div><button type="button">문제풀기</button></div>
</form>
</body>
</html>