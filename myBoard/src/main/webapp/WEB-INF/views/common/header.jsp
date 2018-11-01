<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
	body{
		background:#edf4fa;
	}
</style>
</head>
<body>
	<div>
		<h2><a href="${pageContext.request.contextPath}/main.do">게시판 연습</a></h2>
	</div>
	<div class="text-right">
		<c:if test="${empty m}">
			<form action="${pageContext.request.contextPath}/login.do" method="post">
				<label for="userId">아이디 : &nbsp;</label><input type="text" id="userId" name="userId" size="20"><br>
				<label for="userPwd">패스워드 : &nbsp;</label><input type="password" id="userPwd" name="userPwd" size="20"><br>
				<button type="submit" class="btn btn-warning">로그인</button>
				<button type="button" class="btn btn-info" id="enrollUser">회원가입</button>
			</form>
		</c:if>
		<c:if test="${!empty m}">
			<div><b>${m.mName}</b>님 환영합니다.</div><br>
			<button onclick="location.href='${pageContext.request.contextPath}/logout.do'" class="btn btn-warning pull-right">로그아웃</button>
		</c:if>
	</div>
	<hr>
	
	<script>
		$(document).ready(function(){
			/* $('#userId').focus(); */
		});
		
		$('#enrollUser').click(function(){
			swal("준비중입니다!");
			/* location.href="${pageContext.request.contextPath}/enrollUser.do"; */
		});
	</script>
	
</body>
</html>