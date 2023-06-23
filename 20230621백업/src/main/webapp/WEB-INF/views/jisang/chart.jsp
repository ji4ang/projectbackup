<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%
	UserVO user = (UserVO) session.getAttribute("SignIn");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포용취업넷</title>

<link rel="stylesheet" href="${path}/resources/css/chart.css">
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


	<!-- 왼쪽 사이드 바 (시작) -->
	<aside>
		<nav class="sidebar">
			<h3>장애 유형</h3>
			<ul class="sidebar_list">
				<li>지체장애</li>
				<li>뇌병변장애</li>
				<li>시각장애</li>
				<li>청각장애</li>
				<li>언어장애</li>
				<li>지적장애</li>
				<li>자폐성장애</li>
				<li>정신장애</li>
				<li>신장장애</li>
				<li>심장장애</li>
				<li>호흡기장애</li>
				<li>간장애</li>
				<li>안면장애</li>
				<li>장루/요루장애</li>
				<li>뇌전증장애</li>
			</ul>
		</nav>
	</aside>
	<!-- 왼쪽 사이드 바 (끝) -->


	<!-- 차트 출력 부분 (시작) -->
	<section class="chart">
		<div class="chart_wrap">

			<!-- 지체 장애 차트 (시작) -->
			<form action="#" id="chart1">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart1"></canvas>
				</div>
			</form>
			<!-- 지체 장애 차트 (끝) -->


			<!-- 뇌변병 장애 차트 (시작) -->
			<form action="#" id="chart2">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart2"></canvas>
				</div>
			</form>
			<!-- 뇌변병 장애 차트 (끝) -->


			<!-- 시각 장애 차트 (시작) -->
			<form action="#" id="chart3">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart3"></canvas>
				</div>
			</form>
			<!-- 시각 장애 차트 (끝) -->


			<!-- 청각 장애 차트 (시작) -->
			<form action="#" id="chart4">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart4"></canvas>
				</div>
			</form>
			<!-- 청각 장애 차트 (끝) -->


			<!-- 언어 장애 차트 (시작) -->
			<form action="#" id="chart5">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart5"></canvas>
				</div>
			</form>
			<!-- 언어 장애 차트 (끝) -->


			<!-- 지적 장애 차트 (시작) -->
			<form action="#" id="chart6">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart6"></canvas>
				</div>
			</form>
			<!-- 지적 장애 차트 (끝) -->


			<!-- 자폐성 장애 차트 (시작) -->
			<form action="#" id="chart7">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart7"></canvas>
				</div>
			</form>
			<!-- 자폐성 장애 차트 (끝) -->


			<!-- 정신 장애 차트 (시작) -->
			<form action="#" id="chart8">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart8"></canvas>
				</div>
			</form>
			<!-- 정신 장애 차트 (끝) -->


			<!-- 신장 장애 차트 (시작) -->
			<form action="#" id="chart9">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart9"></canvas>
				</div>
			</form>
			<!-- 신장 장애 차트 (끝) -->


			<!-- 심장 장애 차트 (시작) -->
			<form action="#" id="chart10">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart10"></canvas>
				</div>
			</form>
			<!-- 심장 장애 차트 (끝) -->


			<!-- 호흡기 장애 차트 (시작) -->
			<form action="#" id="chart11">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart11"></canvas>
				</div>
			</form>
			<!-- 호흡기 장애 차트 (끝) -->


			<!-- 간 장애 차트 (시작) -->
			<form action="#" id="chart12">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart12"></canvas>
				</div>
			</form>
			<!-- 간 장애 차트 (끝) -->


			<!-- 안면 장애 차트 (시작) -->
			<form action="#" id="chart13">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart13"></canvas>
				</div>
			</form>
			<!-- 안면 장애 차트 (끝) -->


			<!-- 장루/요루 장애 차트 (시작) -->
			<form action="#" id="chart14">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart14"></canvas>
				</div>
			</form>
			<!-- 장애/요루 장애 차트 (끝) -->


			<!-- 뇌전증 장애 차트 (시작) -->
			<form action="#" id="chart15">
				<div style="width: 1000px; height: 440px;">
					<canvas id="myChart15"></canvas>
				</div>
			</form>
			<!-- 뇌전증 장애 차트 (끝) -->
		</div>

		<div id="source">* 출처 : 한국장애인고용공단 (2022년 장애인 경제활동실태조사)</div>
	</section>
	<!-- 차트 출력 부분 (끝) -->

	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${path}/resources/js/chart.js"></script>
	<script src="${path}/resources/js/chartForm.js"></script>
</body>
</html>