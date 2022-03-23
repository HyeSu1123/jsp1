<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2 request test</title>
</head>
<body>
	<!-- post_test.html 에서 사용자가 데이터 입력후
	submit 실행 하면 url : http://localhost:8081/jsp1/day03/request_test.jsp
	query string이 없다.(개발자 도구 f12 - 네트워크 탭 - ctrl+r - url선택 - payload - form data)
	form 태그에서 method설정 없으면 기본이 'get' : 쿼리 스트링으로 입력값 전달 (데이터조회할 때 사용)
										   사용자 요청의 URL 인코딩은 기본이 UTF-8
										  URL에 사용자 입력값이 보인다.
										  form태그 사용 외에도 a태그 href 속성값에 url로 전달할 수 있다.
			   method='post'로 하면  : form data로 입력값 전달(데이터 저장할 때 사용)
			   						이때 form data 인코딩은 직접 설정이 필요하다.
			   						URL에 사용자 입력값 없다
			   						day2의 member.Reg.html의 method는 'post'로 한다.
	-->
	<%
		request.setCharacterEncoding("UTF-8"); //method='post'에서는 꼭 필요.

		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3"); //null출력
		
		out.print("사용자 입력값 출력 테스트"); /*out도 jsp의 내장객체 이다.*/
		out.print("<br>data1=");
		out.print(data1);
		out.print("<br>data2=");
		out.print(data2);
		out.print("<br>data3=");
		out.print(data3);	/*post_test.html 입력요소 중에 name이 data3이 없다.*/
	%>
	
</body>
</html>