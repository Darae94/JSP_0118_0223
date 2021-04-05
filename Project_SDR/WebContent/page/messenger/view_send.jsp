<%@page import="myPkg.message.MessageBean"%>
<%@page import="myPkg.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String num = request.getParameter("num");

	MessageDao md = MessageDao.getInstance();
	MessageBean mb = md.getMessageByNum(num);
%>

<div class="container theme-showcase">
	<h3 class="page-header">보낸 메시지 보기</h3>
	<table class="table table-bordered">
		<tr>
			<td colspan=2 style="text-align:right">
				<% if(mb.getToRead() == 1) { %> <!-- 받은 사람이 읽지 않으면 수정이나 삭제 가능 -->
					<input type="button" value="수정하기" class="btn btn-danger" onclick="location.href='update.jsp?num=<%=mb.getNum()%>'">
					<input type="button" value="삭제하기" class="btn btn-danger" onclick="javascript:deleteMsg(<%=mb.getNum()%>)">
				<% } %>
				<input type="button" value="목록보기" class="btn btn-default" onclick="location.href='list_send.jsp'">
			</td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td><%=mb.getWriter()%></td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td><%=mb.getToInfo()%></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td><%=mb.getReg_date()%></td>
		</tr>
		<tr>
			<th width="20%">제 목</th>
			<td><%=mb.getSubject()%></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><%=mb.getContent()%></td>
		</tr>
	</table>
</div>

