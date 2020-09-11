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
<button type="button" id="btnPage">문제풀기</button>
<script>
	btnPage.addEventListener("click",goPage);
	function goPage() {
		location.assign("testpage.jsp");
	}
</script>
</body>
</html>