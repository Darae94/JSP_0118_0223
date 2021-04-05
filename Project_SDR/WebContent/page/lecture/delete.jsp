<%@page import="myPkg.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

delete.jsp<br>

<%
	String num = request.getParameter("num");
	
	LectureDAO ldao = LectureDAO.getInstance();
	int cnt = ldao.deleteLecture(num);
	String msg = "삭제 실패", url="history.back(-1)";
	if(cnt > 0) {
		msg = "삭제 성공";
		url = "location.href='../lecture/list.jsp'";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>했습니다.");
	<%=url%>;
</script>
