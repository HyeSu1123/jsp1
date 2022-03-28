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
	alert(`회원번호 : ${member.custNo}`)	//애트리뷰트 가져오고 출력
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
    <%@include file="top.jsp" %>
    </header>
    <section>
	<%
//	HrdMember member = (HrdMember)request.getAttribute("member");

//	if(member==null) {
//		out.print("<script>alert('검색결과가 없습니다.');location.href='memberList.jsp';");
//		out.print("</script>");
//	}
	%>
	
<%
	//if(member !=null) {//없으면 처리 순서 html 태그로 랜더링을 하고 out.print자바코드 실행
%>	
	
	  <h4 style="text-align: center;">홈쇼핑 회원 수정</h4>
        <form action="6_updateSave.jsp" method="post">  
       <input type="hidden" name="num" value="${member.custNo}" >
       <!-- hidden 추가 대신 사용할 다른 방법은 회원 번호 input의 readonly="readonly"속성으로 한다.
       		입력 불가를 표현하기 위한 css가 필요하다. -->
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호</td>
                    <td><input type="text" name="num" value="${member.custNo}" 
                    		disabled="disabled"></td>  
                    <!-- disabled 가 설정되어 있으면 파라미터값 전달안됩니다. -->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name" value="${member.custName} " disabled="disabled"></td>
                    <!-- required="required" 를 간단히 표현 -->
                </tr>  
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30" value="${member.phone}"></td>
                </tr> 
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40" value="${member.adderss }"></td>
                </tr>  
                <tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date" value="${member.joinDate }" disabled="disabled" ></td>
                </tr>  
                <tr>
                    <td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade" value="${member.grade }" disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code"  value="${member.city }"></td>
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
//	}
%>       
		</section>
        <footer>
          HRDKOREA Copyright&copy;2016 ALL rights reserved Human Resources Development Sevice of Korea.
        </footer>
      </div> 
</body>
</html>