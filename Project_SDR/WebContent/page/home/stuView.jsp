<%@page import="myPkg.member.MemberDao"%>
<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.lecture.LectureVO"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	
	MemberDao mdao = MemberDao.getInstance();

	LectureDAO ldao = LectureDAO.getInstance();
	LectureVO lvo =  ldao.getLectureByNum(num);
	String[] stuNo = lvo.getStuNo().split(","); 
%>

<div class="container theme-showcase">
	<h3 class="page-header"><%=lvo.getName()+" ( "+lvo.getLec_date()+" ) [ "+stuNo.length+"/"+lvo.getMaxcount()+" ] - "+lvo.getTeacher()%></h3>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>학생 이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>핸드폰번호</th>
		</tr>
		<%
			for(int s=0; s<stuNo.length; s++) {
				MemberBean mb = mdao.getSearchByNo(stuNo[s]);
				String hp = "0"+mb.getHp1()+"-"+mb.getHp2()+"-"+mb.getHp3();
		%>
		<tr>
			<td><%=s+1%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getId()%></td>
			<td><%=mb.getEmail()%></td>
			<td><%=hp%></td>
		</tr>
		<%
			}
		%>
	</table>
</div>

<%@ include file="../home/bottom.jsp" %>
