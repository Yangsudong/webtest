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
<a class="nav-brand" href="examination/mainpage.jsp">HOME</a>
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