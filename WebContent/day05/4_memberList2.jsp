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
<%
//	String find = request.getParameter("search_name"); //전체이름으로 조회한 리스트
	String col = request.getParameter("col");
	String find = request.getParameter("search");

   	HrdMemberDao dao = HrdMemberDao.getInstance();
   	HrdMember mem = new HrdMember();
   	
   	List<HrdMember> list = null;
   	if(find == null || find.length() == 0){
   	list = dao.selectAll();		//전체 리스트   		
   	}else{
//   	list = dao.searchName(find);//전체 이름으로 조회한 리스트
   	list = dao.search(col, find);
   	}
%>
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
        <section>
        <h4 style="text-align: center;">홈쇼핑 회원 목록조회</h4>
        <div>
        <!-- action url을 현재 url과 같게 했다. -->
        	<form action="4_memberList.jsp">
        	<select name="col">
        		<option value="a">이름</option>
        		<option value="b">주소</option>
        		<option value="c">고객등급</option>
        		<option value="d">거주지역</option>
        	</select>
        	<!--<input name="search_name" placeholder="검색할 이름 입력">
        		<button>검색</button>  -->
        		<input name="search" placeholder="검색할 이름 입력">
        		<input name="search" placeholder="검색할 주소 입력" type="hidden">
        		<input name="search" placeholder="검색할 등급 입력" type="hidden">
        		<input name="search" placeholder="검색할 거주지역 입력" type="hidden">
        		<button>검색</button>
        		<button type="button" onclick="location.href='4_memberList.jsp'">전체보기</button>
        	</form>
        </div>
					<p style="text-align: center;">수정을 원하시면 번호를 클릭해주세요.</p>
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
						//Dao에서 ArrayList 객체는 생성되어 있고 (null이 아님)조회결과가 없으면 리스트에 저장된
						//데이터가 없다.
						if(list.size() != 0){ //list의 데이터가 있을때만.
						for(int i=0; i<list.size();i++){
					%>
					<tr>	<!-- MyUser 타입 객체의 데이터를 출력 -->
						<td><a href="5_updateForm.jsp?no=<%=list.get(i).getCustNo() %>" style="color:tomato;">
					<%=list.get(i).getCustNo() %>
					</a></td>
						<td><%=list.get(i).getCustName() %></td>
						<td><%=list.get(i).getPhone() %></td>
						<td><%=list.get(i).getAdderss() %></td>
						<td><%=list.get(i).getJoinDate() %></td>
						<td style="text-align: center;">
						<%
						String temp = list.get(i).getGrade();
						switch(temp){
						case"A":
							out.print("VIP");
							break;
						case"B":
							out.print("일반");
							break;
						case"C":
							out.print("직원");
							break;
						}
						%></td>
						<td style="text-align: center;"><%=list.get(i).getCity() %></td>
					</tr>
					<% 
						}
						}else{//list의 데이터가 없을때
					%>
							<tr>
								<td colspan="7" style="text-align: center;">조회 결과가 없습니다.</td>
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