<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	UserVO userid = (UserVO) session.getAttribute("SignIn");
%>

<%
	UserVO user = (UserVO) session.getAttribute("SignIn");

String Userid = user.getUserid();
String username = user.getUsername();
String useremail = user.getUseremail();
String userphone = user.getUserphone();
String userobstccode = user.getUserobstccode();
String userparentphone = user.getUserparentphone();
String userbirth = user.getUserbirth();
String useraddress = user.getUseraddress();
Character userdiv = (Character) user.getUserdiv();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myinfo_1</title>
<link rel="stylesheet" href="${path}/resources/css/preference_check.css">
</head>
<body>
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

	<div class="preference_test_wrapper">
		<div class="preference_test_subwrapper">
			<!-- 맨 위에 있는 타이틀 -->
			<h2 class="test_title">직업 선호도 검사</h2>
			<div class="preference_test_area">
				<!-- 진행률 바 -->
				<div class="progress">
					<span id="progress_value">0</span>&nbsp;
					<progress id="progress_bar" value="0" min="0" max="100"></progress>
				</div>

				<!-- 문항 -->
				<form method="post" action="${path}/surveyinsert.do">
					<div class="question_wrapper_0">
						<div class="questions">
							<h2>성별을 입력해주세요.</h2>
						</div>
						<div class="answer">
							<h3>남</h3>
							<input type="radio" name='ans_0_1' id="very_yes" value="1">
							<input type="radio" name='ans_0_1' id="very_no" value="2">
							<h3>여</h3>
						</div>
						<div class="questions">
							<h2>나이(15~29/30~39/40~49/50~59/60~69)</h2>
						</div>
						<div class="answer">
							<h3>15 ~ 29</h3>
							<input type="radio" name='ans_0_2' id="very_yes" value="1">
							<input type="radio" name='ans_0_2' id="yes" value="2"> <input
								type="radio" name='ans_0_2' id="soso" value="3"> <input
								type="radio" name='ans_0_2' id="no" value="4"> <input
								type="radio" name='ans_0_2' id="very_no" value="5">
							<h3>60 ~ 69</h3>
						</div>
						<div class="questions">
							<h2>학력(중졸이하/고졸/대졸이상)</h2>
						</div>
						<div class="answer">
							<h3>중졸이하</h3>
							<input type="radio" name='ans_0_3' id="very_yes" value="1">
							<input type="radio" name='ans_0_3' id="soso" value="2"> <input
								type="radio" name='ans_0_3' id="very_no" value="3">
							<h3>대졸이상</h3>
						</div>
						<div class="questions">
							<h2>장애정도를 입력해주세요.</h2>
						</div>
						<div class="answer">
							<h3>경증</h3>
							<input type="radio" name='ans_0_4' id="very_yes" value="1">
							<input type="radio" name='ans_0_4' id="very_no" value="2">
							<h3>중증</h3>
						</div>
						<div class="move_button">
							<button class="next_1" type="button">다음</button>
						</div>
					</div>
					<div class="question_wrapper">
						<div class="questions">
							<h2>${list.get(4).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_1' id="very_yes" value="1">
							<input type="radio" name='ans_1' id="yes" value="2"> <input
								type="radio" name='ans_1' id="soso" value="3"> <input
								type="radio" name='ans_1' id="no" value="4"> <input
								type="radio" name='ans_1' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(5).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_2' id="very_yes" value="1">
							<input type="radio" name='ans_2' id="yes" value="2"> <input
								type="radio" name='ans_2' id="soso" value="3"> <input
								type="radio" name='ans_2' id="no" value="4"> <input
								type="radio" name='ans_2' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(6).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_3' id="very_yes" value="1">
							<input type="radio" name='ans_3' id="yes" value="2"> <input
								type="radio" name='ans_3' id="soso" value="3"> <input
								type="radio" name='ans_3' id="no" value="4"> <input
								type="radio" name='ans_3' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(7).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_4' id="very_yes" value="1">
							<input type="radio" name='ans_4' id="yes" value="2"> <input
								type="radio" name='ans_4' id="soso" value="3"> <input
								type="radio" name='ans_4' id="no" value="4"> <input
								type="radio" name='ans_4' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(8).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_5' id="very_yes" value="1">
							<input type="radio" name='ans_5' id="yes" value="2"> <input
								type="radio" name='ans_5' id="soso" value="3"> <input
								type="radio" name='ans_5' id="no" value="4"> <input
								type="radio" name='ans_5' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(9).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_6' id="very_yes" value="1">
							<input type="radio" name='ans_6' id="yes" value="2"> <input
								type="radio" name='ans_6' id="soso" value="3"> <input
								type="radio" name='ans_6' id="no" value="4"> <input
								type="radio" name='ans_6' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<!-- 페이지 이동 버튼 -->
						<div class="move_button" type="button">
							<button class="back">이전</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="next_2" type="button">다음</button>
						</div>
					</div>

					<div class="question_wrapper_2">
						<div class="questions">
							<h2>${list.get(10).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_7' id="very_yes" value="1">
							<input type="radio" name='ans_7' id="yes" value="2"> <input
								type="radio" name='ans_7' id="soso" value="3"> <input
								type="radio" name='ans_7' id="no" value="4"> <input
								type="radio" name='ans_7' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(11).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_8' id="very_yes" value="1">
							<input type="radio" name='ans_8' id="yes" value="2"> <input
								type="radio" name='ans_8' id="soso" value="3"> <input
								type="radio" name='ans_8' id="no" value="4"> <input
								type="radio" name='ans_8' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(12).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_9' id="very_yes" value="1">
							<input type="radio" name='ans_9' id="yes" value="2"> <input
								type="radio" name='ans_9' id="soso" value="3"> <input
								type="radio" name='ans_9' id="no" value="4"> <input
								type="radio" name='ans_9' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(13).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_10' id="very_yes" value="1">
							<input type="radio" name='ans_10' id="yes" value="2"> <input
								type="radio" name='ans_10' id="soso" value="3"> <input
								type="radio" name='ans_10' id="no" value="4"> <input
								type="radio" name='ans_10' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(14).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_11' id="very_yes" value="1">
							<input type="radio" name='ans_11' id="yes" value="2"> <input
								type="radio" name='ans_11' id="soso" value="3"> <input
								type="radio" name='ans_11' id="no" value="4"> <input
								type="radio" name='ans_11' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(15).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_12' id="very_yes" value="1">
							<input type="radio" name='ans_12' id="yes" value="2"> <input
								type="radio" name='ans_12' id="soso" value="3"> <input
								type="radio" name='ans_12' id="no" value="4"> <input
								type="radio" name='ans_12' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<div class="questions">
							<h2>${list.get(16).getSurveytext()}</h2>
						</div>
						<div class="answer">
							<h3>예</h3>
							<input type="radio" name='ans_13' id="very_yes" value="1">
							<input type="radio" name='ans_13' id="yes" value="2"> <input
								type="radio" name='ans_13' id="soso" value="3"> <input
								type="radio" name='ans_13' id="no" value="4"> <input
								type="radio" name='ans_13' id="very_no" value="5">
							<h3>아니오</h3>
						</div>
						<!-- 페이지 이동 버튼 -->
						<div class="move_button">
							<button class="back_2" type="button">이전</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="next_3" type="submit">제출</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- <script src="preference_test.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$('.question_wrapper_0').show(); //페이지를 로드할 때 표시할 요소
			$('.question_wrapper').hide(); //페이지를 로드할 때 숨길 요소
			$('.question_wrapper_2').hide(); //페이지를 로드할 때 숨길 요소

			$('.next_1').click(function() {
				$('.question_wrapper_0').hide(); //클릭 시 첫 번째 요소 숨김
				$('.question_wrapper').show(); //클릭 시 두 번째 요소 표시
				$('.question_wrapper_2').hide(); //클릭 시 세 번째 요소 숨김

				$('.next_2').click(function() {
					$('.question_wrapper_0').hide(); //클릭 시 첫 번째 요소 숨김
					$('.question_wrapper').hide(); //클릭 시 두 번째 요소 숨김
					$('.question_wrapper_2').show(); //클릭 시 세 번째 요소 표시
				})
				$('.back').click(function() {
					$('.question_wrapper').hide();
					$('.question_wrapper_0').show();
				})
				$('.back_2').click(function() {
					$('.question_wrapper_2').hide();
					$('.question_wrapper').show();
				})

				return false;
			});
		});

		// 다음 버튼 클릭 시
		document.querySelector(".next_1").addEventListener("click", function() {
			var progressBar = document.getElementById("progress_bar");
			var progressValue = document.getElementById("progress_value");
			var currentValue = parseInt(progressBar.value);
			var minValue = parseInt(progressBar.min);
			var maxValue = parseInt(progressBar.max);

			// progress 값 증가
			progressBar.value = Math.min(currentValue + 34, maxValue);
			progressValue.textContent = progressBar.value;
		});

		document.querySelector(".next_2").addEventListener("click", function() {
			var progressBar = document.getElementById("progress_bar");
			var progressValue = document.getElementById("progress_value");
			var currentValue = parseInt(progressBar.value);
			var minValue = parseInt(progressBar.min);
			var maxValue = parseInt(progressBar.max);

			// progress 값 증가
			progressBar.value = Math.min(currentValue + 34, maxValue);
			progressValue.textContent = progressBar.value;
		});

		document.querySelector(".next_3").addEventListener("click", function() {
			var progressBar = document.getElementById("progress_bar");
			var progressValue = document.getElementById("progress_value");
			var currentValue = parseInt(progressBar.value);
			var minValue = parseInt(progressBar.min);
			var maxValue = parseInt(progressBar.max);

			// progress 값 증가
			progressBar.value = Math.min(currentValue + 34, maxValue);
			progressValue.textContent = progressBar.value;
		});

		// 이전 버튼 클릭 시
		document.querySelector(".back").addEventListener("click", function() {
			var progressBar = document.getElementById("progress_bar");
			var progressValue = document.getElementById("progress_value");
			var currentValue = parseInt(progressBar.value);
			var minValue = parseInt(progressBar.min);
			var maxValue = parseInt(progressBar.max);

			// progress 값 감소
			progressBar.value = Math.max(currentValue - 34, minValue);
			progressValue.textContent = progressBar.value;
		});
	</script>

</body>
</html>