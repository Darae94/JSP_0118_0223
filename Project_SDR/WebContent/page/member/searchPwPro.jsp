<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
searchPwPro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	System.out.println(id+", "+name+", "+email);
	
	MemberDao mdao = MemberDao.getInstance();
	
	String msg="", url="";
	MemberBean mbean = mdao.getSearch(id, name, email);
	if(mbean == null) {
		msg = "찾는 비밀번호가 없습니다.";
		url = "history.back()";
	} else {
		msg = mbean.getPw()+" 입니다.";
		url = "location.href='"+request.getContextPath()+"/main.jsp'";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=url%>;
</script>