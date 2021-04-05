<%@page import="myPkg.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="lvo" class="myPkg.lecture.LectureVO" />
<jsp:setProperty property="*" name="lvo"/>

<%
	String lec_date1 = request.getParameter("lec_date1");
	String lec_date2 = request.getParameter("lec_date2");
	String time1 = request.getParameter("time1");
	String time2 = request.getParameter("time2");
	
	lvo.setLec_date(lec_date1+"~"+lec_date2);
	lvo.setTime(time1+"~"+time2);
	
	LectureDAO ldao = LectureDAO.getInstance();
	int cnt = ldao.insertLecture(lvo);
	
	int listCount = ldao.getAllCount();
	System.out.println("write num: "+listCount);
	String msg = "", url = "";
	if(cnt > 0) {
		msg = "강의 등록 성공했습니다.";
		url = "location.href='list.jsp'";
	} else {
		msg = "강의 등록 실패했습니다.";
		url = "history.go(-1)";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=url%>;
</script>
