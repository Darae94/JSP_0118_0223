<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int a = 123;
	switch(a % 2) {
	case 0 : 
%>
짝수
<%
	break;
	case 1 : 
%>
홀수
<%
	break;
	}
%>

<br><br>

<%
	a = 123;
	switch(a % 2) {
	case 0 : out.print("짝수"); break;
	case 1 : out.print("홀수"); break;
	}
	
	out.print("<br><br>");
	
	String str = "apple";
	switch(str) {
	case "apple": out.print("사과"); break;
	case "grape": out.print("포도"); break;
	default : out.print("그 밖의 과일");
	}
%>