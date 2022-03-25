<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
 <link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
  <header>
    <div>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </div>    
    <nav>
      <ul class="container">
            <li><a href="2_insertForm.jsp">회원등록</a></li>
            <li><a href="4_memberList.jsp">회원목록조회/수정</a></li>
            <li><a href="7_saleList.jsp">회원매출조회</a></li>
            <li><a href="1_index.jsp">홈으로</a></li>
        </ul>
    </nav>
    </header>
<%
	request.setCharacterEncoding("UTF-8");
	
   	HrdMemberDao dao = HrdMemberDao.getInstance();
   	List<HrdMember> list = dao.selectAll();
%>
        <section>
        <h4 style="text-align: center;">홈쇼핑 회원 목록조회</h4>
            <table style="width:80%;margin:auto;">
				<tr>
					<th>회원 번호</th>
					<th>회원 성명</th>
					<th>회원 전화</th>
					<th>회원 주소</th>
					<th>가입 날짜</th>
					<th>고객 등급</th>
					<th>거주지역</th>
				</tr>
					<%
						for(int i=0; i<list.size();i++){		//for(MyUser user : list)
					%>
					<tr>	<!-- MyUser 타입 객체의 데이터를 출력 -->
						<td><a href="5_updateForm.jsp?no=<%=list.get(i).getCustNo() %>" style="color:tomato;">
					<%=list.get(i).getCustNo() %>
					</a></td>
						<td><%=list.get(i).getCustName() %></td>
						<td><%=list.get(i).getPhone() %></td>
						<td><%=list.get(i).getAdderss() %></td>
						<td><%=list.get(i).getJoinDate() %></td>
						<td style="text-align: center;"><%=list.get(i).getGrade() %></td>
						<td style="text-align: center;"><%=list.get(i).getCity() %></td>
					</tr>
					<% 
						}
					%>
					<p style="text-align: center;">수정을 원하시면 번호를 클릭해주세요.</p>
            </table>
        </section>
        <footer>
          HRDKOREA Copyright&copy;2016 ALL rights reserved Human Resources Development Sevice of Korea.
        </footer>
</body>
</html>