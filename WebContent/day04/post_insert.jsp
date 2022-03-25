<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day4 post 회원가입</title>
<style type="text/css">
	td,th{
    border: 1px dotted gray;
	}	
	td.col1_title {
	    text-align: center;
	    font-weight: bold;
	    width: 40%;
	    padding: 7px;
	}
	button {
	    padding: 5px 15px;
	    margin: 5px;
	}

input[type=text]{
    padding: 5px;
    margin-left: 10px;
}
	
</style>
<!-- src속성에 지정한 자바스크립트 소스가 그대로 삽입된다. -->
<script src="member_valid.js"></script>
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
<%
	HrdMemberDao dao = HrdMemberDao.getInstance();
	int next = dao.getNextSeq();
	
	//오늘 날짜 출력을 위한 문자열 만들기 방법2)
	LocalDate today = LocalDate.now();	//현재 시간 가져오기
	String strToday = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));	//특정패턴 문자열로 변환
	out.print(strToday);	//reg_date input요소의 value값으로 넣으면된다.(value=next처럼)
%>
<!-- Dao클래스에 insert() 메소드 만들고 지금화면 수정하기.
	- member_insert.jsp를 구현(사용자 입력값으로 db테이블에 insert하기) -->
	<h4 style="text-align: center;">홈쇼핑 회원 등록</h4>
        <form action="member_insert.jsp" method="post">
        <input name="num" type="hidden" value="<%=next %>">
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호</td>
                    <td><input type="text" name="num" value="<%=next%>"disabled="disabled"></td>
                    <!-- disabled가 설정되어 있으면 파라미터값 전달 안된다. : 필요한 값은 hidden으로 전달한다. -->
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
                        <!-- <button>저장</button> -->
                        <button type="button" onclick="isSubmit()">등록</button>
                        <button type="button" onclick="init()">다시쓰기</button>
                        <!--<button type="reset">다시쓰기</button>  
                        일반적으로는 type='reset'기능 사용보다는 선택적인 초기값으로 되돌리는 
                        자바스크립트 함수로한다.-->
                    </td>
                </tr>

            </table>
        </form>
        <script type="text/javascript">
			const reg = document.forms[0].reg_date;
	        const today = new Date();
	        const year = today.getFullYear();
	        const month = (today.getMonth()+1).toString().padStart(2,0);
	        const day = today.getDate().toString().padStart(2,0);
	        reg.value=[year,month,day].join('');
        </script>

</body>
</html>