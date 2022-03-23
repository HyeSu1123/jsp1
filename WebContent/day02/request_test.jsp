<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2 request test</title>
</head>
<body>
	<!-- form_test.html 에서 사용자가 데이터 입력후
	submit 실행 하면 url : form_test.html?data1=ds&data2=ds 
	?data1=ds&data2=ds 은 query string이라고 한다. data1,data2는 사용자 입력 파라미터
	request_test.jsp 에서는 위의 데이터를 전달 받는다.
	-->
	<%
	//request는 jsp의 객체이다.(내장객체 : 선언하지않고 자동으로 쓸 수 있는 객체)
	//request 객체 타입은 HttpServletRequest 클래스이고 사용자가 요청을 보내는 객체이다.
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3"); //null출력
		
		out.print("사용자 입력값 출력 테스트"); /*out도 jsp의 내장객체 이다.*/
		out.print("<br>data1=");
		out.print(data1);
		out.print("<br>data2=");
		out.print(data2);
		out.print("<br>data3=");
		out.print(data3);	/*form_test.html 입력요소 중에 name이 data3이 없다.*/
	
		//만약에 data1,data2를 덧셈 등 연산을 해야한다면.->정수로 변환
		//int num1 = Integer.parseInt(data1);
		//int num2 = Integer.parseInt(data2);	
		//사용자 입력이 숫자가 아닌 문자가 포함되면 오류 : NumberFormatException: For input string: "abc"
		//int num3 = Integer.parseInt(data3);	//오류 원인 : NumberFormatException: null
		//out.print("<br>data1 + data2=");
		//out.print(num1+num2);
		
		/*결론 : 사용자 입력오류를 제거하기 위해 
		1) 프론트단에서 자바스크립트로 유효성 검사하기
		2) 서버단에서 try~catch로 처리하기*/
		
	%>
	
</body>
</html>