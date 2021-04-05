<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");
	String id = (String) session.getAttribute("memId");
	//System.out.println(num+" "+id);

	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean = mdao.getSearch(id);
	System.out.println(mbean.getNo());
 	String stuNo = mbean.getNo()+",";
	//System.out.println(stuNo);

	LectureDAO ldao = LectureDAO.getInstance();
	int cnt = ldao.updateLecturebynum(num, stuNo);
	System.out.println("addStu.jsp cnt: "+cnt);
	String msg = "이전에 수강 신청";
	if(cnt > 0) {
		msg = "수강 신청 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>했습니다.");
	location.href="view.jsp?num=<%=num%>";
</script>
