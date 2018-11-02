// 게시판 리스트 불러오기
function getList(){	
	$('#getList').css("display", "none");
	$('#hideList').css("display", "block");
	
	$.ajax({
		url : '/ajaxBoard.do',
		contentType : "application/json; charset=utf-8",
		success : function(data){
			$.each(data, function(key, value){
				$('#boardArea').append(
					`<tr class="eachText", id="`+value.bno+`">
						<td class="bno">`+value.bno+`</td>
						<td class="title">`+value.bTitle+`</td>
						<td class="writer">`+value.bWriter+`</td>
						<td class="date">`+value.bDate+`</td>
						<td class="count">`+value.bCount+`&nbsp;&nbsp;&nbsp;<button class="deleteText">삭제</button></td>
					</tr>`
				);
			});
			detail();
			deleteText();
		}, error : function(error, msg){
			console.log(error+' : '+msg);
		}
	});
}

// 게시글 삭제
function deleteText(){
	$('.deleteText').on('click', function(){
		var result = confirm("정말 이 게시물을 삭제하시겠습니까?");
		var bNum = $(this).parent().parent().attr('id');
		event.stopPropagation();	// 상위 이벤트까지 활성화 막아줌
		if(result){
			$.ajax({
				url : '/ajaxDelete.do',
				contentType : "application/json; charset=utf-8",
				data : {bNum : bNum},
				success : function(data){
					alert("삭제 완료!");
					$('#boardArea').empty();		
					$.each(data, function(key, value){
						$('#boardArea').append(
							`<tr class="eachText", id="`+value.bno+`">
								<td class="bno">`+value.bno+`</td>
								<td class="title">`+value.bTitle+`</td>
								<td class="writer">`+value.bWriter+`</td>
								<td class="date">`+value.bDate+`</td>
								<td class="count">`+value.bCount+`&nbsp;&nbsp;&nbsp;<button class="deleteText">삭제</button></td>
							</tr>`
						);
					});
					detail();			
					deleteText();
				}, error : function(error, msg){
					alert("삭제 실패!");
					console.log(error+' : '+msg);
				}
			});
		}
	});
}

// 게시글 상세보기
function detail(){
//	이벤트 동작 시점 확인 중요!!!!
//	$(document).on("click", '.eachText', function(){
	$('.eachText').on('click', function(){
		$('#detailArea').empty();
		var bNum = $(this).attr('id');
		
		$.ajax({
			url : '/ajaxDetail.do',
			contentType : "application/json; charset=utf-8",
			data : {bNum : bNum},
			success : function(data){
				$('#detailArea').append(
					`<div>`+data.bTitle+`</div>
					<div>`+data.bWriter+`</div>
					<div>`+data.bDate+`</div><hr>
					<div>`+data.bContent+`</div>`
				);
				$('#'+bNum).children('.count').html(data.bCount+'&nbsp;&nbsp;&nbsp;<button class="deleteText">삭제</button>');
				deleteText();
			}, error : function(error, msg){
				console.log(error+' : '+msg);
			}
		});
	}).mouseenter(function(){
		$(this).css("cursor","pointer");
	});
}

// 게시글 등록하기
function enrollText(){
	var title = $('#title').val();
	var writer = $('#writer').val();
	var content = $('#content').val();
	
	if(title == ''){
		alert('제목을 입력하세요!');
		return;
	} else if(writer == ''){
		alert('작성자를 입력하세요!');
		return;
	} else if(content == ''){
		alert('내용을 입력하세요!');
		return;
	}
	
	$('#title').val('');
	$('#writer').val('');
	$('#content').val('');
	
	$.ajax({
		url : '/ajaxEnroll.do',
		contentType : "application/json; charset=utf-8",
		data : {title:title, writer:writer, content:content},
		success : function(data){
			alert('글 등록 완료!!!');
			$('#boardArea').empty();		
			$.each(data, function(key, value){
				$('#boardArea').append(
					`<tr class="eachText", id="`+value.bno+`">
						<td class="bno">`+value.bno+`</td>
						<td class="title">`+value.bTitle+`</td>
						<td class="writer">`+value.bWriter+`</td>
						<td class="date">`+value.bDate+`</td>
						<td class="count">`+value.bCount+`&nbsp;&nbsp;&nbsp;<button class="deleteText">삭제</button></td>
					</tr>`
				);
			});
			detail();	
			deleteText();
		}, error : function(error, msg){
			alert('글 등록 실패!!!');
			console.log(error+' : '+msg);
		}
	});
}

// 게시글 숨기기
function hideList(){
	$('#getList').css("display", "block");
	$('#hideList').css("display", "none");
	
	$('#boardArea').empty();
}



