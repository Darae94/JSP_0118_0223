<%@page import="myPkg.message.MessageDao"%>
<%@page import="myPkg.message.MessageBean"%>
<%@page import="myPkg.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String num = request.getParameter("num");

	MemberDao mdao = MemberDao.getInstance();
	ArrayList<MemberBean> members = mdao.getAllMember();
	
	MessageDao md = MessageDao.getInstance();
	MessageBean mb = md.getMessageByNum(num);
%>

<div class="container theme-showcase">
	<h3 class="page-header">메시지 수정</h3>
	<form action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table class="table">
			<tr>
				<th width=20%>받는 사람</th>
				<td><%=mb.getToInfo()%></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="subject" value="<%=mb.getSubject()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name=content maxlength=160 cols=50 rows=3 class="form-control"><%=mb.getContent()%></textarea></td>
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