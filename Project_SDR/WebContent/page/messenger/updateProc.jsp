<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="myPkg.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="msgb" class="myPkg.message.MessageBean" />
<jsp:setProperty property="*" name="msgb"/>

<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	msgb.setReg_date(sdf.format(date));
	
	MessageDao msgdao = MessageDao.getInstance();
	int cnt = msgdao.updateMessage(msgb);
	String msg = "실패", url = "list_send.jsp";
	if(cnt > 0) {
		msg = "성공";
	}
%>

<script type="text/javascript">
	alert("메시지 재전송 <%=msg%>했습니다.");
	location.href="<%=url%>";
</script>
<%-- 
<%=msgb.getNum()%><br>
<%=msgb.getWriter()%><br>
<%=msgb.getSubject()%><br>
<%=msgb.getToInfo()%><br>
<%=msgb.getContent()%><br>
<%=msgb.getReg_date()%><br>
<%=msgb.getToRead()%><br>
 --%>