<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	.nonActive{
		display : none;
	}
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<table class="table table-hover">
			<tr style="background:lightgreen;">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr id="${list.bno}" class="eachText nonActive">
					<td>${list.bno}</td>
					<td>${list.bTitle}</td>
					<td>${list.bWriter}</td>
					<td>${list.bDate}</td>
					<td>${list.bCount}</td>
				</tr>				
			</c:forEach>
		</table>
		
		<button class="btn btn-success btn-lg btn-block" id="moreBtn">글 더보기</button>
		<br>
		
		<div class="text-right" style="height:10vh;">
			<a href="${pageContext.request.contextPath}/writing.do" class="btn btn-primary">글쓰기</a>
		</div>
		
	</div>
    <form id="boardDetail" method="POST">
    	<input type="hidden" id="bNum" name="bNum"/>
    </form>

<script>

	$(document).ready(function(){
		$('.eachText:lt("5")').removeClass("nonActive");
		$('#moreBtn').on('click', function(){
			$('.nonActive:lt("5")').removeClass("nonActive");
		});
	});
	
	$('.eachText').on('click', function(){
		$('#bNum').val($(this).attr('id'));
		$('#boardDetail').attr("action","${pageContext.request.contextPath}/boardDetail.do");
		$('#boardDetail').submit();
	}).mouseenter(function(){
		$(this).css("cursor","pointer");
	});
	
</script>

</body>
</html>