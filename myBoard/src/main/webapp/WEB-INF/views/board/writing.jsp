<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
</head>
<body>

	<c:set var="date" value="<%= new java.util.Date() %>"/>

	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 text-center">
				<form action="${pageContext.request.contextPath}/enrollBoard.do" method="POST">
					<label for="title">제목 : &nbsp;</label><input type="text" id="title" name="title">&nbsp;&nbsp;
					<label for="writer">작성자 : &nbsp;</label>${m.mName} &nbsp;&nbsp;
					작성일 : &nbsp; <fmt:formatDate value="${date}" type="both" pattern="yyyy-MM-dd"/><hr>&nbsp;&nbsp;
					<textarea id="content" name="content" rows="10" cols="90" style="resize:none;"></textarea>
		            <div class="text-center mt-2">
        		       <button type="submit" class="btn btn-primary">등록</button>&nbsp;
		               <a class="btn btn-secondary" href="${pageContext.request.contextPath}/board.do">취소</a>
            		</div>				
 				</form>
			</div>
			<div class="col-md-2"></div>
		</div>			
	</div>

</body>
</html>