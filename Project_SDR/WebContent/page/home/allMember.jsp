<%@page import="myPkg.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>

<%
	MemberDao mdao = MemberDao.getInstance();
	ArrayList<MemberBean> list = mdao.getAllMember();
%>

<div class="container theme-showcase">
	<h3 class="page-header">회원 관리</h3>
	<table class="table table-bordered table-striped">
		<tr>
			<th rowspan=2 style="text-align: center; vertical-align: middle">*</th>
			<th>회원 번호</th>
			<th>회원 구분</th>
			<th>회원 이름</th>
			<th>회원 아이디</th>
			<th>회원 비밀번호</th>
		</tr>
		<tr>
			<th>회원 이메일</th>
			<th>회원 핸드폰번호</th>
			<th>회원 생일</th>
			<th>회원 가입일</th>
			<th>수정 / 삭제</th>
		</tr>
		<%
			int cnt = 0;
			for(MemberBean mb : list) {
				String rank = "관리자";
				if(mb.getRank() == 1) rank="학생";
				else if(mb.getRank() == 2) rank="강사";
				String hp = "0" + mb.getHp1() + "-" + mb.getHp2() + "-" + mb.getHp3();
				if(mb.getHp1() == 0) hp = "-";
				String birth = mb.getBirth();
				if(birth == null) birth= "-";
				String join = mb.getJoindate();
				if(join == null) join = "2021-01-01";
				cnt++;
		%>
		<tr>
			<td rowspan=2 style="text-align: center; vertical-align: middle"><%=cnt%></td>
			<td><%=mb.getNo()%></td>
			<td><%=rank%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getId()%></td>
			<td><%=mb.getPw()%></td>
		</tr>
		<tr>
			<td><%=mb.getEmail()%></td>
			<td><%=hp%></td>
			<td><%=birth%></td>
			<td><%=join%></td>
			<td>
				<a href="../member/update.jsp?id=<%=mb.getId()%>">수정</a>
				/
				<a href="javascript:deleteCheck(<%=mb.getNo()%>)">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</div>

<%@ include file="bottom.jsp" %>
