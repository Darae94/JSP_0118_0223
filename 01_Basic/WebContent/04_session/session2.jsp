<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

session1.jsp => session2.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Object sid = session.getAttribute("id");
	String spw = (String)session.getAttribute("pw");
	
	String sports = request.getParameter("sports");
	String game = request.getParameter("game");

if(sid != null) {
%>

id : <%=id%><br>
session_id : <%=sid%><br>
passwd : <%=passwd%><br>
session_passwd : <%=spw%><br>
sports : <%=sports%><br>
game : <%=game%><br>

<%
	// 설정한 session 무효화
	session.invalidate();
} else { // sid 값이 없는경우
	out.print("로그인을 하세요.");
}
%>
