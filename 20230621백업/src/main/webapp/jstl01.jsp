<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 야호의 글씨가 점점 커지도록 5번 반복 -->
<!-- jstl과 el식을 병행 사용 -->


<!-- jstl의  if를 사용해서 i가 짝수 일때만 출력하기 -->

<c:forEach begin="1" end="5" step="1" var="i">
	<c:if test="${i % 2 == 0}">
		<font size="${i}">무야호${i}</font>
	</c:if>
</c:forEach>


</body>
</html>