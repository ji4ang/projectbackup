<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	// controller에서 데이터 가져와서 저장할 예정
	String[] str  = {"파인애플", "바나나", "포도", "오렌지", "굴"};
	request.setAttribute("str", str);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jstl과 el식을 사용하여 저장되어ㅣㅆ는 이름으로 불러오기 -->
<table border="1">
	<tr>
		<td>과일목록</td>
	</tr>
	
	<c:forEach items="${str}" var="f">
		<tr>
			<td>${f}</td>
		</tr>
	</c:forEach>




</table>




</body>
</html>