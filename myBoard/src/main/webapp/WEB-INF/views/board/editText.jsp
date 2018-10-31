<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 화면</title>
</head>
<body>
	
	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
	
		<form action="${pageContext.request.contextPath}/editComplete.do" method="POST">
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
					<td><input type="text" name="title" value="${b.bTitle}"/></td>
					<td>${b.bWriter}</td>
					<td>${b.bDate}</td>
					<td>${b.bCount}</td>
				</tr>				
			</table>
			<hr>
		
			<input type="hidden" name="bNum" value="${b.bno}"/>
			<p style="height:35vh;"><textarea name="content" cols="155" rows="9">${b.bContent}</textarea></p>
			<hr>
		
			<div class="text-right">
				<button class="btn btn-primary" type="submit">수정완료</button>			
				<button class="btn btn-secondary" type="reset" id="cancle">취소</button>
			</div>
		</form>
		
	</div>

    <form id="boardDetail" method="POST">
    	<input type="hidden" id="bNum" name="bNum" value="${b.bno}"/>
    </form>

	<script>
		$('#cancle').click(function(){
			$('#boardDetail').attr("action","${pageContext.request.contextPath}/boardDetail.do");
			$('#boardDetail').submit();	
		});

	</script>

</body>
</html>