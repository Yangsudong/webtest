<%@page import="member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>

	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <title>list page</title>

    <link rel="icon" href="img/core-img/favicon.ico">

    <link rel="stylesheet" href="style.css">
    
<style>
	.row{
	    margin-top:40px;
	    padding: 0 30px;
	}
	.clickable{
	    cursor: pointer;   
	}
	.panel-heading div {
		
		margin-top: -18px;
		font-size: 15px;
	}
	.panel-heading div span{
		margin-left:15px;
		
	}
	.panel-body{
		display: none;
	}
</style>
<script>

function btnMemDelete(id) {
	if( confirm("정말 삭제 하시겠습니까?")) {
		location.href="/webtest/examination/memberDelete?id="+id;
		alert(id + "회원이 삭제되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
}
function btnMemUpdate(id) {
	if( confirm("수정페이지로 이동하시겠습니까?")) {
		location.href="/webtest/examination/memberUpdate?id="+id;
	}
}
(function(){
    'use strict';
	var $ = jQuery;
	$.fn.extend({
		filterTable: function(){
			return this.each(function(){
				$(this).on('keyup', function(e){
					$('.filterTable_no_results').remove();
					var $this = $(this), 
                        search = $this.val().toLowerCase(), 
                        target = $this.attr('data-filters'), 
                        $target = $(target), 
                        $rows = $target.find('tbody tr');
                        
					if(search == '') {
						$rows.show(); 
					} else {
						$rows.each(function(){
							var $this = $(this);
							$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
						})
						if($target.find('tbody tr:visible').size() === 0) {
							var col_count = $target.find('tr').first().find('td').size();
							var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
							$target.find('tbody').append(no_results);
						}
					}
				});
			});
		}
	});
	$('[data-action="filter"]').filterTable();
})(jQuery);
$(function(){
	$('[data-action="filter"]').filterTable();
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	$('[data-toggle="tooltip"]').tooltip();
})
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
        <h3>Member List Page</h3>
    </div>
    
     <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    
    <div class="container section-padding-100"  >
    <h1>Member List <small>(<i class="glyphicon glyphicon-filter"></i>)</small></h1>
    	<div class="row">
				<div class="classynav">
                    <ul>                                                    
                        <li><a href="/webtest/examination/memberSelectAll">Reset</a></li>  
                    </ul>
                </div>
			<div class="col-md-20 col-12">
				<div class="panel panel-primary" >
					<div class="panel-heading">
						<h3 class="panel-title">Member</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
					<form name="searchFrm">
						<input type="hidden" name="p" value="1">
						<input type="text" name="answer" value="${parm.id}" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Search Answer" />
					</from>
					</div>
					
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th width="10%">아이디</th>
								<th width="20%">패스워드</th>
								<th>가입동기</th>
								<th width="15%">성별</th>
								<th width="15%">가입일자</th>
								<th width="10%">삭제</th>
								<th width="10%">수정</th>
							</tr>
						</thead>
						<tbody>		
							<c:forEach items="${list}" var="member">			
								<tr>
									<td>${member.id}</td>
									<td>${member.pass}</td>
									<td>${member.reason}</td>
									<td>${member.gender}</td>
									<td>${member.regdate}</td>
									<td><button type="button" class="btn btn-outline-primary" onclick="btnMemDelete(${member.id})">삭제</button></td>
									<td><button type="button" class="btn btn-outline-primary" onclick="btnMemUpdate(${member.id})">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>