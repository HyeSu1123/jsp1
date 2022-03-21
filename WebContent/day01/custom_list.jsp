<%@page import="java.time.LocalDate"%>
<%@page import="day1.Custom"%>
<%@page import="java.util.List"%>
<%@page import="day1.CustomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:70%;
		margin:auto;
		border-collapse: collapse;
	}
	td,th{
		border : 1px solid gray;
		text-align: center;
	}
	th{
		background-color: tomato;
		color:white;
	}
</style>
</head>
<body>
<!-- 오라클 jdbc 연결을 위해서 ojdbc6.jar 라이브러리 추가해야한다.
[WebContent 폴더] - [WEB-INF폴더] = [lib] 폴더에 파일을 복사한다. -->

<%
	CustomDao dao = CustomDao.getCustomDao();
	List<Custom> list = dao.selectAll();
%>
	<h3>TBL_CUSTOM# 테이블 테이더</h3>
	<table>
		<caption>현재시간 : <%=LocalDate.now() %></caption>
	<tr>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<!-- 아래의 1행 한명의 MyUser 객체 출력을 list 크기만큼 반복해서 테이블에 출력 -->
		<%
			for(int i=0; i<list.size();i++){		//for(MyUser user : list)
				Custom custom = list.get(i);
		%>
		<tr>	<!-- MyUser 타입 객체의 데이터를 출력 -->
			<td><%=custom.getCustom_id() %></td>
			<td><%=custom.getName() %></td>
			<td><%=custom.getEmil() %></td>
			<td><%=custom.getAge() %></td>
		</tr>
		<% 
			}
		%>
	</table>
</body>
</html>