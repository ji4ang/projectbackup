<%@page import="jisang.poyong.vo.NoticeVO"%>
<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	NoticeVO notice = (NoticeVO) request.getAttribute("notice");
UserVO userid = (UserVO) session.getAttribute("SignIn");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포용취업넷</title>

<link rel="stylesheet" href="${path}/resources/css/index.css">
<link rel="stylesheet" href="${path}/resources/css/header.css">
<style>
.bookmark .fa-star:nth-child(1):hover {
	color: var(- -main-color);
}

.bookmark .fa-star:nth-child(1) {
	display: block;
	color: var(- -font-color3);
}

.bookmark .fa-star:nth-child(2) {
	display: none;
	color: var(- -main-color);
}
</style>
</head>

<body>

	<script>
    function NoticeResult(noticeidx) {
        // AJAX를 사용하여 noticeidx 값을 서버로 전송
        console.log(noticeidx);
        $.ajax({
            url: '${path}/NoticeResult.do',
            method: 'GET',
            data: { noticeidx: noticeidx },
            success: function() {
                // 성공적으로 응답을 받은 경우의 처리 로직
                // 페이지 이동을 수행하며 noticeidx 값을 전달
                window.location.href = '${path}/NoticeResult.do?noticeidx=' + noticeidx;
            },
            error: function() {
                // 요청이 실패한 경우의 처리 로직
                alert("연결 실패");
                // ...
            }
        });
    }
</script>

	<script type="text/javascript">
	// ajax 시작
	
	function searchajax(){
	
		const tagWrapDiv1 = document.getElementById('tag_wrap');
		const tagElements1 = tagWrapDiv.querySelectorAll('div[data-label]');
		
		const textValues = Array.from(tagElements1).map(tagElement1 => {
		  let text1 = tagElement1.textContent.trim();
		  text1 = text1.replace(/[×/]/g, ''); // '×'와 '/' 제거
		  return text1;
		});
		
		console.log(textValues);
	
	
		// ajax 통신으로 요청 주고받기
		$.ajax({
			url : "${path}/Filtering",
			type : "post",
			contentType: "application/json;charset=utf-8",
			data : JSON.stringify(textValues),
			dataType : "json",
			// ajax안에서 함수를 호출할 경우엔 반드시 ()를 쓰지 않는다.
			success : function(response){
		        alert("Ajax 성공");
		        $('.announce_list').empty();
				
		        console.log(response);
		        // 코드를 삽입할 위치 선택
		        var targetElement = document.getElementsByClassName('announce_list')[0];
		        
		        for (var i = 0; i < response.length; i++) {
		            var notisesearch = response[i];
		            
		            var liElement = $('<li>');
		            var titleElement = $('<div>').addClass('announce_title').text(notisesearch.companyname);
		            var contentElement = $('<div>').addClass('announce_content').text(notisesearch.noticejob);
		            var bottomElement = $('<div>').addClass('announce_bottom');
		            var dateElement = $('<div>').addClass('announce_date').text(notisesearch.noticeperiod);
		            var bookmarkElement = $('<div>').addClass('bookmark').html('<i class="fa-regular fa-star"></i> <i class="fa-solid fa-star"></i>');
		            
		            bottomElement.append(dateElement, bookmarkElement);
		            liElement.append(titleElement, contentElement, bottomElement);
		            
		            $('.announce_list').append(liElement);
		        }
		        
		    },
			error : function(){
				alert("조건에 맞는 공고글이 존재하지 않습니다.");
			}
		}); // ajax끝
	}// searchajax 함수 끝



	</script>

	<header>
		<!-- 헤더 첫 번째 줄 (시작)-->
		<div class="nav1">
			<div class="nav1_left">
				<a href="${path}/MainPage.do"> <!-- 메인페이지 링크 --> <img
					src="${path}/resources/img/logo.png" alt="logo">포용취업넷
				</a>
			</div>

			<div class="nav1_center">
				<input type="text" class="search">
				<button>
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>

			<div class="nav1_right">
				<div class="link_wrap">
					<!-- 로그인 전에는 "로그인, 회원가입" 버튼만 보이게, 나머지는 숨김 처리 -->
					<c:choose>
						<c:when test="${not empty SignIn}">
							<c:choose>
								<c:when test="${String.valueOf(SignIn.userdiv) eq 'A'}">
									<a href="${path}/UserMyinfo.do" class="myPage">내정보</a>
								</c:when>
								<c:when test="${String.valueOf(SignIn.userdiv) eq 'B'}">
									<a href="${path}/business2.do" class="myPage">내정보</a>
								</c:when>
							</c:choose>
							<a href="${path}/ChatPage.do" class="message">쪽지함</a>
							<a href="${path}/Logout.do" class="LogOutBtn">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- 로그인 세션값이 없는 경우 -->
							<div class="SignUp_nav">
								<a href="${path}/SignIn.do" class="siBtn">로그인</a> <a
									href="${path}/SignUp.do" class="suBtn">회원가입</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 헤더 첫 번째 줄 (끝) -->


		<!-- 헤더 두 번째 줄 (시작) -->
		<div class="nav2">
			<div class="nav2_left">
				<a href="${path}/MainPage.do" class="hire">채용정보</a> <a
					href="${path}/Chart.do" class="job">취업 분포도</a> <a
					href="${path}/preference.do" class="career">직업·진로</a>
				<c:choose>
					<c:when test="${not empty SignIn}">
						<c:choose>
							<c:when test="${String.valueOf(SignIn.userdiv) eq 'A'}">
								<a href="${path}/Resume.do" class="resume">이력서 작성</a>
							</c:when>
							<c:when test="${String.valueOf(SignIn.userdiv) eq 'B'}">
								<a href="${path}/business.do" class="resume">공고글 작성</a>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
			</div>

			<div class="nav2_right">
				<a href="#" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>

	<a href="#top" id="top_btn"> <label> <i
			class="fa-solid fa-chevron-up"></i> <span>TOP</span>
	</label>
	</a>

	<div class="sortation">
		<div class="container">
			<section class="hire_filter_wrap">

				<h3 class="hire_title">상세 검색</h3>
				<!-- 검색 폼 (시작) -->
				<div class="hire_filter">

					<!-- 지역 필터 (시작) -->
					<div class="area_wrap">
						<div class="area_title">지역</div>
						<div class="area_list">
							<div class="area1 tag">
								<label>특별시</label>
							</div>
							<div class="area2 tag">
								<label>광역시</label>
							</div>
							<div class="area3 tag">
								<label>경기도</label>
							</div>
							<div class="area4 tag">
								<label>강원도</label>
							</div>
							<div class="area5 tag">
								<label>충청남도</label>
							</div>
							<div class="area6 tag">
								<label>충청북도</label>
							</div>
							<div class="area7 tag">
								<label>전라남도</label>
							</div>
							<div class="area8 tag">
								<label>전라북도</label>
							</div>
							<div class="area9 tag">
								<label>경상남도</label>
							</div>
							<div class="area10 tag">
								<label>경상북도</label>
							</div>
							<div class="area11 tag">
								<label>제주도</label>
							</div>
						</div>
					</div>
					<!-- 지역 필터 (끝) -->


					<!-- 산업 필터 (시작) -->
					<div class="industry_wrap">
						<div class="industry_title">산업</div>
						<div class="industry_list">
							<div class="industry1 tag">
								<label>IT·정보통신업</label>
							</div>
							<div class="industry2 tag">
								<label>제조·생산 화학업</label>
							</div>
							<div class="industry3 tag">
								<label>건설업</label>
							</div>
							<div class="industry4 tag">
								<label>미디어 광고업</label>
							</div>
							<div class="industry5 tag">
								<label>판매 유통업</label>
							</div>
							<div class="industry6 tag">
								<label>교육업</label>
							</div>
							<div class="industry7 tag">
								<label>의료 제약업</label>
							</div>
							<div class="industry8 tag">
								<label>문화 예술 디자인업</label>
							</div>
							<div class="industry9 tag">
								<label>서비스업</label>
							</div>
							<div class="industry10 tag">
								<label>사무직</label>
							</div>
						</div>
					</div>
					<!-- 산업 필터 (끝) -->


					<!-- 고용형태 필터 (시작) -->
					<div class="emply_wrap">
						<div class="emply_title">고용 형태</div>
						<div class="emply_list">
							<div class="emply1 tag">
								<label>계약직</label>
							</div>
							<div class="emply2 tag">
								<label>상용직</label>
							</div>
							<div class="emply3 tag">
								<label>시간제</label>
							</div>
						</div>
					</div>
					<!-- 고용형태 필터 (끝) -->
				</div>
				<!-- 검색 폼 (끝) -->

				<div class="hire_send">
					<form action="#">
						<div id="tag_wrap"></div>
						<div class="hire_send_btn">
							<button type="reset">
								<i class="fa-solid fa-rotate-left"></i>&nbsp;초기화
							</button>
							<button type="submit" onclick="searchajax()">검색</button>
						</div>
					</form>
				</div>
			</section>

			<!-- 광고 (시작) -->
			<div class="ad">
				<img src="${path}/resources/img/cloud.jpg" alt="스인개 광고">
			</div>
			<!-- 광고 (끝) -->
		</div>
	</div>

	<!-- 기업 공고 (시작) -->
	<!-- 공고 글 클릭 시 모달창 노출 (js 기능) -->
	<section class="announce_wrap">
		<select name="announce_filter" id="announce_filter">
			<option value="asc">등록일순</option>
			<option value="desc">마감일순</option>
		</select>
		<!-- 공고 내용은 DB..에 임의로 넣고 출력하세요 -->
		<c:choose>
			<c:when test="${not empty SignIn}">
				<ul class="announce_list">
					<c:forEach var="notice" items="${notices}">
						<li onclick="NoticeResult(${notice.noticeidx})">
							<div class="announce_title">${notice.companyname}</div>
							<div class="announce_content">${notice.noticejob}</div>
							<div class="announce_bottom">
								<div class="announce_date">${notice.noticeregdate} ~ ${notice.noticeperiod}</div>
								<div class="bookmark">
									<i class="fa-regular fa-star"></i> <i class="fa-solid fa-star"></i>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="announce_list">
					<c:forEach var="notice" items="${notices}">
						<li>
							<div class="announce_title">${notice.companyname}</div>
							<div class="announce_content">${notice.noticejob}</div>
							<div class="announce_bottom">
								<div class="announce_date">${notice.noticeregdate}~${notice.noticeperiod}</div>
								<div class="bookmark">
									<i class="fa-regular fa-star"></i> <i class="fa-solid fa-star"></i>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:otherwise>
		</c:choose>
	</section>
	<!-- 기업 공고 (끝) -->


	<!-- footer (시작) -->
	<footer>
		<div class="footer">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>
		<div class="copyright">copyright &copy; 2023 포용취업넷 All rights
			reserved</div>
	</footer>
	<!-- footer (끝) -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
	<script src="${path}/resources/js/index.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>

</html>