<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num1 = 13;
	String str;
	if(num1>10) {
		str = "10보다 크다";
	} else if(num1<10) {
		str = "10보다 작다";
	} else {
		str = "10과 같다";
	}
%>

<%= str%><br><br>

<%
	int num = 13;
	if(num>10) { %>
		10보다 크다.
	<% } else if(num<10) { %>
		10보다 작다.
	<% } else { %>
		10과 같다.
	<% } %>
<br><br>

<%
	int num2 = 13;
	if(num2>10) {
		out.print("10보다 크다.");
		System.out.println("hahaha");
	} else if(num2<10) {
		out.print("10보다 작다.");
	} else {
		out.print("10과 같다.");
	}
%>