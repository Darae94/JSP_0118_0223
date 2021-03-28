<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	%>
	<!-- new Calendar() public 생성자 호출 - 객체 생성하는 경우만 사용 가능 -->
	오늘은 
	<%= cal.get(java.util.Calendar.YEAR) %> 년 
	<%= cal.get(java.util.Calendar.MONTH)+1 %> 월 
	<%= cal.get(java.util.Calendar.DATE) %> 일
</body>
</html>
<%-- : JSP주석
<% %> : scriptlet 
<%= %> : 표현식
--%>