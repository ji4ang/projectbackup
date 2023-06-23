<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이룽</title>
</head>
<body>
<!-- index.jsp가 실행되면 바로 요청을 보내는 코드를 작성 
	jstl에서 c:redirect 이용하여
-->
<c:redirect url="MainPage.do"/>
</body>
</html>