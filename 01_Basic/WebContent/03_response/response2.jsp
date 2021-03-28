<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

response2.jsp <br>

<%
	String abc = request.getParameter("abc");
	System.out.println("response2.jsp abc : "+abc);
%>

response2.jsp abc : <%=abc+"<br>"%>
