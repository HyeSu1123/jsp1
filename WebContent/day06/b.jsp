<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>요청 b.jsp</h3>
	<hr>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URI : <%=request.getRequestURI() %></li>
		<li>session 애트리뷰트 sdata : <%= session.getAttribute("sdata") %></li>
		<li>application 애트리뷰트 adata:<%=application.getAttribute("adata") %></li>
		
		
	</ul>
</body>
</html>