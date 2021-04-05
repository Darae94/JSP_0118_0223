<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@page import="myPkg.lecture.LectureDAO"%>
<%@page import="myPkg.lecture.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String num = request.getParameter("num");

	LectureDAO ldao = LectureDAO.getInstance();
	LectureVO lvo = ldao.getLectureByNum(num);
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.getSearch(memId);
	
	int stu = 0;
	String check = "";
	String[] stuNo = {};
	if(lvo.getStuNo() != null) {
		stuNo = lvo.getStuNo().split(",");
		for(String a : stuNo) {
			int no = Integer.parseInt(a);
			//System.out.println(no+" = "+mb.getNo());
			if(no == mb.getNo())
				check = " <small><font color=gray>(강의신청함)</font></small>";
		}
		stu = stuNo.length;
	}
%>

<div class="container theme-showcase">
	<h3 class="page-header">강의 상세 내용</h3>
	<table class="table table-bordered">
		<tr>
			<th width="20%">강의명</th>
			<td><%=lvo.getName()%><%=check%></td>
		</tr>
		<tr>
			<th>강사명</th>
			<td><%=lvo.getTeacher()%></td>
		</tr>
		<tr>
			<th>수강인원</th>
			<td>
				<% if(lvo.getTeacher().equals(mb.getName())) { %>
					<a href="../home/stuView.jsp?num=<%=lvo.getNum()%>"><%=stu%></a>
				<% } else { %>
					<%=stu%>
				<% } %>
				/ <%=lvo.getMaxcount()%>
			</td>
		</tr>
		<tr>
			<th>강의기간</th>
			<td><%=lvo.getLec_date()%></td>
		</tr>
		<tr>
			<th>강의시간</th>
			<td><%=lvo.getTime()%></td>
		</tr>
		<tr>
			<th>강의 내용</th>
			<td class="text01"><%=lvo.getContext()%></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
			<%
				if(memRank == 0) { // 관리자
			%>
				<input type="button" value="삭제하기" onClick="javascript:deleteLecture(<%=lvo.getNum()%>)" class="btn btn-danger">
			<%
				}

				if(memRank == 0 || lvo.getTeacher().equals(mb.getName())) { // 관리자 또는 해당 강사
			%>
				<input type="button" value="수정하기" onClick="location.href='update.jsp?num=<%=lvo.getNum()%>'" class="btn btn-primary">
			<%
				}
				
				if(memRank == 1 && stu < lvo.getMaxcount()) { // 학생
			%>
				<input type="button" value="강의 신청하기" onClick="javascript:lecAddStu(<%=lvo.getNum()%>,'<%=lvo.getName() %>','<%=lvo.getTeacher()%>')" class="btn btn-primary">
			<%
				}
			%>
				<input type="button" value="강의 목록 보기" onClick="location.href='list.jsp'" class="btn btn-default">
			</td>
		</tr>
	</table>
</div>

