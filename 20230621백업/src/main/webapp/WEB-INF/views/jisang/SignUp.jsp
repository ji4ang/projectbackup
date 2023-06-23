<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	String userid = (String) session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <link rel="stylesheet" href="${path}/resources/css/SignUp.css">
</head>
<body>
    <div class="SignUp_wrap">

        <!-- 첫 화면으로 이동 (시작) -->
        <div class="send_home">
            <a href="${path}/MainPage.do"><!-- 메인페이지 파일 경로 --> 첫 화면으로 이동 
            </a>
        </div>
        <!-- 첫 화면으로 이동 (끝) -->
    
    
        <div class="container">
    
            <!-- 로그인/회원가입 이동 버튼 (시작) -->
            <div class="SignUp_nav">
                <a href="<c:url value='/SignIn.do'/>" class="siBtn">로그인</a>
                <a href="<c:url value='/SignUp.do'/>" class="suBtn">회원가입</a>
            </div>
            <!-- 로그인/회원가입 이동 버튼 (끝) -->
            
            <form action="${path}/SignUp2.do" method="post">
                <!-- 회원 유형 선택 (시작) -->
                <div class="user_mode">
                    <label>
                        <input type="radio" name="userdiv" value="A" onclick="indivBtn()" checked required>개인회원
                    </label>
                    <label>
                        <input type="radio" name="userdiv" value="B" onclick="corpBtn()" required>기업회원
                    </label>
                </div>
                <!-- 회원 유형 선택 (끝) -->
        
                 <!-- 개인회원 정보 입력 (시작) -->
                <div id="indiv">
                    <div class="indiv_info">
                        <input type="text" name="userid" placeholder="아이디" required>
                    </div>
                    <div class="indiv_info">
                        <input type="password" name="userpw" placeholder="비밀번호" required>
                    </div>
                    <div class="indiv_info">
                        <input type="email" name="useremail" placeholder="이메일" required>
                    </div>
                    <div class="indiv_info">
                        <input type="text" name="username" placeholder="이름" required>
                    </div>
                    <div class="indiv_info">
                        <input type="text" name="userphone" placeholder="휴대전화 번호" onkeypress="onlyNum();" maxlength="11" required>
                    </div>
                    <div class="indiv_info">
                        <select name="userobstccode" required>
                            <!-- name : parameter 불러오기? (백엔드 부분) -->
                            <option disabled selected id="check">장애여부 선택</option><!-- 기본값이라 value나 name 불러올 필요 없음 -->
                            <option value="0" class="opt" >해당 없음</option>
                            <option value="1" class="opt" >지체장애</option>
                            <option value="2" class="opt" >뇌병변장애</option>
                            <option value="3" class="opt" >시각장애</option>
                            <option value="4" class="opt" >청각장애</option>
                            <option value="5" class="opt" >언어장애</option>
                            <option value="6" class="opt" >지적장애</option>
                            <option value="7" class="opt" >자폐성장애</option>
                            <option value="8" class="opt" >정신장애</option>
                            <option value="9" class="opt" >신장장애</option>
                            <option value="10" class="opt">심장장애</option>
                            <option value="11" class="opt">호흡기장애</option>
                            <option value="12" class="opt" >간장애</option>
                            <option value="13" class="opt" >안면장애</option>
                            <option value="14" class="opt" >장루/요루장애</option>
                            <option value="15" class="opt" >뇌전증장애</option>
                        </select>
                    </div>

                    <!-- 전송 버튼 -->
                    <button type="submit" class="btn">회원가입</button>
                </div>
                <!-- 개인회원 정보 입력 (끝) -->
            </form>
        
        
             <form action="${path}/SignUp3.do" method="post">
               <!-- 기업회원 정보 입력 (시작) -->
                <div id="corp">
                    <div class="corp_info">
                        <input type="text" name="userid" placeholder="아이디" required>
                    </div>
                    <div class="corp_info">
                        <input type="password" name="userpw" placeholder="비밀번호" required>
                    </div>
                    <div class="corp_info">
                        <input type="email" name="useremail" placeholder="이메일" required>
                    </div>
                    <div class="corp_info">
                        <input type="text" name="username" placeholder="이름" required>
                    </div>
                    <div class="corp_info">
                        <input type="text" name="userphone" placeholder="휴대전화 번호" onkeypress="onlyNum2();" maxlength="11" required>
                    </div>
                    <div class="corp_info">
                        <input type="text" name ="businessidx"  placeholder="사업자 번호" onkeypress="onlyNum3();" maxlength="13" />
                    </div>
                    
                    <!-- 전송 버튼 -->
                    <button type="submit" class="btn">회원가입</button>
                </div>
                <!-- 기업회원 정보 입력 (끝) -->
        
            </form>
        </div>
        <!-- 회원가입 폼 (끝) -->
        </div>
    <script src="${path}/resources/js/SignUp.js"></script>
    
</body>
</html>