<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
registerPro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	MemberDao mdao = MemberDao.getInstance();
%>

<jsp:useBean id="mbean" class="myPkg.member.MemberBean" />
<jsp:setProperty property="*" name="mbean"/>

<%
	Date day = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String joindate = df.format(day);
	mbean.setJoindate(joindate);
	
	int cnt = mdao.insertMember(mbean);
	String msg = "", url="";
	if(cnt > 0){
		msg = "가입 성공";
		url = request.getContextPath()+"/main.jsp";
	}
	else{
		msg = "가입 실패";
		url = "register.jsp";
	}
	
%>
<script type="text/javascript">
	alert("<%=msg%>" + "했습니다.");
	location.href = "<%=url%>";
</script>
