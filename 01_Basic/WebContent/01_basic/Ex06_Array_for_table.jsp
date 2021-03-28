<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] str = {"JSP","정말","재미","있다"};
%>

	<table border=1 style="text-align:center">
		<tr>
			<td>첨자</td>
			<td>내용</td>
		</tr>
		<%
		for(int i=0; i<str.length;i++){
		%>
			<tr>
				<td><%= i%></td>
				<td><%= str[i]%></td>
			</tr>
		<%
		} // for
		%>
	</table>