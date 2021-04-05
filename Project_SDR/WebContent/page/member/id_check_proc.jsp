<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String input_id = request.getParameter("input_id");

	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean = mdao.getSearch(input_id);
	if(mbean == null) {
		out.print(true);
	} else {
		out.print(false);
	}
%>
    