<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<form action="testInsert" method="post" name="frm" id="frm" onsubmit="return inputCheck()">
		<label>문제번호</label><input type="text" name="test_no"><br>
		<label>문제내용</label><br><textarea rows="8" cols="70" name="content"></textarea><br>
		<label>정답</label><input type="text" name="answer"><br>
		과목<select name="subject_no" id ="subject_no">
		<option value="">선택 
		<c:forEach items="${subjectlist}" var="subject">
			<option value="${subject.subject_no}">${subject.subject_no}_${subject.subject_name}
		</c:forEach>	
		</select><br>
	<div>
	<button type="reset">초기화</button>
	<button>등록</button>
	</div>
</form>
</body>
</html>