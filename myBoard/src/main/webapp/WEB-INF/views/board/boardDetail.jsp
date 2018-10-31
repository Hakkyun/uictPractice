<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>
</head>
<body>
	
	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
	
		<table class="table">
			<tr style="background:lightgreen;">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>${b.bno}</td>
				<td>${b.bTitle}</td>
				<td>${b.bWriter}</td>
				<td>${b.bDate}</td>
				<td>${b.bCount}</td>
			</tr>				
		</table>
		<hr>
		
		<p style="height:35vh;">${b.bContent}</p>
		<hr>
		
		<div class="text-right">
			<a class="btn btn-light" href="${pageContext.request.contextPath}/board.do">게시판으로</a>
			<c:if test="${m.mName eq b.bWriter}">
				<button class="btn btn-primary" id="editBtn">글 수정</button>
				<button class="btn btn-danger" id="delBtn">글 삭제</button>			
			</c:if>
		</div>
		
	</div>

    <form id="boardDetail" method="POST">
    	<input type="hidden" id="bNum" name="bNum" value="${b.bno}"/>
    </form>

	<script>
		$('#editBtn').click(function(){
			$('#boardDetail').attr("action","${pageContext.request.contextPath}/editText.do");
			$('#boardDetail').submit();	
		});
		
		$('#delBtn').click(function(){
			var result = confirm('정말 게시물을 삭제하시겠습니까?');
			if(result){
				$('#boardDetail').attr("action","${pageContext.request.contextPath}/delText.do");
				$('#boardDetail').submit();					
			}
		});
		
	</script>

</body>
</html>