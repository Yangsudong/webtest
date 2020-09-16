<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberStat.jsp</title>
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
        <h3>Member Status Page</h3>
    </div>
    
     <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
<h3>회원통계</h3>
<h5>남여 비율</h5>
<% List<HashMap<String, Object>> list =
		(List<HashMap<String,Object>>)request.getAttribute("genderCnt");
	for(HashMap<String, Object> temp : list) {
%>
	<span><%=temp.get("gender")%></span>
	<span><%=temp.get("cnt")%></span><br>
<%
	}
%>

<h5>직업별 회원수</h5>

<h5>메일수신회원 수 :</h5>
<%=request.getAttribute("mailCnt")%>
</body>
</html>