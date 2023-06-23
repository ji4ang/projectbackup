<%@page import="org.springframework.ui.Model"%>
<%@page import="jisang.poyong.vo.NoticeVO"%>
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
String Userid = user.getUserid();
String username = user.getUsername();
String useremail = user.getUseremail();
String userphone = user.getUserphone();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>notice</title>
<link rel="stylesheet" href="${path}/resources/css/notice_complete.css">
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
	<!-- 채용공고 시작 -->
	<div class="notice_wrapper">
		<form action="#" method="get">
			<h1 class="notice_title">채용공고</h1>
			<!-- 회사정보 입력페이지 -->
			<c:forEach var="notice" items="${noticeList}">
				<table class="notice_content">
					<tr>
						<td class="logo" rowspan="4"><button class="logo_register">로고
								등록</button></td>
						<td class="businessname">&nbsp;&nbsp;&nbsp;&nbsp;회사명</td>
						<td class="businessname_input">${notice.companyname}</td>
						<td class="business_idx">&nbsp;공고번호</td>
						<td class="business_idx_input" name="businessidx">${notice.noticeidx}</td>
					</tr>

					<tr>
						<td class="business_boss">&nbsp;&nbsp;&nbsp;&nbsp;대표자명</td>
						<td class="business_boss_input">${notice.businessboss}</td>
						<td class="business_number">&nbsp;총인원</td>
						<td class="business_number_input">${notice.businessmember}</td>
					</tr>
					<tr>
						<td class="businesscategory">&nbsp;&nbsp;&nbsp;&nbsp;사업체 직군</td>
						<td class="businesscategory_input" colspan="3">
							${notice.businesscode == "1" ? "IT⦁정보통신" :
    notice.businesscode == "2" ? "제조⦁생산⦁화학업" :
    notice.businesscode == "3" ? "건설업" :
    notice.businesscode == "4" ? "미디어⦁광고업" :
    notice.businesscode == "5" ? "판매⦁유통업" :
    notice.businesscode == "6" ? "교육업" :
    notice.businesscode == "7" ? "의료⦁제약업" :
    notice.businesscode == "8" ? "문화⦁예술⦁디자인업" :
    notice.businesscode == "9" ? "서비스업" :
    notice.businesscode == "10" ? "사무직" :
    "기타"}
						</td>
					</tr>
					<tr>
						<td class="businessaddress">&nbsp;&nbsp;&nbsp;&nbsp;사업장 주소</td>
						<td class="businessaddress_input" colspan="3">${notice.companyaddress}</td>
					</tr>
				</table>

				<h2 class="hire_information">고용정보</h2>
				<table class="notice_content_2">
					<tr>
						<td class="hirecategory">모집직종</td>
						<td class="hiretype">고용형태</td>
						<td class="requirementcareer">요구경력</td>
						<td class="requirementedu">요구학력</td>
						<td class="salarytype">임금형태</td>
						<td class="salary">임금</td>
					</tr>
					<tr>
						<td class="hirecategory_input"><c:choose>
								<c:when test="${notice.noticejobcode eq '1'}">
      IT⦁정보통신
    </c:when>
								<c:when test="${notice.noticejobcode eq '2'}">
      제조⦁생산⦁화학업
    </c:when>
								<c:when test="${notice.noticejobcode eq '3'}">
      건설업
    </c:when>
								<c:when test="${notice.noticejobcode eq '4'}">
      미디어⦁광고업
    </c:when>
								<c:when test="${notice.noticejobcode eq '5'}">
      판매⦁유통업
    </c:when>
								<c:when test="${notice.noticejobcode eq '6'}">
      교육업
    </c:when>
								<c:when test="${notice.noticejobcode eq '7'}">
      의료⦁제약업
    </c:when>
								<c:when test="${notice.noticejobcode eq '8'}">
      문화⦁예술⦁디자인업
    </c:when>
								<c:when test="${notice.noticejobcode eq '9'}">
      서비스업
    </c:when>
								<c:when test="${notice.noticejobcode eq '10'}">
      사무직
    </c:when>
								<c:otherwise>
      기타
    </c:otherwise>
							</c:choose></td>
						<td class="hiretype_input">${notice.noticeemp}</td>
						<td class="requirementcareer_input">${notice.noticejoinmode }</td>
						<td class="requirementedu_input">${notice.noticeedu}</td>
						<td class="salarytype_input">${notice.noticewagemode}</td>
						<td class="salary_input">${notice.noticewage}</td>
					</tr>
				</table>

				<h2 class="apply_information">채용공고 정보</h2>
				<table class="notice_content_3" border="1" cellspacing="0">
					<tr>
						<td class="notice_regdate">공고글 등록일</td>
						<td class="notice_period">공고글 마감일</td>
					</tr>
					<tr>
						<td class="noticeregdate_input" name="noticeregdate">${notice.noticeregdate}</td>
						<td class="noticeperiod_input" name="noticeperiod">${notice.noticeperiod}</td>
					</tr>
				</table>
			</c:forEach>
			<div class="buttons">
				<button class="apply" type="submit">즉시지원</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="chat" type="button">쪽지보내기</button>
			</div>
		</form>
	</div>

	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>

</body>
</html>