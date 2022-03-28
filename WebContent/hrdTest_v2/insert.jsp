<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버 구현 코드는 html 태그없이 작성할 수 있다.
	HrdMemberDao dao = HrdMemberDao.getInstance();
	int next = dao.getNextSeq();

	request.setAttribute("next", next);
	pageContext.forward("2_insertForm.jsp"); //사용자 뷰

%>