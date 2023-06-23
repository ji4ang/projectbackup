<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>직업검사 결과</title>

<link rel="stylesheet" href="${path}/resources/css/survey.css">
<link rel="stylesheet" href="${path}/resources/css/header.css">

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
	<h1>직업검사 결과</h1>

	<div class="result">
		<p class="result-title">당신에게 적합한 직업은 다음과 같습니다:</p>
		<ul class="job-list">
			<li>IT 정보통신업</li>
			<li>사무직</li>
			<li>서비스업</li>
			<!-- 필요한 만큼 목록을 추가하세요 -->
		</ul>
	</div>

	<!-- 기존 코드를 여기에 추가하세요 -->
<body>
	<div class="container">

		<div class="result">
			<h3>IT 정보통신업:</h3>
			<p>IT 정보통신업은 정보 기술과 통신 기술을 결합하여 제공되는 다양한 서비스와 솔루션을 제공하는 산업입니다.</p>
			<p>이 산업은 컴퓨터와 네트워크 등의 기술을 활용하여 데이터의 전송과 통신을 가능하게 하며, 정보의 저장, 처리,
				전달을 위한 다양한 시스템과 서비스를 개발, 운영, 유지보수합니다.</p>
			<p>추천 직업:</p>
			<span>프로그래머, 빅데이터 분석가, 정보보안전문가</span>
		</div>

		<div class="result">
			<h3>사무직:</h3>
			<p>사무직은 사무 업무를 수행하는 직종을 일컫는 용어로, 조직 내에서 정보 처리, 문서 작성, 기록 보관, 일정
				관리, 회의 조정 등의 업무를 담당합니다.</p>
			<p>사무직은 다양한 조직이나 기업의 업무를 원활하게 진행하기 위해 필요한 역할을 수행하며, 기업의 효율성과 생산성에
				직결됩니다.</p>
			<p>추천직업:</p>
			<span>비서, 경리, 회계사</span>
		</div>
		<div class="result">
			<h3>서비스업:</h3>
			<p>서비스업은 상품의 생산과는 달리 물리적인 제품을 생산하지 않고, 고객에게 다양한 종류의 서비스를 제공하는 경제
				활동을 의미합니다.</p>
			<p>서비스업은 전반적으로 경제에서 매우 중요한 역할을 하며, 개인과 기업 모두가 서비스를 필요로 합니다.</p>
			<p>추천직업:</p>
			<span>바리스타, 텔레마케터, 관광 가이드</span>
		</div>

		<!-- 추가 결과들을 이곳에 추가하십시오 -->

	</div>
</body>
</html>