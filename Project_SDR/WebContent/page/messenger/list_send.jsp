<%@page import="myPkg.message.MessageBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../home/top.jsp" %>

<%
	MessageDao msg = MessageDao.getInstance();
	ArrayList<MessageBean> msgs = msg.getSendMessage(memId);
%>

<div class="container theme-showcase">
	<h3 class="page-header">메시지 목록</h3>
	<ul class="nav nav-pills" role="tablist">
		<li role="presentation"><a href="list.jsp">받은 메일함 <span class="badge"></span></a></li>
		<li role="presentation" class="active"><a href="list_send.jsp">보낸 메일함</a></li>
		<li style="float:right"><input type="button" onclick="location.href='write.jsp'" class="btn btn-default" value="메일 작성"/></li>
	</ul>
	<table class="table" id="send">
		<tr>
			<th width=10%>번호</th>
			<th width=50%>제목</th>
			<th width=20%>받는사람</th>
			<th width=20%>날짜</th>
		</tr>
		<%
			if(msgs.size() == 0) {
				out.print("<tr><td colspan=4 style='text-align:center'>발신된 메시지가 없습니다.</td></tr>");
			} else {
				int num = msgs.size();
				String a = "";
				for(MessageBean mb : msgs) {
					if(mb.getToRead() == 0) a = " (읽음)";
		%>
			<tr>
				<td><%=num--%></td>
				<td><a href="view_send.jsp?num=<%=mb.getNum()%>"><%=mb.getSubject()+a%></a></td>
				<td><%=mb.getToInfo()%></td>
				<td><%=mb.getReg_date()%></td>
			</tr>
		<%
				}
			}
		%>
	</table>
</div>

<%@ include file="../home/bottom.jsp" %>
