<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>요청 a.jsp</h3>
	<hr>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URI : <%=request.getRequestURI() %></li>
		<li>session 애트리뷰트 sdata : <%= session.getAttribute("sdata") %></li>
		<!-- 실행순서   1.a.jsp에서 실행
					2.index.jsp 실행 후 요청 링크로 a.jsp로 확인 -->
		<li>application 애트리뷰트 adata:<%=application.getAttribute("adata") %></li>
	</ul>
</body>
</html>