<%@page import="myPkg.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	MemberDao mdao = MemberDao.getInstance();
	ArrayList<String> teachers = mdao.getDataByRank(2);
	MemberBean mb = mdao.getSearch(memId);
%>

<div class="container theme-showcase">
	<h3 class="page-header">강의 등록</h3>
	<form name="f" action="writeProc.jsp" method="post">
		<table class="table table-double">
			<tr>
				<th>강의명</th>
				<td><input type="text" name="name" value="JAVA" class="form-control"></td>
			</tr>
			<tr>
				<th>강사명</th>
				<td>
				<% if(memRank == 0) { %>
					<select name="teacher" class="form-control">
					<% for(String op : teachers) { %>
						<option value="<%=op%>"> <%=op%>
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
					<input type="date" name="lec_date1" value="" class="form-control"> ~ 
					<input type="date" name="lec_date2" value="" class="form-control">
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
						<option value="<%=times%>"> <%=times%>
					<% } %>
					</select> ~ 
					<select name="time2" class="form-control">
					<%
						for(int i=9; i<22; i++) {
							String times = (i<10) ? "0"+i+":00" : i+":00";
					%>
						<option value="<%=times%>"> <%=times%>
					<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>강의 내용</th>
				<td>
					<textarea cols=30 rows=5 name="context" class="form-control">강의 내용입니다. 쉬는 시간은 1시간마다 10분씩 있으며 교재는 아래 추가 내용이나 공지 확인 부탁드립니다.</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="강의등록" class="btn btn-primary" onclick="return writeSaveJquery()">
					<input type="reset" value="취소" class="btn btn-danger">
					<input type="button" value="목록" class="btn btn-default" onClick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>