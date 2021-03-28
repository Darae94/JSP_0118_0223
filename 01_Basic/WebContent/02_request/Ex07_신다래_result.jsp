<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String[] product = request.getParameterValues("product");
	String time = request.getParameter("time");
	String approve = request.getParameter("approve");
	String agree = request.getParameter("agree");
	
	if(agree.equals("on")) {
		agree = "동의함";
	}
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
			for(int i=0; i<product.length; i++){
				out.write(product[i]+" ");
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
		<td><%=agree%></td>
	</tr>
</table>
<p>

<table border=1>
<%
	Enumeration<String> f_name = request.getParameterNames();

	while(f_name.hasMoreElements()){
		String name = f_name.nextElement();
		
		String[] value = request.getParameterValues(name);
		out.print("<tr><td>"+name+"</td><td>");	
			for(String str : value) {
				if(str.equals("on")) {
					str = "동의함";
				}
				out.print(str+" ");
			}
		out.print("</td></tr>");
	}
%>
</table>