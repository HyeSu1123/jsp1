<%@page import="java.time.LocalDate"%>
<%@page import="day1.Product"%>
<%@page import="day1.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	table,td{
		border: 1px solid gray;
		margin: auto;
	}
	th{
		border: 1px solid gray;
		text-align: center;	
		background-color: olive;
		color:white;
		padding: 10px;
	}
	td{
		padding: 10px;
		
	}
	</style>
</head>
<body>
<%
	ProductDao dao = ProductDao.getProductDao();
	List<Product> list = dao.selectAll();
%>
	<h3>TBL_PRODUCT# 테이블 데이터</h3>
	<table>
	<caption>현재시간 : <%=LocalDate.now() %></caption>
	<tr>
		<th>상품코드</th>
		<th>카테고리</th>
		<th>상품이름</th>
		<th>상품가격</th>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			Product product = list.get(i); //for(Product product :list)해도 됨 
	%>
	<tr>
		<td><%= product.getPcode() %></td>
		<td><%= product.getCategory() %></td>
		<td><%= product.getPname() %></td>
		<td><%= product.getPrice() %></td>
	</tr>
	<%
		}	
	%>
	</table>
</body>
</html>