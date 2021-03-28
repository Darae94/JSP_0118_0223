<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

applicationTest.jsp <br>

<%
	// ServletContext application =  new ServletContext();
	String path = application.getContextPath();
	//int a = 10;
%>

path : <%=path %><br>
<%-- <%=a %> --%>

<!-- HttpServletRequest request -->
request.getContextPath() : <%= request.getContextPath() %>

<!-- 
내장 객체
request : 페이지 실행될 때마다 생성되는 객체
response : 페이지 전환
session : 브라우저당 생성되는 객체
application
out : 출력하기 위한 구문
 -->