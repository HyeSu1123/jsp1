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
	String no =request.getParameter("num");
	int custno = Integer.parseInt(no);

	HrdMember vo = new HrdMember();
	vo.setAdderss(address);
	vo.setPhone(phone);
	vo.setCity(city);
	vo.setCustNo(custno);
	out.print(vo);
	
	HrdMemberDao dao = HrdMemberDao.getInstance();
	dao.update(vo);	//db에서 확인.
	if(dao.selectOne(vo.getCustNo()) !=null){
		out.print("<script>alert('회원수정 완료했습니다!');location.href='1_index.jsp'");
		out.print("</script>");
	}
	
%>
<!-- 회원 수정이 완료되면 1_index.jsp url로 이동하도록 해보기. -->
</body>
</html>