<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='resources/index.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
	// basic.jsp가 실행이 되면(html구조가 완성이 되면) 함수가 실행 되도록
	$(document).ready(function(){
		// boardList()함수 호출		
		boardList();
	}); // 제일 먼저 실행되는 함수
	
	function boardList(){
		// ajax 통신으로 요청 주고받기
		$.ajax({
			url : "${cpath}/board",
			type : "get",
			// data 보내줄 데이터 없음
			dataType : "json",
			// ajax안에서 함수를 호출할 경우엔 반드시 ()를 쓰지 않는다.
			success : callBack,
			error : function(){
				alert("ajax통신 실패");
			}
		}); // ajax끝
	}// boardList 함수 끝

	function callBack(data){
		console.log(data);
		
		var bList = '<table class="table table-hover table-bordered">';
		bList += '<tr>';
		bList += '<td>번호</td>'
		bList += '<td>제목</td>'
		bList += '<td>작성자</td>'
		bList += '<td>작성일</td>'
		bList += '<td>조회수</td>'
		bList += '</tr>';
		
		
		// $.each(데이터, 데이터 처리할 수 있는 함수)
		$.each(data, (index,obj)=>{
			bList += '<tr>';
			bList += '<td>' + obj.idx + '</td>'
			// a태그 누르면 다른 페이지로 이동을 하거나 요청을 보내는게 아니라 자바스크립트 함수가 실행되게
			// javascript: 함수이름
			bList += '<td><a href="javascript:cview('+obj.idx+')">' + obj.title + '</a></td>'
			bList += '<td>' + obj.writer + '</td>'
			bList += '<td>' + obj.indate + '</td>'
			bList += '<td id="count'+obj.idx+'">' + obj.count + '</td>'
			bList += '</tr>';
			
			// content 내용 보여주는 태그
			// 평소에는 display none이었다가 a태그 누르면 block이 될 수 있게끔
			bList += '<tr style="display:none" id="c'+ obj.idx +'">';
			bList += '<td>내용</td>';
			bList += '<td colspan="4">'
			bList += '<textarea id="nc'+obj.idx+'" class="form-control" row="7">'+obj.content+'</textarea><br>';
			// 작성자가 로그인한 사람일 경우에만 수정, 삭제가 가능하도록
			if("${loginMember.memId}" == obj.writer){
			bList += '<button class="btn btn-sm btn-warning" onclick="goUpdate('+ obj.idx +')">수정</button>&nbsp;'
			bList += '<button class="btn btn-sm btn-primary" onclick="goDel('+ obj.idx +')">삭제</button>&nbsp;'
			}else{
			bList += '<button class="btn btn-sm btn-default" onclick="closeFn('+ obj.idx +')">닫기</button>'
			}
			bList += '</td>';
			bList += '</tr>';
			
			
		});//each끝
		
		bList+= '<tr>';
		bList+= '<td colspan="5">';
		bList+= '<button class="btn btn-sm btn-info" onclick="goForm()">글쓰기</button>';
		bList+= '</td>';
		bList+= '</tr>';
		bList += '</table>';
		$("#list").html(bList);
		
		
	}// callBack 함수 끝
	
	function goForm(){
		// 게시글 목록은 없애고
		$('#list').css("display","none");
		// 글쓰기 화면은 보여주기
		$('#wform').css("display", "block");
	}
	
	function insertFn(){
		// form태그에 있는 정보를 가지고 옴(title, content, writer)
		// var title = $("#title").val(); 반복하기 힘들기 때문에
		// .serialize() 통해서 form 태그에 담긴 내용 다 가져올 수 있음
		var Fdata = $("#frm").serialize(); // 직렬화 함수
		console.log(Fdata);
		
		// ajax 통신으로 요청 주고받기
		$.ajax({
			url : "${cpath}/board",
			type : "post",
			data : Fdata,
			//datatype 가져올 데이터 없음
			success : boardList, // DB에 있는 값을 가져올 boardList()함수 실행
			error : function(){
				alert("글쓰기 통신 실패");
			}
		}); // ajax끝
		
		
		// 게시글 등록버튼을 누르면  글쓰기 화면을 없애고, 게시글 목록이 보일 수 있도록
		$("#wform").css("display", "none");
		$('#list').css("display","block");
		
		// reset버튼을 강제로 실행시키기
		$("#reset").trigger("click");
		
	}// insertFn 끝
	
	function cview(idx){
		// id가 c1, c2,... 넘어올것
		// c+idx
		// $('#c'+idx)
		if($('#c'+idx).css("display") == "none"){
			// content 내용 보여줄 때 조회수 +1 늘려주기
			$.ajax({
				url : "${cpath}/updateCount.do/"+idx,
				type : "get",
				// data 보내줄 데이터 없음
				// dataType 없음
				success : function(res){
					// res는 번호, 제목, 내용, 작성자, 작성일, 조회수 다 담고 있음
					console.log(res);
					// res.count
					$('#count'+idx).text(res.count);
				},
				error : function(){
					alert("조회수 올리기 통신 실패");
				}
			}); // 조회수+1 ajax 끝
			
			
			$('#c'+idx).css("display", "table-row");
		}else{
			$('#c'+idx).css("display", "none");
		}
	}
	
	function goDel(idx){
		$.ajax({
			url : "${cpath}/board/"+idx,
			type : "delete",
			// data : {"idx" : idx} --> idx=20 식으로 넘어감
			// dataType 받아올 데이터 없음
			success : boardList,
			error : function(){
				alert("글 삭제 실패..")
			}
		});
	}
	
	function goUpdate(idx){
		// 수정내용을 담은 textarea의 값(value)을 가져오기
		var newContent = $("#nc"+idx).val();
		
		$.ajax({
			url : "${cpath}/board",
			type : "put",
			data : JSON.stringify({"idx":idx, "content":newContent}), // 보내줄 데이터를 json 형식으로 
			contentType : "application/json;charset=utf-8",
			success : boardList,
			error : function(){
				alret("글쓰기 수정 통신 실패")
			}
			
		})
	}// goUpdate함수 끝
	
		function closeFn(idx){
		$("#c"+idx).css("display", "none");
	}
	
	
</script>

<div class="container">
  <h2>Spring MVC03 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    	<%-- jstl태그 이용해서 로그인을 안한 상태라면 로그인 화면,
    		로그인 한 상태라면 000님 환영합니다 + 로그아웃 버튼
    		if - else문 choose - when/otherwise
    		 --%>
    		
    	<c:choose>
    		<c:when test="${empty loginMember}">
						<form class="form-inline" action="${cpath}/Login.do" method="post">
							<div class="form-group">
								<label for="memId">memId:</label> <input type="text"
									class="form-control" id="memId"
									name="memId">
							</div>
							<div class="form-group">
								<label for="memPw">Password:</label> <input type="password"
									class="form-control" id="memPw"
									name="memPw">
							</div>
							<button type="submit" class="btn btn-default">로그인</button>
						</form>
					</c:when>
    		
    		<c:otherwise>
    			<div class="form-group">
    				<span>${loginMember.memName}님 환영합니다.</span>
    				<a href ="${cpath}/Logout.do" class="btn btn-sm btn-default">로그아웃</a>
    			</div>
    		</c:otherwise>
    	</c:choose>
  	  
    게시판</div>
    <div class="panel-body" id="list" style="display:block"></div>
    <div class="panel-body" id="wform"	style="display:none">
    <!-- form태그에서 다른 요청을 보내는게 아니라 틀만 쓰려면 action적지 않아야함 -->
       <form class="form-horizontal" id="frm">
        <div class="form-group">
          <label class="control-label col-sm-2" for="title">제목:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="title" name="title">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="content">내용:</label>
          <div class="col-sm-10">
             <textarea rows="10" class="form-control" id="content" name="content"></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="writer">작성자:</label>
          <div class="col-sm-10">
            <input type="text" readonly="readonly" value="${loginMember.memId}" class="form-control" id="writer" name="writer">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-default" onclick="insertFn()">게시글 등록</button>
            <button type="reset" class="btn btn-warning" id="reset">취소</button>
          </div>
        </div>
      </form>
    </div>
    <div class="panel-footer">멍멍</div>
  </div>
</div>
</body>
</html>