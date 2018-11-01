<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style>
	.forCenter{
		width : 100%;
		padding-left : 41vh;
		/* text-align:center;
		margin:0 auto; */
	}
	/* .bxSlider{
		display:inline-block!important;
	} */
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="row">
			<div class="col-md-3 text-center">
				<a href="${pageContext.request.contextPath}/board.do" class="btn btn-success btn-lg btn-block"><b>게시판</b></a>
			</div>
			<div class="col-md-3 text-center">
				<a href="${pageContext.request.contextPath}/calc.do" class="btn btn-danger btn-lg btn-block"><b>계산기</b></a>
			</div>
			<div class="col-md-3 text-center">
				<a href="/html/ajax.html" class="btn btn-secondary btn-lg btn-block"><b>ajax 연습</b></a>
			</div>
			<div class="col-md-3 text-center">
				<a href="/html/hkMap.html" class="btn btn-primary btn-lg btn-block"><b>지도 api</b></a>
			</div>
		</div>
		<hr><br>
		
		<div class="forCenter">
			<div class="bxSlider">
				<div><img src="/images/coffee1.jpg" title="Funky roots" class="bxImage"></div>
				<div><img src="/images/coffee2.jpg" title="The long and winding road" class="bxImage"></div>
				<div><img src="/images/coffee3.jpg" title="Happy trees" class="bxImage"></div>
			</div>
		</div>
		<hr>
			
	</div>

	<script>
		$(document).ready(function(){
			$('.bxSlider').bxSlider({
				mode : "fade",
			    captions: false,
			    pager: true,
			    slideWidth: 600
			});
		});
	</script>

</body>
</html>