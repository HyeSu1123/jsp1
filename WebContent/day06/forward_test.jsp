<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward</title>
</head>
<body>
<%
	//서버 구현 부분을 코딩한다.
	// -> 결과 데이터를 애트리뷰트에 저장한다.
	request.setAttribute("data", "abc"); //data란 이름으로 "abc" 값 저장

	//forward_test.jsp url로 요청된 정보를 C.jsp로 전달한다.
	pageContext.forward("C.jsp");	//사용자를 위한 출력화면이다.(view 파일로 이동)s
	//context : 문맥
%>
</body>
</html>