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
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>notice</title>
<link rel="stylesheet" href="${path}/resources/css/resume.css">
<!-- <link rel="stylesheet" href="header.css"> -->
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
	<!-- 이력서 시작 -->  
	<c:if test="${not empty resumeList}">
        <c:forEach items="${resumeList}" var="resume">
            <c:if test="${resume.userid == userid.userid}">

			<div class="resume_wrapper">
				<form action="#" method="get">
					<h1 class="resume_title">이력서</h1>
					<!-- 인적사항 입력페이지 -->
					<table class="resume_content">
						<tr>
							<td class="picture" rowspan="4"><button class="pic_register">사진파일
									등록</button></td>
							<td class="user_name">&nbsp;&nbsp;&nbsp;이름</td>
							<td class="username_input">${resume.username}</td>
							<td class="person_number">&nbsp;생년월일</td>
							<td class="personnumber_input"></td>
						</tr>
						<tr>
							<td class="user_address">&nbsp;&nbsp;&nbsp;주소</td>
							<td class="useraddress_input" colspan="3">></td>
						</tr>
						<tr>
							<td class="user_phone">&nbsp;&nbsp;&nbsp;휴대전화</td>
							<td class="userphone_input" colspan="3" name="userphone"></td>
						</tr>
						<tr>
							<td class="email">&nbsp;&nbsp;&nbsp;이메일</td>
							<td class="email_input" name="useremail">unknown@naver.com</td>
							<td class="disorder_type">&nbsp;장애유형</td>
							<td class="disorder_type_input" name="userobstccode">청각장애</td>
						</tr>
					</table>
					<div>
						<button class="edit_bt">수정</button>
					</div>

					<h2 class="study">학력사항</h2>
					<table class="resume_content_2">
						<tr>
							<td class="time">기간</td>
							<td class="school">학교 및 전공</td>
							<td class="score">학점</td>
							<td class="graduate">졸업여부</td>
						</tr>
						<tr>
							<td class="time_input">2019 ~ 2021</td>
							<td class="school_input">대학교</td>
							<td class="score_input">3.0</td>
							<td class="graduate_input">졸업</td>
						</tr>
						<tr>
							<td class="time_input"></td>
							<td class="school_input"></td>
							<td class="score_input"></td>
							<td class="graduate_input"></td>
						</tr>
						<tr>
							<td class="time_input"></td>
							<td class="school_input"></td>
							<td class="score_input"></td>
							<td class="graduate_input"></td>
						</tr>
					</table>

					<h2 class="career">경력사항</h2>
					<table class="resume_content_3">
						<tr>
							<td class="career_time">기간</td>
							<td class="company">회사명</td>
							<td class="position">직위</td>
							<td class="retire">재직여부</td>
						</tr>
						<tr>
							<td class="career_time_input">2019.03 ~ 2020.02</td>
							<td class="company_input">대학교</td>
							<td class="position_input">주무관</td>
							<td class="retire_input">퇴직</td>
						</tr>
						<tr>
							<td class="career_time_input"></td>
							<td class="company_input"></td>
							<td class="position_input"></td>
							<td class="retire_input"></td>
						</tr>
						<tr>
							<td class="career_time_input"></td>
							<td class="company_input"></td>
							<td class="position_input"></td>
							<td class="retire_input"></td>
						</tr>
					</table>

					<h2 class="hope_list">희망사항</h2>
					<table class="resume_content_4">
						<tr>
							<td class="hope_job">희망직종</td>
							<td class="hope_job_input">&nbsp;&nbsp;&nbsp;건설업</td>
						</tr>
						<tr>
							<td class="hope_pay">희망연봉</td>
							<td class="hope_pay_input">&nbsp;&nbsp;&nbsp;5000만원</td>
						</tr>
						<tr>
							<td class="hope_area">희망근무지역</td>
							<td class="hope_area_input">&nbsp;&nbsp;&nbsp;서울</td>
						</tr>
						<tr>
							<td class="hire_type">고용형태</td>
							<td class="hire_type_input">&nbsp;&nbsp;&nbsp;상용직</td>
						</tr>
					</table>

					<div class="buttons">
						<button class="register" type="submit">등록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="cancle">취소</button>
					</div>
				</form>
	

			</div>
	</c:if>
</c:forEach>	
</c:if>
	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
</body>
</html>