<%@page import="myPkg.lecture.LectureVO"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@page import="myPkg.member.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	MemberDao mdao = MemberDao.getInstance();
	ArrayList<String> teachers = mdao.getDataByRank(2);

	String tName = request.getParameter("teacher");

	LectureDAO ldao = LectureDAO.getInstance();
	ArrayList<LectureVO> list = new ArrayList<LectureVO>();
	if(tName != null) {
		 list = ldao.getLectureByTeacher(tName);
	}
%>

<div class="container theme-showcase">
	<h3 class="page-header">강사별 강의 목록</h3>
	<table class="table table-bordered">
		<tr>
			<td colspan=7 style="text-align:center">
				<form name="f" action="teacherLecture.jsp" method="post">
					강사명 : 
					<select name="teacher" class="form-control" style="display:inline">
					<% for(String t : teachers) { %>
						<option value="<%=t%>"
						<% if(t.equals(tName)) { %> selected<% } %>
						> <%=t%>
					<% } %>
					</select>
					<input type="submit" value="조회하기" class="btn btn-sm btn-info">
				</form>
			</td>
		</tr>
		<tr>
			<th>번 호</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>강의기간</th>
			<th>강의시간</th>
			<th>수강인원</th>
			<th>수강생</th>
		</tr>
		<%
			if(list.size() == 0) {
				out.print("<tr><td colspan=7 style='vertical-align:middle; text-align:center;height:50px'><font color=orange>해당 강사의 강의가 없습니다.</font></td></tr>");
			} else {
				int cnt = 0;
				for(LectureVO lv : list) {
					cnt ++;
					System.out.println("teacherLecture.jsp : "+lv.getStuNo());
					int count;
					if(lv.getStuNo() == null) {
						count = 0;
					} else {
						String[] stu = lv.getStuNo().split(",");
						count = stu.length;
					}
		%>
		<tr>
			<td><%=cnt%></td>
			<td><%=lv.getTeacher()%></td>
			<td><%=lv.getName()%></td>
			<td><%=lv.getLec_date()%></td>
			<td><%=lv.getTime()%></td>
			<td><%=count+"/"+lv.getMaxcount()%></td>
			<td><% if(count > 0) {%><a href="stuView.jsp?num=<%=lv.getNum()%>">보기</a><% } else { out.print("없음"); } %></td>
		</tr>
		<% 
				}
			}
		%>
	</table>
</div>

<%@ include file="bottom.jsp" %>
