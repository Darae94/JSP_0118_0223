<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex07_내이름_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String[] product = request.getParameterValues("product");
	String time = request.getParameter("time");
	String approve = request.getParameter("approve");
	String agree = request.getParameter("agree");
%>
<table border=1>
	<tr>
		<td>id</td>
		<td><%=id%></td>
	</tr>
	<tr>
		<td>pw</td>
		<td><%=pw%></td>
	</tr>
	<tr>
		<td>product</td>
		<td>
			<%
				for(int i=0; i<product.length; i++) {
					out.print(product[i]+" ");
				}
			%>
		</td>
	</tr>
	<tr>
		<td>time</td>
		<td><%=time%></td>
	</tr>
	<tr>
		<td>approve</td>
		<td><%=approve%></td>
	</tr>
	<tr>
		<td>agree</td>
		<td>
			<%
				if(agree.equals("on")) {
					out.print("동의함");
				}
				// 선택 안하면 null값이 넘어옴
			%>
		</td>
	</tr>
</table>
<br><br>

<table border=1>
	<%
	Enumeration<String> names = request.getParameterNames();
	while(names.hasMoreElements()) {
		String element = names.nextElement();
		String[] values = request.getParameterValues(element);
	%>
	<tr>
		<td><%=element %></td>
		<td>
			<%
				for(int i=0;i<values.length;i++) {
					if(values[i].equals("on")){
						out.print("동의함");
					} else {
						out.print(values[i]+" ");
					}
				}
			%>
		</td>
	</tr>
	<%
	} // while
	%>
</table>
