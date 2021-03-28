<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int sum = 0;
	for(int i=1; i<=10; i++)
		sum += i;
%>

1~10 합 : <%= sum%> <br>
1~10 합 : <% out.print(sum); %> <br><br><br>


<%
	sum = 0;
	for(int i=1; i<=10; i++) {
		sum += i;
		out.print("1~"+i+" 합: "+sum+"<br>");
	}
%>
<br><br><br>

<%
	sum = 0;
	for(int i=1; i<=10; i++) {
		sum += i;
%>
		1~<%=i %> : <%= sum%> <br>
<%
	}
%>