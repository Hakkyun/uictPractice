<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style>
	.tc{
		text-align : center;
	}
	.calcBtn{
		height : 8vh !important;
		font-size : 20pt !important; 
		border : 1px solid black !important;
		font-size:30px !important;
		line-height: 10px !important;
		background : gray;
		/* color : white; */
	}
	.numBtn{
		height : 8vh !important;
		font-size : 20pt !important; 
		border : 1px solid black !important;
		font-size:20px !important;
		line-height: 15px !important;	
	}
	#nowData{
		font-size : 30pt;
		font-weight: bolder;
	}
</style>
</head>
<body>
	
	<div class="container">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 rounded" style="border:1px solid black; background:lightblue; height:67vh; padding-left: 2%; padding-right : 2%;">
				<div class="rounded mt-3 text-right" style="background:white; height:15vh;">
					<div class="mr-2 mt-3 pt-1" id="getData">0</div>
					<div class="mr-2" id="nowData">0</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn arith">+</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn arith">-</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn arith">*</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn arith">/</button></div>
				</div>                                         
				<div class="row mt-4">                         
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">1</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">2</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">3</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn">&larr;</button></div>
				</div>				                           
				<div class="row mt-4">                         
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">4</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">5</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">6</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn" id="resetBtn">C</button></div>
				</div>                   
				<div class="row mt-4">   
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">7</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">8</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block numBtn">9</button></div>
					<div class="col-md-3 tc"><button class="btn btn-block calcBtn" id="result" style="background:black !important; color:white !important;">=</button></div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		
	</div>
	
	<script>
		var numArray = [];
		var ariArray = [];
		var flag = false;
		
		// 키보드 리스너
		window.onkeydown = function(){
			if(event.keyCode == 96){
				numClick('0');
			} else if(event.keyCode == 97){
				numClick('1');
			} else if(event.keyCode == 98){
				numClick('2');
			} else if(event.keyCode == 99){
				numClick('3');
			} else if(event.keyCode == 100){
				numClick('4');
			} else if(event.keyCode == 101){
				numClick('5');
			} else if(event.keyCode == 102){
				numClick('6');
			} else if(event.keyCode == 103){
				numClick('7');
			} else if(event.keyCode == 104){
				numClick('8');
			} else if(event.keyCode == 105){
				numClick('9');
			} else if(event.keyCode == 107){
				ariClick('+');
			} else if(event.keyCode == 109){
				ariClick('-');
			} else if(event.keyCode == 106){
				ariClick('*');
			} else if(event.keyCode == 111){
				ariClick('/');
			} else if(event.keyCode == 13){
				result();
			}
		}	
		
		// 결과 계산하는 기능 ('=')
		function result(){
			var nowNum = Number($('#nowData').text());
			
			if(numArray.length != 0) {
				var re = 0;
				for(var i = 0; i<numArray.length; i++){
					re = re+Number(numArray[i])+ariArray[i];
				}
				re = re+nowNum;
				$('#nowData').text(eval(re));
			}
			
			$('#getData').text(0);
			numArray = [];
 			ariArray = [];
 			
 			flag = true;
		}
		
		// 숫자 눌렀을 때 기능
		function numClick(keyNum){
			if(flag){
				$('#nowData').text(0);
				flag = false;
			}
			var nowNum = Number($('#nowData').text());
			
			if(nowNum == 0) $('#nowData').text(keyNum);		
			else $('#nowData').text(nowNum + keyNum);
		}
		
		// 사칙연산 눌렀을 때 기능
		function ariClick(keyAri){
			var arith = keyAri;
			var nowNum = Number($('#nowData').text());
			var getNum = Number($('#getData').text());
			
			ariArray.push(arith)
			numArray.push(nowNum);
			
			if(getNum == 0) $('#getData').text($('#nowData').text() +' '+arith+' ');
			else $('#getData').text($('#getData').text() + $('#nowData').text() +' '+arith+' ');
			$('#nowData').text(0);
		};
		
		$('#result').click(function(){
			result();
		});
		
		$('.numBtn').on('click', function(){
			if(flag){
				$('#nowData').text(0);
				flag = false;
			}
			var nowNum = Number($('#nowData').text());
			
			if(nowNum == 0){
				$('#nowData').text($(this).html());		
			} else {
				$('#nowData').text(nowNum + $(this).html());
			}
		});
		
		$('.arith').click(function(){
			var arith = $(this).html();
			var nowNum = Number($('#nowData').text());
			var getNum = Number($('#getData').text());
			
			ariArray.push(arith)
			numArray.push(nowNum);
			
			if(getNum == 0) $('#getData').text($('#nowData').text() +' '+arith+' ');
			else $('#getData').text($('#getData').text() + $('#nowData').text() +' '+arith+' ');
			$('#nowData').text(0);
		});
		
		$('#resetBtn').click(function(){
			$('#getData').text(0);
			$('#nowData').text(0);
			numArray = [];
			ariArray = [];
		});
		
	</script>
	
</body>
</html>