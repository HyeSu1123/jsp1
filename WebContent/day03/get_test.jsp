<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day3 HrdMember List</title>
</head>
<body>
	<%
		//멤버 테이블의 데이터 모두 가져오기.
		HrdMemberDao dao = HrdMemberDao.getInstance();
		List<HrdMember> list = dao.selectAll();
	%>
	<h3>HrdMember List</h3>
	<hr>
	<ul>
		<%
			for(int i=0;i<list.size();i++){
				
		%>
				<!-- get 방식의 요청을 보낸다. 
				1) 요청 url에 쿼리스트링으로 조회할 값을 전달한다. 
					url에 ?기호 뒤에 key=value 한쌍으로 값을 전달한다.
					전달하는 url이 현재 url과 같으면 생략할 수 있다.
					a태그의 href속성 또는 자바스크립트의 loction.href='(url)'로 사용한다.
				-->
				<li>
					<a href="get_result.jsp?no=<%=list.get(i).getCustNo() %>">
					<%=list.get(i).getCustNo() %>
					</a> <!-- 1번 방법 -->
					:<%=list.get(i).getCustName() %>
				</li>
		<%
			}
		%>
	</ul>
				<!-- 2) 검색값을 입력받아 처리할때에는 form 사용 
						실행 url :http://localhost:8081/jsp1/day03/get_result.jsp?no=100003 -->
						
				<hr>
				<form action="get_result.jsp">	<!-- method='get'생략 -->
					<input name="no" placeholder="회원번호 입력"> <button>전송</button>
				</form>
</body>
</html>