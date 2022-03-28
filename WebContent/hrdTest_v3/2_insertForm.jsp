<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<script src="0_member_valid.js"></script>
<script type="text/javascript">
	function isSubmit(){
		const frm = document.forms[0];
		if(valid_check()){//유효성 검사 함수를 실행.
			//유효성 검사 통과
			frm.submit();
		}
	}
	function init(){
		const frm = document.forms[0];
		frm.name.value = "";
		frm.tel.value = "";
		frm.addr.value = "";
		frm.grade.value = "";
		frm.city_code.value= "";
	}
</script>
</head>
<body>
<div class="wrap_container">
  
    <section>
    <%@include file="top.jsp" %>
<%--
	//jstl 라이브러리를 사용하면 이코드는 작성하지 않는다.
	Object temp = request.getAttribute("next");
	int next = (int)temp;//형변환
--%>
	<h4 style="text-align: center;">홈쇼핑 회원 등록</h4>
        <form action="3_insertSave.jsp" method="post">
        <input name="num" type="hidden" value="${next}">
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호</td>
                    <td><input type="text" name="num" value="${next}" disabled="disabled"></td>
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name"></td>
                    <!-- required="required" 를 간단히 표현 -->
                </tr>  
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30"></td>
                </tr> 
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40"></td>
                </tr>
                <tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date" disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade"></td>
                </tr>  
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="button" onclick="isSubmit()">등록</button>
                        <button type="button" onclick="init()">다시쓰기</button>
                    </td>
                </tr>

            </table>
        </form>
        </section>
        <footer>
          HRDKOREA Copyright&copy;2016 ALL rights reserved Human Resources Development Sevice of Korea.
        </footer>
        <script type="text/javascript">
			const reg = document.forms[0].reg_date;
	        const today = new Date();
	        const year = today.getFullYear();
	        const month = (today.getMonth()+1).toString().padStart(2,0);
	        const day = today.getDate().toString().padStart(2,0);
	        reg.value=[year,month,day].join('');
        </script>
      </div>
</body>
</html>