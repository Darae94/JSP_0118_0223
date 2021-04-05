<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

loginProc.jsp<br>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id+" / "+pw);
	
	MemberDao mdao = MemberDao.getInstance();
	
	String msg="", url="";
	int cnt = mdao.getMemberCheck(id, pw);
	
	if(cnt > 0) {
		msg = id+"님 로그인 성공하셨습니다.";
		url = "location.href='"+request.getContextPath()+"/page/home/main.jsp'";
		// rank 이용
		MemberBean mbean = mdao.getSearch(id);
		session.setAttribute("memId", id); // 아이디 섹션 설정
		session.setAttribute("memRank", mbean.getRank()); // 회원구분 섹션 설정
	} else if(cnt == 0) {
		msg = "비밀번호를 틀렸습니다.";
		url = "history.back()";
	} else {
		msg = "회원이 아닙니다.";
		url = "history.back()";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=url%>
</script>
