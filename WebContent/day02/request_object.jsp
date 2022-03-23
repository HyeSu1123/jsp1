<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[3]</title>
</head>
<body>
	
	<h3>Request 객체의 정보</h3>
	<hr> 
	<!-- 요청 url : http://localhost:8081/jsp1/day02/request_object.jsp 
		요청 url의 localhost를 내 컴퓨터 ip로 바꿔보기 (cmd창에서 ipconfig 명령실행하면 ip알수 있음.)
		-->
		
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URI : <%=request.getRequestURI() %></li> <!-- U통합 R리소스 I식별자
													/jsp1/day02/request_object.jsp -->
		<li>컨텍스트(context) : <%=request.getContextPath() %></li>  <!-- 프로젝트이름 /jsp1 -->
		<li>서버 IP : <%= request.getLocalAddr() %>, 서버컴퓨터 이름 : <%= request.getLocalName() %></li>
		<li>서버 Port : <%= request.getLocalPort() %></li>
		<li>클라이언트 IP : <%= request.getRemoteAddr() %></li>  <!-- IPv6 (64바이트,16진수 16자리 ) 
																   IPv4 : 32비트-->
		<%    	//request 객체로 전달되는 인코딩 형식 설정.
				request.setCharacterEncoding("UTF-8"); //이 명령어 없으면 아래 결과는 null이 나온다.%>	
		<li>문자 인코딩 형식 : <%= request.getCharacterEncoding() %></li>
		<li></li>
	</ul>
	<!-- 출력 IPv4 설정 : Run -> Run Configurations -> tomcat -> Arguments -> VM Arguments 에 입력
								-Djava.net.preferIPv4Stack=true -> tomcat 재 실행 -->
	 
</body>
</html>