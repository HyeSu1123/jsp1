<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<script src="0_member_valid.js"></script>
<script type="text/javascript">
	function isSubmit(){
		const frm = document.forms[0];
		if(valid_check()){	//유효성 검사 함수를 호출/실행.
			//유효성 검사 통과	
			frm.submit();
		}
	}
</script>
</head>
<body>
<div class="wrap_container">
<header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
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
	<%
	String no = request.getParameter("no");
	int custno=0;
	
	if(no == null){   //?custno 자체가 없을때  http://localhost:8081/jsp1/day3/get_result.jsp
		out.print("<script>alert('검색값이 없습니다.');location.href='4_memberList.jsp';");
		out.print("</script>");
	}else {
		try{
			custno = Integer.parseInt(no);
		}catch(NumberFormatException e) {
	//form 태그 조회값 없이 실행됬을 때 http://localhost:8081/jsp1/day3/get_result.jsp?custno=
			out.print("<script>alert('잘못된 검색값입니다.');location.href='4_memberList.jsp';");
			out.print("</script>");
		}
	}
	
	HrdMemberDao dao = HrdMemberDao.getInstance();
	HrdMember member = dao.selectOne(custno);
	if(member==null) {
		out.print("<script>alert('검색결과가 없습니다.');location.href='4_memberList.jsp';");
		out.print("</script>");
	}
	%>
	
<%
	if(member !=null) {
%>	
	
	  <h4 style="text-align: center;">홈쇼핑 회원 수정</h4>
        <form action="6_updateSave.jsp" method="post">  
       <input type="hidden" name="num" value="<%= member.getCustNo() %>" >
       <!-- hidden 추가 대신 사용할 다른 방법은 회원 번호 input의 readonly="readonly"속성으로 한다.
       		입력 불가를 표현하기 위한 css가 필요하다. -->
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호</td>
                    <td><input type="text" name="num" value="<%= member.getCustNo() %>" 
                    		disabled="disabled"></td>  
                    <!-- disabled 가 설정되어 있으면 파라미터값 전달안됩니다. -->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name" value="<%= member.getCustName() %>" disabled="disabled"></td>
                    <!-- required="required" 를 간단히 표현 -->
                </tr>  
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30" value="<%= member.getPhone() %>"></td>
                </tr> 
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40" value="<%= member.getAdderss() %>"></td>
                </tr>  
                <tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date" value="<%= member.getJoinDate() %>" disabled="disabled" ></td>
                </tr>  
                <tr>
                    <td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade" value="<%= member.getGrade() %>" disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code"  value="<%= member.getCity() %>"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <!-- <button>저장</button> -->
                        <button type="button" onclick="isSubmit()">저장</button>
                        <button type="reset">다시쓰기</button>
                    </td>
                </tr>

            </table>
        </form>
<%
	}
%>       
		</section>
        <footer>
          HRDKOREA Copyright&copy;2016 ALL rights reserved Human Resources Development Sevice of Korea.
        </footer>
      </div> 
</body>
</html>