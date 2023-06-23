<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	String userid = (String) session.getAttribute("userid");
%>
<%@ page import="jisang.poyong.vo.ChatVO"%>
<%
	ChatVO chat;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>chat_page</title>
<link rel="stylesheet" href="${path}/resources/css/ChatPage.css">
</head>
<body>
	<header>
		<!-- 헤더 첫 번째 줄 (시작)-->
		<div class="nav1">
			<div class="nav1_left">
				<a href="#"> <!-- 메인페이지 링크 --> <img src="${path}/resources/img/logo.png" alt="logo">포용취업넷
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
						<c:when test="${not empty userid}">
							<!-- 로그인 세션값이 있는 경우 -->
							<p>
								${chat.chattext} 사용자 아이디:
								<%=userid%></p>
							<a href="<c:url value='/Logout.do'/>" class="LogOutBtn">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- 로그인 세션값이 없는 경우 -->
							<div class="SignUp_nav">
								<a href="<c:url value='/SignIn.do'/>" class="siBtn">로그인</a> <a
									href="<c:url value='/SignUp.do'/>" class="suBtn">회원가입</a>
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
				<a href="#" class="hire">채용정보</a><a href="${path}/chart.do" class="job">취업 분포도</a> <a href="#">직업·진로</a>
				<a href="#">이력서 작성</a>
			</div>

			<div class="nav2_right">
				<a href="<c:url value='/LoadChat.do'/>" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>
	<!-- 쪽지리스트 시작 -->
	<nav class="sidebar">
		<header>
			<h3>쪽지</h3>
		</header>
		<div class="scrollbox">
			<div class="scrollbox-inner">
				<div class="chats_list_wrapper">
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
					<div class="chats">OO소프트</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="chat_wrapper">
		<!-- 채팅창 시작 -->
		<div class="chat_screen">
			<div class="chat_screen_comments">
				<c:forEach var="chat" items="${chatList}">
					<c:choose>
						<c:when test="${chat.senduser eq currentUser.userid}">
							<div class="comment_re_package">
								<div class="comment_re">${chat.chattext}</div>
								<div class="tts">
									<i class="fa-sharp fa-solid fa-volume-high"></i>
								</div>
							</div>
						</c:when>
						<c:otherwise>

							<div class="comment_package">
								<div class="comment">${chat.chattext}</div>
								<div class="re_tts">
									<i class="fa-sharp fa-solid fa-volume-high"></i>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<!-- 입력창 및 버튼 -->
		<div class="chat_bottom">
			<form action="${path}/SendChat.do" method="post" class="chat_form">
				<input type="hidden" name="senduser" id="senduser"
					value="<%=userid%>">
				<textarea class="msg_writebox" name="chattext" id="chattext"></textarea>
				<div class="bt_container">
					<button class="stt_bt" type="button">
						<i class="fa-solid fa-microphone fa-2x"></i>
					</button>
					<button class="tts_bt" type="button">
						<i class="fa-sharp fa-solid fa-volume-high fa-2x"></i>
					</button>
				</div>
				<button class="submit_bt" type="submit" value="전송">전송</button>
			</form>
		</div>
	</div>



	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 	<script>
		$(document).ready(function() {
			// 페이지 로드 시 초기 데이터를 가져오는 함수 호출
			loadChatData();

			// 일정 간격으로 데이터를 업데이트하는 함수 호출
			setInterval(function() {
				loadChatData();
			}, 5000); // 5초마다 업데이트 (원하는 간격으로 설정)

			function loadChatData() {
				$.ajax({
					url : '/ChatPage.do', // 데이터를 가져올 URL
					method : 'GET',
					dataType : 'html',
					success : function(response) {
						// 성공적으로 데이터를 가져온 경우 처리할 로직 작성
						$('.chat_screen_comments').html(response); // 채팅 내용을 갱신할 요소의 클래스를 사용하여 업데이트
					},
					error : function(xhr, status, error) {
						// 데이터를 가져오는 도중 에러가 발생한 경우 처리할 로직 작성
						console.log('Error:', error);
					}
				});
			}
		});
	</script> -->
	<%--  <script src="${path}/resources/js/ChatHeader.js"></script>
	<script src="${path}/resources/js/ChatPage.js"></script> --%>
</body>
</html>