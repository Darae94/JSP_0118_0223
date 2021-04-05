<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@page import="myPkg.lecture.LectureVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	LectureDAO ldao = LectureDAO.getInstance();
	ArrayList<LectureVO> list = ldao.getAllLecture();
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.getSearch(memId);
	
%>

<div class="container theme-showcase">
	<h3 class="page-header">강의 목록</h3>
	<% if(memRank == 0 || memRank == 2) { %><input type="button" value="강의 등록" class="btn btn-sm btn-default btn-right" onclick="location.href='write.jsp'"><% } %>
	<table class="table">
		<tr>
			<th width="10%">번호</th>
			<th width="30%">강의명</th>
			<th width="15%">강사명</th>
			<th width="30%">강의기간</th>
			<th width="15%">수강인원</th>
		</tr>
<%
	if(list.size() == 0) {
		out.print("<tr><td colspan=5 align=center>등록된 강의가 없습니다.</td></tr>");
	} else {
		int cnt = 0;
		for(LectureVO lvo : list) {
			int stu = 0;
			String check = "";
			if(lvo.getStuNo() != null) {
				String[] stuNo = lvo.getStuNo().split(",");
				stu = stuNo.length;
				for(String a : stuNo) {
					int no = Integer.parseInt(a);
					//System.out.println(no+" = "+mb.getNo());
					if(no == mb.getNo())
						check = " <small><font color=gray>(강의신청함)</font></small>";
				}
			}
			cnt ++;
%>
		<tr>
			<td><%=cnt%></td>
			<td><a href="view.jsp?num=<%=lvo.getNum()%>"><%=lvo.getName()%><%=check%></a></td>
			<td><%=lvo.getTeacher()%></td>
			<td><%=lvo.getLec_date()%></td>
			<td><%=stu+"/"+lvo.getMaxcount()%></td>
		</tr>
<%		
		}
	}
%>
	</table>
</div>

<%@ include file="../home/bottom.jsp" %>
