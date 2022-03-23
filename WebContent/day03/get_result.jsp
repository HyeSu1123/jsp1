<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3 get요청 처리</title>
</head>
<body>
	<%
		String no = request.getParameter("no");
		out.print("no : ");
		out.print(no);
	%>
</body>
</html>