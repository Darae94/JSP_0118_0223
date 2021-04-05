<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@page import="myPkg.lecture.LectureVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	MemberDao mdao = MemberDao.getInstance();
	ArrayList<String> teachers = mdao.getDataByRank(2);
	MemberBean mb = mdao.getSearch(memId);
	
	String num = request.getParameter("num");

	LectureDAO ldao = LectureDAO.getInstance();
	LectureVO lvo = ldao.getLectureByNum(num);
	
	//System.out.println(lvo.getLec_date()+" / "+lvo.getTime());
	String lec_date[] = lvo.getLec_date().split("~");;
	String time[] = lvo.getTime().split("~");
	//System.out.println(lec_date[0]);	

%>

<div class="container theme-showcase">
	<h3 class="page-header">강의 수정</h3>
	<form name="f" action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=lvo.getNum()%>">
		<table class="table table-double">
			<tr>
				<th>강의명</th>
				<td><input type="text" name="name" value="<%=lvo.getName()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>강사명</th>
				<td>
				<% if(memRank == 0) { %>
					<select name="teacher" class="form-control">
					<% for(String op : teachers) { %>
						<option value="<%=op%>"
						<% if(op.equals(lvo.getTeacher())) { %> selected<% } %>
						> <%=op%>
					<% } %>
					</select>
				<% } else { %>
					<input type="hidden" name="teacher" value="<%=mb.getName()%>"> <%=mb.getName()%>
				<% } %>
				</td>
			</tr>
			<tr>
				<th>강의 기간</th>
				<td>
					<input type="date" name="lec_date1" value="<%=lec_date[0]%>" class="form-control"> ~ 
					<input type="date" name="lec_date2" value="<%=lec_date[1]%>" class="form-control">
				</td>
			</tr>
			<tr>
				<th>강의 시간</th>
				<td>
					<select name="time1" class="form-control">
					<%
						for(int i=8; i<21; i++) {
							String times = (i<10) ? "0"+i+":00" : i+":00";
					%>
						<option value="<%=times%>"
						<% if(time[0].equals(times)) { %> selected<% } %>
						> <%=times%>
					<% } %>
					</select> ~ 
					<select name="time2" class="form-control">
					<%
						for(int i=9; i<22; i++) {
							String times = (i<10) ? "0"+i+":00" : i+":00";
					%>
						<option value="<%=times%>"
						<% if(time[1].equals(times)) { %> selected<% } %>
						> <%=times%>
					<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>강의 내용</th>
				<td>
					<textarea cols=30 rows=5 name="context" class="form-control"><%=lvo.getContext()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="강의수정" class="btn btn-primary" onclick="return writeSaveJquery()">
					<input type="reset" value="취소" class="btn btn-danger">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>