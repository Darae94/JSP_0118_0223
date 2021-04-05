<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
searchIdPro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	System.out.println(name+" -> "+email);

	MemberDao mdao = MemberDao.getInstance();
	
	String msg="", url="";
	MemberBean mbean = mdao.getSearch(name, email);
	if(mbean == null) {
		msg = "찾는 아이디가 없습니다.";
		url = "history.back()";
	} else {
		msg = mbean.getId()+" 입니다.";
		url = "location.href='"+request.getContextPath()+"/main.jsp'";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=url%>;
</script>