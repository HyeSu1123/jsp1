<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 출력(view) -->
	<h3>요청 C.jsp</h3>
	<hr>
	<ul>
		<!-- C.jsp로 출력 : request 제어는 c.jsp한다.. 
		브라우저의 url 주소창은 forward_test.jsp가 표시된다.-->
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URI : <%=request.getRequestURI() %></li>
		<!-- 원래 forward_test.jsp의 애트리뷰트와 파라미터가 전달된다. -->
		<li>data 이름의 애트리뷰트 : <%=request.getAttribute("data") %></li>
		<li>name 이름의 파라미터 : <%=request.getParameter("name") %></li>
	</ul>
</body>
</html>