
// 그리기 세팅
var pos = {
	drawable: false,
	x: -1,
	y: -1,
	color: 'black'
};
var canvas, ctx;

$(document).ready(function(){
	setStarter();
	imageInput();
});

function setStarter(){
	canvas = document.getElementById("canvas");
	ctx = canvas.getContext("2d");
	
	canvas.addEventListener("mousedown", listener);
	canvas.addEventListener("mousemove", listener);
	canvas.addEventListener("mouseup", listener);
	canvas.addEventListener("mouseout", listener);	
	
	selectColor();
}

// 선 색 선택하기
function selectColor(){
	$('.selectColor').click(function(){
		pos.color = $(this).attr('id');	
	});	
}

// 각 마우스 이벤트 정의
function listener(event){
	switch(event.type){
		case "mousedown" : initDraw(event); break;
		case "mousemove" : 
			if(pos.drawable){
				draw(event);					
			}  
			break;
		case "mousedown" :  
		case "mouseup" : finishDraw(event); break;
	}
}

// 그리기 시작 이벤트
function initDraw(event){
	ctx.beginPath();
	pos.drawable = true;
	var coors = getPosition(event);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.moveTo(pos.X, pos.Y);
}

// 그리는 이벤트()
function draw(event){
	var coors = getPosition(event);
	ctx.lineTo(coors.X, coors.Y);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.strokeStyle = pos.color;
	ctx.stroke();
}

// 그리기 끝 이벤트
function finishDraw(){
	pos.drawable = false;
	pos.X = -1;
	pos.Y = -1;
}

// 마우스 위치 구하는 이벤트
function getPosition(event){
	var x = event.pageX - canvas.offsetLeft;
	var y = event.pageY - canvas.offsetTop;
	return {X : x, Y : y};
}


// 리셋 버튼
function resetBtn(){
	$('.canvasArea').empty();
	$('.canvasArea').append(
		`<canvas id="canvas" width="500" height="500" style="border:1px solid black;"></canvas>`
	);
	setStarter();
	imageInput();
}

function imageInput(){
	var file = $('#imageInput')[0];

	file.onchange = function(){
		var fileList = file.files;

	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList[0]); 	// 올라온 파일을 읽는다

	    reader.onload = function(e){
	    	var img = new Image();
	    	img.src = e.target.result;		// base64로 이미지 경로 넣어주는 부분	    	
	    	img.onload = function(){
	    		ctx.drawImage(img, 0 , 0 , 500, 500);
	    	};
	    };
	};
}


