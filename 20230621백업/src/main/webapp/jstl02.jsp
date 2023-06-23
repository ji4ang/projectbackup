<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl에서 스크립틀릿을 이용하여 변수 선언 했던 것처럼 변수 만들기 -->
<c:set var="a" value="10" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jstl에서 만들어진 변수를 출력
	짝수라면 "짝수입니다.", 홀수라면 "홀수입니다" 출력  if-else문
	choose-when/otherwise 이용
	-->
<c:choose>
	<c:when test="${a%2==0}">
		짝수입니다.
	</c:when>
	<c:otherwise>
		홀수입니다.
	</c:otherwise>

</c:choose>
	
</body>
</html>