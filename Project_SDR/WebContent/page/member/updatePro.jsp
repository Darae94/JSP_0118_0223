<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

updatePro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mbean" class="myPkg.member.MemberBean" />
<jsp:setProperty property="*" name="mbean"/>

<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.updateMember(mbean);
	String msg = "", url="";
	if(cnt > 0) {
		msg = "수정 성공했습니다.";
		url = "location.href='../home/allMember.jsp'";
	} else {
		msg = "수정 실패했습니다.";
		url = "history.back()";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=url%>;
</script>
