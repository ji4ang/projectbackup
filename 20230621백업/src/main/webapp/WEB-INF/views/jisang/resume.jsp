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
	<div class="resume_wrapper">
		<form action="${path}/resume.do" method="post">
			<h1 class="resume_title">이력서</h1>
			<!-- 인적사항 입력페이지 -->
			<input type="hidden" value="<%=Userid%>" name="userid"> 
			<input
				type="hidden" value="<%=username%>" name="username"> <input
				type="hidden" value="<%=useraddress%>" name="useraddress"> <input
				type="hidden" value="<%=useremail%>" name="useremail"> <input
				type="hidden" value="<%=userobstccode%>" name="userobstccode">
			<input type="hidden" value="<%=userphone%>" name="userphone">
			<input type="hidden" value="<%=userbirth%>" name="userbirth">

			<table class="resume_content" border="1" cellspacing="0">
				<tr>
					<td class="picture" rowspan="4"><button class="pic_register">사진파일
							등록</button></td>
					<td class="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</td>
					<td class="name_input"><%=username%></td>
					<td class="person_number">&nbsp;생년월일</td>
					<td class="person_number_input"><%=userbirth%></td>
				</tr>
				<tr>
					<td class="address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소</td>
					<td class="address_input" colspan="3"><%=useraddress%></td>
				</tr>
				<tr>
					<td class="phone_number">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대전화</td>
					<td class="phone_number_input" colspan="3"><%=userphone%></td>
				</tr>
				<tr>
					<td class="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
					<td class="email_input"><%=useremail%></td>
					<td class="disorder_type">&nbsp;장애유형</td>
					<td class="disorder_type_input">
						<%
							switch (userobstccode) {
						case "0":
							out.print("해당 없음");
							break;
						case "1":
							out.print("지체장애");
							break;
						case "2":
							out.print("뇌병변장애");
							break;
						case "3":
							out.print("시각장애");
							break;
						case "4":
							out.print("청각장애");
							break;
						case "5":
							out.print("언어장애");
							break;
						case "6":
							out.print("지적장애");
							break;
						case "7":
							out.print("자폐성장애");
							break;
						case "8":
							out.print("정신장애");
							break;
						case "9":
							out.print("신장장애");
							break;
						case "10":
							out.print("심장장애");
							break;
						case "11":
							out.print("호흡기장애");
							break;
						case "12":
							out.print("간장애");
							break;
						case "13":
							out.print("안면장애");
							break;
						case "14":
							out.print("장루/요루장애");
							break;
						case "15":
							out.print("뇌전증장애");
							break;
						default:
							out.print("");
							break;
						}
						%>
					</td>
				</tr>
			</table>


			<h2 class="study">학력사항</h2>
			<table class="resume_content_2" border="1" cellspacing="0">
				<tr>
					<td class="time">기간</td>
					<td class="school">학교 및 전공</td>
					<td class="score">학점</td>
					<td class="graduate">졸업여부</td>
				</tr>
				<tr>
					<td class="time_input"><input class="timebox" type="text"
						name="edustart1"> ~ <input class="timebox" type="text"
						name="eduend1"></td>
					<td class="school_input"><input class="schoolbox" type="text"
						name="schoolname1"> <input class="schoolbox" type="text"
						name="major1"></td>
					<td class="score_input"><input class="scorebox" type="text"
						name="grade1"></td>
					<td class="graduate_input"><select name="graduated1"
						class="graduate_yn">
							<option value=""></option>
							<option value="졸업">졸업</option>
							<option value="미졸업">미졸업</option>
					</select></td>
				</tr>
				<tr>
					<td class="time_input"><input class="timebox" type="text"
						name="edustart2"> ~ <input class="timebox" type="text"
						name="eduend2"></td>
					<td class="school_input"><input class="schoolbox" type="text"
						name="schoolname2"><input class="schoolbox" type="text"
						name="major2"></td>
					<td class="score_input"><input class="scorebox" type="text"
						name="grade2"></td>
					<td class="graduate_input"><select name="graduated2"
						class="graduate_yn">
							<option value=""></option>
							<option value="졸업">졸업</option>
							<option value="미졸업">미졸업</option>
					</select></td>
				</tr>
				<tr>
					<td class="time_input"><input class="timebox" type="text"
						name="edustart3"> ~ <input class="timebox" type="text"
						name="eduend3"></td>
					<td class="school_input"><input class="schoolbox" type="text"
						name="schoolname3"><input class="schoolbox" type="text"
						name="major3"></td>
					<td class="score_input"><input class="scorebox" type="text"
						name="grade3"></td>
					<td class="graduate_input"><select name="graduated3"
						class="graduate_yn">
							<option value=""></option>
							<option value="졸업">졸업</option>
							<option value="미졸업">미졸업</option>
					</select></td>
				</tr>
			</table>

			<h2 class="career">경력사항</h2>
			<table class="resume_content_3" border="1" cellspacing="0">
				<tr>
					<td class="career_time">기간</td>
					<td class="company">회사명</td>
					<td class="position">직위</td>
					<td class="retire">재직여부</td>
				</tr>
				<tr>
					<td class="career_time_input"><input class="timebox"
						type="text" name="carrerstart1"> ~ <input class="timebox"
						type="text" name="carrerend1"></td>
					<td class="company_input"><input class="companybox"
						type="text" name="companyname1"></td>
					<td class="position_input"><input class="positionbox"
						type="text" name="position1"></td>
					<td class="retire_input"><select class="retirebox"
						name="employment1">
							<option value=""></option>
							<option value="퇴직">퇴직</option>
							<option value="재직">재직</option>
					</select></td>
				</tr>
				<tr>
					<td class="career_time_input"><input class="timebox"
						type="text" name ="carrerstart2"> ~ <input name = "carrerend2" class="timebox" type="text">
					</td>
					<td class="company_input"><input name ="companyname2"class="companybox"
						type="text"></td>
					<td class="position_input"><input class="positionbox"
						type="text" name="position2"></td>
					<td class="retire_input"><select class="retirebox" name="employment2">
							<option value=""></option>
							<option value="퇴직">퇴직</option>
							<option value="재직">재직</option>
					</select></td>
				</tr>
				<tr>
					<td class="career_time_input"><input class="timebox"
						type="text" name="carrerstart3"> ~ <input class="timebox"
						type="text" name="carrerend3"></td>
					<td class="company_input"><input class="companybox"
						type="text" name="companyname3"></td>
					<td class="position_input"><input class="positionbox"
						type="text" name="position3"></td>
					<td class="retire_input"><select class="retirebox"
						name="employment3">
							<option value=""></option>
							<option value="퇴직">퇴직</option>
							<option value="재직">재직</option>
					</select></td>
				</tr>
			</table>

			<h2 class="hope_list">희망사항</h2>
			<table class="resume_content_4" border="1" cellspacing="0">
				<tr>
					<td class="hope_job">희망직종</td>
					<td class="hope_job_input"><select name="jobcode" class="jikjong">
							<option value=""></option>
							<option value="1">IT⦁정보통신</option>
							<option value="2">제조⦁생산⦁화학업</option>
							<option value="3">건설업</option>
							<option value="4">미디어⦁광고업</option>
							<option value="5">판매⦁유통업</option>
							<option value="6">교육업</option>
							<option value="7">의료⦁제약업</option>
							<option value="8">문화⦁예술⦁디자인업</option>
							<option value="9">서비스업</option>
							<option value="10">사무직</option>
					</select></td>
				</tr>
				<tr>
					<td class="hope_pay">희망연봉</td>
					<td class="hope_pay_input"><input type="text" class="yeonbong" name = "wage"></td>
				</tr>
				<tr>
					<td class="hope_area">희망근무지역</td>
					<td class="hope_area_input"><select name="worklocation" name = "worklocation" class="sido">
							<option value=""></option>
							<option value="특별시">특별시</option>
							<option value="광역시">광역시</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청남도">충청남도</option>
							<option value="충청북도">충청북도</option>
							<option value="전라남도">전라남도</option>
							<option value="전라북도">전라북도</option>
							<option value="경상남도">경상남도</option>
							<option value="경상북도">경상북도</option>
							<option value="제주도">제주도</option>
					</select></td>
				</tr>
				<tr>
					<td class="hire_type">고용형태</td>
					<td class="hire_type_input"><select name="employmenttype" class="koyong">
							<option value=""></option>
							<option value="계약직">계약직</option>
							<option value="상용직">상용직</option>
							<option value="시간제">시간제</option>
					</select></td>
				</tr>
			</table>

			<div class="buttons">
				<button class="register" type="submit">등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="cancle" type="button">취소</button>
			</div>

		</form>
	</div>

	<script src="header.js"></script>
</body>

</html>