<%@page import="myPkg.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String toInfo = request.getParameter("toInfo");
	if(toInfo == null) {
		toInfo = "admin";
	}
	
	MemberDao mdao = MemberDao.getInstance();
	ArrayList<MemberBean> members = mdao.getAllMember();
%>

<div class="container theme-showcase">
	<h3 class="page-header">메시지 작성</h3>
	<form action="writeProc.jsp" method="post">
		<input type="hidden" name="writer" value="<%=memId%>">
		<table class="table">
			<tr>
				<th width=20%>받는 사람</th>
				<td>
					<select name="toInfo" class="form-control">
					<%
						for(MemberBean mb : members) {
							if(!mb.getId().equals(memId)) {
					%>
						<option value="<%=mb.getName()%>-<%=mb.getId()%>" 
						<% if(mb.getId().equals(toInfo)) out.print("selected"); %>
						><%=mb.getName()%> [<%=mb.getId()%>]</option>
					<%
							}
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="subject" value="메시지 제목입니다." class="form-control"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name=content maxlength=160 cols=50 rows=3 class="form-control">메시지를 작성합니다.</textarea></td>
			</tr>
			<tr>
				<th colspan=2 style="text-align:center">
					<input type="submit" value="보내기" class="btn btn-primary" onclick="return writeSaveJquery()">
					<input type="reset" value="취소" class="btn btn-danger">
					<input type="button" value="목록" class="btn btn-default" onClick="history.back()">
				</th>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>