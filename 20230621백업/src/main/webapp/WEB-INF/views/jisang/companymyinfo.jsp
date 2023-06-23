<%@page import="jisang.poyong.vo.BusinessVO"%>
<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	UserVO user = (UserVO) session.getAttribute("SignIn");
String businessidx = user.getBusinessidx();
String Userid = user.getUserid();
String username = user.getUsername();
String useremail = user.getUseremail();
String userphone = user.getUserphone();

BusinessVO businessAttribute = (BusinessVO) request.getAttribute("business");
if (businessAttribute == null) {
	businessAttribute = (BusinessVO) session.getAttribute("business");
}
String username2 = businessAttribute.getUserid();
String businessidx2 = businessAttribute.getBusinessidx();
String businessname = businessAttribute.getBusinessname();
String businessboss = businessAttribute.getBusinessboss();
String businessmember = businessAttribute.getBusinessmember();
String businesscode = businessAttribute.getBusinesscode();
String companyaddress = businessAttribute.getCompanyaddress();
%>

<%
	java.util.Calendar calendar = java.util.Calendar.getInstance();
int year = calendar.get(java.util.Calendar.YEAR);
int month = calendar.get(java.util.Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
int day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포용취업넷</title>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/companyMyinfo.css">
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

	<!-- 전체를 감싼 부분 (시작) -->
	<div class="all">

		<div class="myinfo_wrap">
			<!-- 내정보 수정 (시작) -->
			<section>
				<!-- 개인정보 수정 (시작) -->
				<form action="#" method="#" class="personal">
					<div class="personal_info">
						<div class="personal_id">
							<div class="id_title">아이디</div>
							<div class="id_content"><%=Userid%></div>
						</div>

						<div class="personal_pw">
							<div class="pw_title">비밀번호</div>
							<div class="pw_content">******</div>
						</div>

						<div class="personal_email">
							<div class="email_title">이메일</div>
							<div class="email_content"><%=useremail%></div>
						</div>

						<div class="personal_name">
							<div class="name_title">이름</div>
							<div class="name_content"><%=username%></div>
						</div>

						<div class="personal_phone">
							<div class="phone_title">전화번호</div>
							<div class="phone_content"><%=userphone%></div>
						</div>

						<div class="personal_number">
							<div class="number_title">사업자 번호</div>
							<div class="number_content"><%=businessidx%></div>
						</div>
					</div>
					<div class="personal_btn">
						<a href="${path}/Companybusinessedit.do">수정</a>
					</div>
				</form>
				<!-- 개인정보 수정 (끝) -->


				<!-- 기업정보 수정 (시작) -->
				<form action="#" method="#" class="company">
					<div class="company_info">
						<div class="company_name">
							<div class="company_title">회사명</div>
							<div class="company_content"><%=businessname%></div>
						</div>

						<div class="company_boss">
							<div class="boss_title">대표명</div>
							<div class="boss_content"><%=businessboss%></div>
						</div>

						<div class="company_employee">
							<div class="employee_title">직원수</div>
							<div class="employee_content"><%=businessmember%></div>
						</div>

						<div class="company_type">
							<div class="type_title">사업체 직군</div>
							<div class="type_content">
								<%
									if (businesscode.equals("1")) {
								%>
								IT⦁정보통신
								<%
									} else if (businesscode.equals("2")) {
								%>
								제조⦁생산⦁화학업
								<%
									} else if (businesscode.equals("3")) {
								%>
								건설업
								<%
									} else if (businesscode.equals("4")) {
								%>
								미디어⦁광고업
								<%
									} else if (businesscode.equals("5")) {
								%>
								판매⦁유통업
								<%
									} else if (businesscode.equals("6")) {
								%>
								교육업
								<%
									} else if (businesscode.equals("7")) {
								%>
								의료⦁제약업
								<%
									} else if (businesscode.equals("8")) {
								%>
								문화⦁예술⦁디자인업
								<%
									} else if (businesscode.equals("9")) {
								%>
								서비스업
								<%
									} else if (businesscode.equals("10")) {
								%>
								사무직
								<%
									} else {
								%>
								기타
								<%
									}
								%>
							</div>
						</div>

						<div class="company_address">
							<div class="address_title">사업체 주소</div>
							<div class="address_content"><%=companyaddress%></div>
						</div>
					</div>

					<div class="company_btn">
						<a href="${path}/Companybusinessedit.do">수정</a>
					</div>
				</form>
				<!-- 기업정보 수정 (끝) -->
			</section>
			<!-- 내정보 수정 (끝) -->


			<!-- 오른쪽 사이드 바 (시작) -->
			<aside>
				<div class="menu">
					<div class="menu_top">
						<a href="resume.html">이력서 수정</a>
					</div>
					<div class="menu_bottom">
						<a href="service.html">문의·신고 내역</a>
					</div>
				</div>
			</aside>
			<!-- 오른쪽 사이드 바 (끝) -->
		</div>
	</div>


	<div class="hire_summary">
		<div class="hire_wrap">
			<div class="hire_wrap2">
				<!-- 구직활동 요약표 (시작) -->
				<table class="summary_table">
					<tr class="summary">
						<td class="imploy_notice">
							<p class="count">1</p>
							<p class="summary_title">진행중 공고</p>
						</td>
						<td class="notsee_resume">
							<p class="count">1</p>
							<p class="summary_title">미열람 이력서</p>
						</td>
						<td class="applyer">
							<p class="count">1</p>
							<p class="summary_title">지원자</p>
						</td>
						<td class="paper">
							<p class="count">1</p>
							<p class="summary_title">서류/면접중</p>
						</td>
					</tr>
				</table>
				<!-- 구직활동 요약표 (끝) -->
			</div>

			<div class="hire_summary_btn">
				<button class="out">회원탈퇴</button>
			</div>
		</div>
	</div>


	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
	<script src="js/companyEdit.js"></script>
</body>

</html>