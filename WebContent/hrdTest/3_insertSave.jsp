<%@page import="koreait.dao.HrdMemberDao"%>
<%@page import="koreait.vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int custNo = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city_code");
	
	HrdMember vo = new HrdMember(custNo,name,tel,addr,null,grade,city);
	HrdMemberDao dao = HrdMemberDao.getInstance();
	dao.insert(vo);
	if(dao.selectOne(vo.getCustNo()) !=null){
		out.print("<script>alert('회원등록 완료했습니다!');location.href='1_index.jsp'");
		out.print("</script>");
	}
	
%>

<!-- 회원 등록이 완료되면 1_index.jsp url로 이동하도록 해보기. -->
</body>
</html>