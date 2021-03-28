<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

top.jsp입니다.<br>
<%
	Date date = new Date();
%>

<%= date.toLocaleString() %> / <%=date %> / <%= date.toString() %>

<br>