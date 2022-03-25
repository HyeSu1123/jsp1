<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String city = request.getParameter("city_code");
	int custno = Integer.parseInt(request.getParameter("num"));

	HrdMember vo = new HrdMember();
	vo.setAdderss(address);
	vo.setPhone(phone);
	vo.setCity(city);
	vo.setCustNo(custno);
	out.print(vo);
	
	HrdMemberDao dao = HrdMemberDao.getInstance();
	dao.update(vo);	//db에서 확인.
	
%>
</body>
</html>