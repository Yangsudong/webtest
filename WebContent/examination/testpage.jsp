<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test page</title>
</head>
<body>
<h3>문제풀기</h3>
<form action="/examination/examinationSelect" method="post">
	<div><input type="text" name="test_no" value ="${exam.test_no}"></div>
	<div><button type="button">문제풀기</button></div>

<table border="1" id="employees">
		<thead>
			<tr>
				<th width="100" height="50">문제번호</th>
				<th width="100">문제</th>
				<th width="5000">내용</th>
			</tr>
		</thead>
		<tbody>
			<tr height="30">
				<td>${exam.test_no}</td>
				<td>${exam.answer}</td>
				<td>${exam.content}</td>  
			</tr>
		</tbody>
		
	</table>
</form>
</body>
</html>