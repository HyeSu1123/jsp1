<%@page import="koreait.vo.SaleSum"%>
<%@page import="koreait.dao.HrdSaleDao"%>
<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회</title>
 <link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
  <header>
    <div>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </div>    
    <%@include file="top.jsp" %>
    </header>
<%
	
	List<SaleSum> list = (List<SaleSum>)request.getAttribute("list");;

%>
        <section>
        <h4 style="text-align: center;">홈쇼핑 회원 목록조회</h4>
            <table style="width:70%;margin:auto;text-align: center;">
				<tr>
					<th>회원 번호</th>
					<th>회원 성명</th>
					<th>고객 등급</th>
					<th>매출 집계</th>
				</tr>
					<%
						for(int i=0; i<list.size();i++){	
					%>
					<tr>	
						<td><%=list.get(i).getCustNo() %></td>
						<td><%=list.get(i).getCustNme() %></td>
						<td><%=list.get(i).getGrade() %></td>
						<td style="padding-bottom: 20px"><%=list.get(i).getSum() %></td>
					</tr>
					<% 
						}
					%>
					
					

            </table>
        </section>
        <footer>
          HRDKOREA Copyright&copy;2016 ALL rights reserved Human Resources Development Sevice of Korea.
        </footer>
</body>
</html>