 <%@page import="examination.ExaminationVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <title>list page</title>

    <link rel="icon" href="img/core-img/favicon.ico">

    <link rel="stylesheet" href="style.css">
    
<style>
	.pagination li {
		display : inline-block;
		border : 15px solid white;
	}
	.pagination .active {
		border : 10px solid lightgray;
		background-color : lightgray;
	}
	
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
function btnDelete(test_no) {
	if( confirm("정말 삭제 하시겠습니까?")) {
		location.href="/webtest/examination/testDelete?test_no="+ test_no;
		alert(test_no + "번 문제가 삭제되었습니다.");
	} else {
		alert("취소 되었습니다.");
	}
}
function btnUpdate(test_no) {
	if( confirm("수정페이지로 이동하시겠습니까?")) {
		location.href="/webtest/examination/updateTest?test_no="+ test_no;
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
    // attach table filter plugin to inputs
	$('[data-action="filter"]').filterTable();
	
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	//$('[data-toggle="tooltip"]').tooltip();
})
</script>
<script>
	function gopage(p) {
		searchFrm.p.value=p;
		searchFrm.submit();
		location.href = "examAll?p=" + p;
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
    
     <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(img/bg-img/bg3.jpg);">
        <h3>List Page</h3>
    </div>
    
     <div class="breadcumb-area">    
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            </ol>
        </nav>
    </div>
    
    
    <div class="container section-padding-100"  >
    <h1>Exam List <small>(<i class="glyphicon glyphicon-filter"></i>)</small></h1>
    	<div class="row">
				<div class="classynav">
                    <ul>                                                    
                        <li><a href="/webtest/examination/examAll">Reset</a></li>  
                    </ul>
                </div>
			<div class="col-md-20 col-12">
				<div class="panel panel-primary" >
					<div class="panel-heading">
						<h3 class="panel-title">Exam</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
					<form name="searchFrm">
						<input type="hidden" name="p" value="1">
						<input type="text" name="answer" value="${parm.answer}" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Search Answer" />
					</from>
					</div>
					
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th width="10%">문제번호</th>
								<th width="20%">정답</th>
								<th>문제</th>
								<th width="15%">과목명</th>
								<th width="10%">과목번호</th>
								<th width="10%">삭제</th>
								<th width="10%">수정</th>
							</tr>
						</thead>
						<tbody>		
							<c:forEach items="${list}" var="exam">				
								<tr>
									<td>${exam.test_no}</td>
									<td>${exam.answer}</td>
									<td>${exam.content}</td>
									<td>${exam.subject_name}</td>
									<td>${exam.subject_no}</td>
									<td><button type="button" class="btn btn-outline-primary" onclick="btnDelete(${exam.test_no})">삭제</button></td>
									<td><button type="button" class="btn btn-outline-primary" onclick="btnUpdate(${exam.test_no})">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<p><my:paging paging="${paging}" jsfunc="gopage" /></p>
		</div>
	</div>

</body>
</html>