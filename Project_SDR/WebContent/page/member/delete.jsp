<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String no = request.getParameter("no");

	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.deleteMember(no);
	String msg = "삭제 실패";
	if(cnt > 0) {
		msg = "삭제 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="../home/allMember.jsp";
</script>
