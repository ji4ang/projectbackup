<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="${path}/resources/css/result.css">
	<link rel="stylesheet" href="${path}/resources/css/header.css">	
</head>
<body>
    <!-- 헤더 (시작) -->
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
    <!-- 헤더 (끝) -->


    <!-- 검사 결과 (시작) -->
    
    <% 
    	int predict1 = Integer.parseInt(request.getParameter("predict1"));
    	int predict2 = Integer.parseInt(request.getParameter("predict2"));
    	int predict3 = Integer.parseInt(request.getParameter("predict3"));
    	
    	// 직업(대)을 담을 변수
    	String job1 = "";
    	String job2 = "";
    	String job3 = "";
    	// 직업(중)을 담을 변수
    	List<String> job_code1 = new ArrayList<>();
    	List<String> job_code2 = new ArrayList<>();
    	List<String> job_code3 = new ArrayList<>();
    	
    	// 직업 설명을 담을 변수
    	String job1_blah = "";
    	String job2_blah = "";
    	String job3_blah = "";
    	
        switch (predict1) {
        case 1:  job1 = "관리직";
        		 job1_blah = "관리자는 조직이나 기업의 경영 및 운영을 총괄하고 조직의 목표 달성을 위해 계획, 조직, 지도 및 통제를 수행하는 역할을 말합니다.";
        		 job_code1.add("마케팅 및 광고·홍보 관리자");
        		 job_code1.add("연구·교육 및 법률 관련 관리자");
        		 job_code1.add("사회복지 관련 관리자");
        		 job_code1.add("문화·예술 관련 관리자");
        		 job_code1.add("기타 전문 서비스 관리자");
                 break;
        case 2:  job1 = "전문직";
		         job1_blah = "전문직은 일반적으로 고등교육이나 전문 교육을 통해 해당 분야에서 필요한 지식과 기술을 습득한 사람들이 많이 속하는 범주입니다."+
        					 "전문직은 다양한 분야에서 발견되며, 의료, 법률, 공학, IT, 경영, 디자인 등 다양한 분야에서 전문성을 가진 사람들이 활동합니다.";
				 job_code1.add("생명 및 자연과학 관련 연구원");
				 job_code1.add("정보 통신 전문가 및 연구원");
				 job_code1.add("공학 전문가 및 기술직");
				 job_code1.add("보건·사회복지 및 종교 관련직");
				 job_code1.add("교육 전문가 및 관련직");
                 break;
        case 3:  job1 = "사무직";
		         job1_blah = "사무직은 사무 업무를 수행하는 직종을 일컫습니다. 사무직은 회사나 조직의 원활한 운영과 의사 소통을 지원하고 관리하는 역할을 담당합니다.";
				 job_code1.add("비서");
				 job_code1.add("금융 사무 종사자");
				 job_code1.add("상담·안내·통계 및 기타 사무직");
				 job_code1.add("텔레마케터");
				 job_code1.add("경영 및 회계 관련 사무직");
                 break;
        case 4:  job1 = "서비스직";
		         job1_blah = "서비스직은 고객 서비스 및 다양한 서비스 업무를 수행하는 직종을 일컫습니다. 서비스직은 고객과 직접 상호작용하며, "+
        					 "서비스 업무는 다양한 산업 부문에서 이루어지며, 호텔, 음식점, 여행사, 은행, 병원, 공항 등 다양한 장소에서 찾아볼 수 있습니다.";
				 job_code1.add("경찰·소방 및 보안 관련 서비스직");
				 job_code1.add("돌봄·보건 및 개인 생활 서비스직");
				 job_code1.add("미용 관련 서비스 종사자");
				 job_code1.add("운송 및 여가 서비스직");
				 job_code1.add("조리 및 음식 서비스직");
                 break;
        case 5:  job1 = "판매 종사자";
		         job1_blah = "판매 종사자는 제품이나 서비스를 고객에게 판매하는 업무를 수행하는 직종을 말합니다. 이 직종은 다양한 산업 분야에서 찾아볼 수 있으며,"+
        					 " 소매업, 도매업, 서비스 업체 등에서 판매원, 영업사원, 판매 관리자 등으로 일할 수 있습니다.";
				 job_code1.add("매장 판매 종사자");
				 job_code1.add("상품 대여 종사자");
				 job_code1.add("통신 및 방문·노점 판매 관련직");
				 job_code1.add("방문 및 노점 판매 관련직");
				 job_code1.add("보험 모집인 및 투자 권유 대행인");
                 break;
        case 6:  job1 = "농림어업 숙련직";
		         job1_blah = "농림어업 숙련직은 농업, 임업, 어업과 관련된 전문적인 기술과 지식을 활용하여 일하는 직종을 말합니다. 이러한 직종은 농산물, 임산물, 어업 자원 등을 생산하고 관리하는 업무를 담당합니다.";
				 job_code1.add("원예 및 조경 종사자");
				 job_code1.add("연구·교육 및 법률 관련 관리자");
				 job_code1.add("축산 및 사육 관련 종사자");
				 job_code1.add("임업 숙련직");
				 job_code1.add("어업 숙련직");
                 break;
        case 7:  job1 = "기능원 및 관련 기능직";
		         job1_blah = "기능원 및 관련 기능직은 특정 분야에서 특수한 기술과 지식을 활용하여 일하는 직종들을 말합니다."+
    					 " 이러한 직종들은 다양한 산업 분야에서 필요로 하는 기술과 전문성을 갖추고 있으며, 기업이나 조직의 생산과 업무 수행에 핵심적인 역할을 담당합니다.";
				 job_code1.add("식품가공 관련 기능 종사자");
				 job_code1.add("섬유 및 가죽 관련 기능 종사자");
				 job_code1.add("목재·가구·악기 및 간판 관련 기능직");
				 job_code1.add("전기 및 전자 관련 기능직");
				 job_code1.add("정보 통신 및 방송장비 관련 기능직");
                 break;
        case 8:  job1 = "장치,기계 조작 전문직";
		         job1_blah = "장치, 기계 조작 전문직은 다양한 기계나 장치를 조작하고 제어하는 업무를 수행하는 직종을 말합니다. 이러한 전문직은 제조업, 공정 생산, 자동화 시스템 등 다양한 산업 분야에서 필요로 합니다.";
				 job_code1.add("식품가공 관련 기계 조작원");
				 job_code1.add("섬유 및 신발 관련 기계 조작직");
				 job_code1.add("화학 관련 기계 조작직");
				 job_code1.add("금속 및 비금속 관련 기계 조작직");
				 job_code1.add("기계 제조 및 관련 기계 조작직");
                 break;
        case 9:  job1 = "일반 노무직";
		         job1_blah = "일반 노무직은 주로 체력과 노동력을 활용하여 물리적인 노동을 수행하는 직종을 말합니다. 이러한 직종은 일반적으로 비전문적인 업무를 수행하며, 주로 생산 부문이나 서비스 업계에서 일하는 경우가 많습니다.";
				 job_code1.add("건설 및 광업 관련 단순 노무직");
				 job_code1.add("운송 관련 단순 노무직");
				 job_code1.add("제조 관련 단순 노무직");
				 job_code1.add("청소 및 경비 관련 단순 노무직");
				 job_code1.add("가사·음식 및 판매 관련 단순 노무직");
                 break;
        }
        
    	
        switch (predict2) {
        case 1:  job2 = "관리직";
        		 job2_blah = "관리자는 조직이나 기업의 경영 및 운영을 총괄하고 조직의 목표 달성을 위해 계획, 조직, 지도 및 통제를 수행하는 역할을 말합니다.";
        		 job_code2.add("마케팅 및 광고·홍보 관리자");
        		 job_code2.add("연구·교육 및 법률 관련 관리자");
        		 job_code2.add("사회복지 관련 관리자");
        		 job_code2.add("문화·예술 관련 관리자");
        		 job_code2.add("기타 전문 서비스 관리자");
                 break;
        case 2:  job2 = "전문직";
		         job2_blah = "전문직은 일반적으로 고등교육이나 전문 교육을 통해 해당 분야에서 필요한 지식과 기술을 습득한 사람들이 많이 속하는 범주입니다."+
        					 "전문직은 다양한 분야에서 발견되며, 의료, 법률, 공학, IT, 경영, 디자인 등 다양한 분야에서 전문성을 가진 사람들이 활동합니다.";
				 job_code2.add("생명 및 자연과학 관련 연구원");
				 job_code2.add("정보 통신 전문가 및 연구원");
				 job_code2.add("공학 전문가 및 기술직");
				 job_code2.add("보건·사회복지 및 종교 관련직");
				 job_code2.add("교육 전문가 및 관련직");
                 break;
        case 3:  job2 = "사무직";
		         job2_blah = "사무직은 사무 업무를 수행하는 직종을 일컫습니다. 사무직은 회사나 조직의 원활한 운영과 의사 소통을 지원하고 관리하는 역할을 담당합니다.";
				 job_code2.add("비서");
				 job_code2.add("금융 사무 종사자");
				 job_code2.add("상담·안내·통계 및 기타 사무직");
				 job_code2.add("텔레마케터");
				 job_code2.add("경영 및 회계 관련 사무직");
                 break;
        case 4:  job2 = "서비스직";
		         job2_blah = "서비스직은 고객 서비스 및 다양한 서비스 업무를 수행하는 직종을 일컫습니다. 서비스직은 고객과 직접 상호작용하며, "+
        					 "서비스 업무는 다양한 산업 부문에서 이루어지며, 호텔, 음식점, 여행사, 은행, 병원, 공항 등 다양한 장소에서 찾아볼 수 있습니다.";
				 job_code2.add("경찰·소방 및 보안 관련 서비스직");
				 job_code2.add("돌봄·보건 및 개인 생활 서비스직");
				 job_code2.add("미용 관련 서비스 종사자");
				 job_code2.add("운송 및 여가 서비스직");
				 job_code2.add("조리 및 음식 서비스직");
                 break;
        case 5:  job2 = "판매 종사자";
		         job2_blah = "판매 종사자는 제품이나 서비스를 고객에게 판매하는 업무를 수행하는 직종을 말합니다. 이 직종은 다양한 산업 분야에서 찾아볼 수 있으며,"+
        					 " 소매업, 도매업, 서비스 업체 등에서 판매원, 영업사원, 판매 관리자 등으로 일할 수 있습니다.";
				 job_code2.add("매장 판매 종사자");
				 job_code2.add("상품 대여 종사자");
				 job_code2.add("통신 및 방문·노점 판매 관련직");
				 job_code2.add("방문 및 노점 판매 관련직");
				 job_code2.add("보험 모집인 및 투자 권유 대행인");
                 break;
        case 6:  job2 = "농림어업 숙련직";
		         job2_blah = "농림어업 숙련직은 농업, 임업, 어업과 관련된 전문적인 기술과 지식을 활용하여 일하는 직종을 말합니다. 이러한 직종은 농산물, 임산물, 어업 자원 등을 생산하고 관리하는 업무를 담당합니다.";
				 job_code2.add("원예 및 조경 종사자");
				 job_code2.add("연구·교육 및 법률 관련 관리자");
				 job_code2.add("축산 및 사육 관련 종사자");
				 job_code2.add("임업 숙련직");
				 job_code2.add("어업 숙련직");
                 break;
        case 7:  job2 = "기능원 및 관련 기능직";
		         job2_blah = "기능원 및 관련 기능직은 특정 분야에서 특수한 기술과 지식을 활용하여 일하는 직종들을 말합니다."+
    					 " 이러한 직종들은 다양한 산업 분야에서 필요로 하는 기술과 전문성을 갖추고 있으며, 기업이나 조직의 생산과 업무 수행에 핵심적인 역할을 담당합니다.";
				 job_code2.add("식품가공 관련 기능 종사자");
				 job_code2.add("섬유 및 가죽 관련 기능 종사자");
				 job_code2.add("목재·가구·악기 및 간판 관련 기능직");
				 job_code2.add("전기 및 전자 관련 기능직");
				 job_code2.add("정보 통신 및 방송장비 관련 기능직");
                 break;
        case 8:  job2 = "장치,기계 조작 전문직";
		         job2_blah = "장치, 기계 조작 전문직은 다양한 기계나 장치를 조작하고 제어하는 업무를 수행하는 직종을 말합니다. 이러한 전문직은 제조업, 공정 생산, 자동화 시스템 등 다양한 산업 분야에서 필요로 합니다.";
				 job_code2.add("식품가공 관련 기계 조작원");
				 job_code2.add("섬유 및 신발 관련 기계 조작직");
				 job_code2.add("화학 관련 기계 조작직");
				 job_code2.add("금속 및 비금속 관련 기계 조작직");
				 job_code2.add("기계 제조 및 관련 기계 조작직");
                 break;
        case 9:  job2 = "일반 노무직";
		         job2_blah = "일반 노무직은 주로 체력과 노동력을 활용하여 물리적인 노동을 수행하는 직종을 말합니다. 이러한 직종은 일반적으로 비전문적인 업무를 수행하며, 주로 생산 부문이나 서비스 업계에서 일하는 경우가 많습니다.";
				 job_code2.add("건설 및 광업 관련 단순 노무직");
				 job_code2.add("운송 관련 단순 노무직");
				 job_code2.add("제조 관련 단순 노무직");
				 job_code2.add("청소 및 경비 관련 단순 노무직");
				 job_code2.add("가사·음식 및 판매 관련 단순 노무직");
                 break;
        }
        
    	
        switch (predict3) {
        case 1:  job3 = "관리직";
        		 job3_blah = "관리자는 조직이나 기업의 경영 및 운영을 총괄하고 조직의 목표 달성을 위해 계획, 조직, 지도 및 통제를 수행하는 역할을 말합니다.";
        		 job_code3.add("마케팅 및 광고·홍보 관리자");
        		 job_code3.add("연구·교육 및 법률 관련 관리자");
        		 job_code3.add("사회복지 관련 관리자");
        		 job_code3.add("문화·예술 관련 관리자");
        		 job_code3.add("기타 전문 서비스 관리자");
                 break;
        case 2:  job3 = "전문직";
		         job3_blah = "전문직은 일반적으로 고등교육이나 전문 교육을 통해 해당 분야에서 필요한 지식과 기술을 습득한 사람들이 많이 속하는 범주입니다."+
        					 "전문직은 다양한 분야에서 발견되며, 의료, 법률, 공학, IT, 경영, 디자인 등 다양한 분야에서 전문성을 가진 사람들이 활동합니다.";
				 job_code3.add("생명 및 자연과학 관련 연구원");
				 job_code3.add("정보 통신 전문가 및 연구원");
				 job_code3.add("공학 전문가 및 기술직");
				 job_code3.add("보건·사회복지 및 종교 관련직");
				 job_code3.add("교육 전문가 및 관련직");
                 break;
        case 3:  job3 = "사무직";
		         job3_blah = "사무직은 사무 업무를 수행하는 직종을 일컫습니다. 사무직은 회사나 조직의 원활한 운영과 의사 소통을 지원하고 관리하는 역할을 담당합니다.";
				 job_code3.add("비서");
				 job_code3.add("금융 사무 종사자");
				 job_code3.add("상담·안내·통계 및 기타 사무직");
				 job_code3.add("텔레마케터");
				 job_code3.add("경영 및 회계 관련 사무직");
                 break;
        case 4:  job3 = "서비스직";
		         job3_blah = "서비스직은 고객 서비스 및 다양한 서비스 업무를 수행하는 직종을 일컫습니다. 서비스직은 고객과 직접 상호작용하며, "+
        					 "서비스 업무는 다양한 산업 부문에서 이루어지며, 호텔, 음식점, 여행사, 은행, 병원, 공항 등 다양한 장소에서 찾아볼 수 있습니다.";
				 job_code3.add("경찰·소방 및 보안 관련 서비스직");
				 job_code3.add("돌봄·보건 및 개인 생활 서비스직");
				 job_code3.add("미용 관련 서비스 종사자");
				 job_code3.add("운송 및 여가 서비스직");
				 job_code3.add("조리 및 음식 서비스직");
                 break;
        case 5:  job3 = "판매 종사자";
		         job3_blah = "판매 종사자는 제품이나 서비스를 고객에게 판매하는 업무를 수행하는 직종을 말합니다. 이 직종은 다양한 산업 분야에서 찾아볼 수 있으며,"+
        					 " 소매업, 도매업, 서비스 업체 등에서 판매원, 영업사원, 판매 관리자 등으로 일할 수 있습니다.";
				 job_code3.add("매장 판매 종사자");
				 job_code3.add("상품 대여 종사자");
				 job_code3.add("통신 및 방문·노점 판매 관련직");
				 job_code3.add("방문 및 노점 판매 관련직");
				 job_code3.add("보험 모집인 및 투자 권유 대행인");
                 break;
        case 6:  job3 = "농림어업 숙련직";
		         job3_blah = "농림어업 숙련직은 농업, 임업, 어업과 관련된 전문적인 기술과 지식을 활용하여 일하는 직종을 말합니다. 이러한 직종은 농산물, 임산물, 어업 자원 등을 생산하고 관리하는 업무를 담당합니다.";
				 job_code3.add("원예 및 조경 종사자");
				 job_code3.add("연구·교육 및 법률 관련 관리자");
				 job_code3.add("축산 및 사육 관련 종사자");
				 job_code3.add("임업 숙련직");
				 job_code3.add("어업 숙련직");
                 break;
        case 7:  job3 = "기능원 및 관련 기능직";
		         job3_blah = "기능원 및 관련 기능직은 특정 분야에서 특수한 기술과 지식을 활용하여 일하는 직종들을 말합니다."+
    					 " 이러한 직종들은 다양한 산업 분야에서 필요로 하는 기술과 전문성을 갖추고 있으며, 기업이나 조직의 생산과 업무 수행에 핵심적인 역할을 담당합니다.";
				 job_code3.add("식품가공 관련 기능 종사자");
				 job_code3.add("섬유 및 가죽 관련 기능 종사자");
				 job_code3.add("목재·가구·악기 및 간판 관련 기능직");
				 job_code3.add("전기 및 전자 관련 기능직");
				 job_code3.add("정보 통신 및 방송장비 관련 기능직");
                 break;
        case 8:  job3 = "장치,기계 조작 전문직";
		         job3_blah = "장치, 기계 조작 전문직은 다양한 기계나 장치를 조작하고 제어하는 업무를 수행하는 직종을 말합니다. 이러한 전문직은 제조업, 공정 생산, 자동화 시스템 등 다양한 산업 분야에서 필요로 합니다.";
				 job_code3.add("식품가공 관련 기계 조작원");
				 job_code3.add("섬유 및 신발 관련 기계 조작직");
				 job_code3.add("화학 관련 기계 조작직");
				 job_code3.add("금속 및 비금속 관련 기계 조작직");
				 job_code3.add("기계 제조 및 관련 기계 조작직");
                 break;
        case 9:  job3 = "일반 노무직";
		         job3_blah = "일반 노무직은 주로 체력과 노동력을 활용하여 물리적인 노동을 수행하는 직종을 말합니다. 이러한 직종은 일반적으로 비전문적인 업무를 수행하며, 주로 생산 부문이나 서비스 업계에서 일하는 경우가 많습니다.";
				 job_code3.add("건설 및 광업 관련 단순 노무직");
				 job_code3.add("운송 관련 단순 노무직");
				 job_code3.add("제조 관련 단순 노무직");
				 job_code3.add("청소 및 경비 관련 단순 노무직");
				 job_code3.add("가사·음식 및 판매 관련 단순 노무직");
                 break;
        }

    %>
    
    <section>
        <div class="survey_result">
            <div class="result_title">
                <h3>검사 결과</h3>
            </div>

            <div class="result_list_wrap">
                <h4>당신에게 적합한 직업은 다음과 같습니다.</h4>
                <div class="result_list">
                    <span><%=job1 %></span>
                    <span><%=job2 %></span>
                    <span><%=job3 %></span> 
                </div>
            </div>

            <div class="result_wrap">
                <table>
                    <tr>
                        <th>
                            <div><%=job1%></div>
                        </th>
                        <th>
                            <div><%=job2%></div>
                        </th>
                        <th>
                            <div><%=job3%></div>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div><%= job1_blah %></div>
							
                        </td>
                        <td>
                            <div><%=job2_blah %></div>
                            
                        </td>
                        <td>
                            <div><%=job3_blah %></div>
                            
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		<div><%= job_code1 %></div>
                    	</td>
                    	<td>
                    		<div><%=job_code2 %></div>
                    	</td>
                    	
                    	<td>
                    		<div><%=job_code3 %></div>
                    	</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    <!-- 검사 결과 (끝) -->
</body>
</html>