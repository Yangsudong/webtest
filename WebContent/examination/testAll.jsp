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
	$('[data-toggle="tooltip"]').tooltip();
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
<header class="header-area">    
        <div class="clever-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="cleverNav">
                    <!-- Logo -->
                    <a class="nav-brand" href="mainpage.jsp">HOME</a>
                    <!-- Menu -->
                    <div class="classy-menu">
                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="mainpage.jsp">Home</a></li>                              
                                <li><a href="/webtest/examination/testInsert">ExamInsert</a></li> 
                                <li><a href="/webtest/examination/examAll">ExamList</a></li>                              
                            </ul>
                            <!-- Search Button -->
                            <div class="search-area">
                                <form action="#" method="post">
                                    <input type="search" name="search" id="search" placeholder="Search">
                                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <!-- Register / Login -->
                            <div class="register-login-area">
                                <a href="#" class="btn">Register</a>
                                <a href="index-login.html" class="btn active">Login</a>
                            </div>
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
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
			<div class="col-md-20">
				<div class="panel panel-primary">
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
							</tr>
						</thead>
						<tbody>						
							<% 
							ArrayList<ExaminationVO> list = (ArrayList<ExaminationVO>)request.getAttribute("list");
								for(ExaminationVO exam : list) {
							%>
								<tr>
									<td><%=exam.getTest_no()%></td>
									<td><%=exam.getAnswer()%></td>
									<td><%=exam.getContent()%></td>
									<td><%=exam.getSubject_name() %></td>
									<td><%=exam.getSubject_no() %></td>
								</tr>
							<% } %>
							
						</tbody>
					</table>
				</div>
			</div>
					<p><my:paging paging="${paging}" jsfunc="gopage" /></p>
		</div>
	</div>

</body>
</html>