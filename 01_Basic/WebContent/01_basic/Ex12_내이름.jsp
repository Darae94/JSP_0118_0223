<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	tr {
		text-align: center;
	}
	th {
		background-color: #ddaadd;
	}
</style>
<table border="1">
	<tr>
	<%
	for(int k=2;k<=9;k++) {
	%>
		<th width="120"><%=k%>단</th>
	<%
	}
	%>
	</tr>
	<%
	for(int i=1;i<=9;i++) {
	%>
	<tr>
		<%
		for(int j=2;j<=9;j++) {
		%>
		<%-- <td><%=j%> * <%=i%> = <%= j*i %></td> --%>
		<td><%= j + "*" + i + "=" + (j*i) %></td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>
</table>

<!-- 테이블로 구구단 출력 -->