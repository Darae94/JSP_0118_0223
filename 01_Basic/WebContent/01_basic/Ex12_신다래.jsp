<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border=1 style="text-align:center; width:900px">
  <tr style="background:pink">
	<%
		for(int i=2;i<10;i++){
			out.print("<th>" + i + "단</th>");
		}
	%>
  </tr>
  <%
  	for(int i=1;i<10;i++) {
  		out.print("<tr>");
		for(int j=2;j<10;j++){
			out.print("<td>" + j + "*" + i + "=" + (j*i) + "</td>");
		}
  		out.print("</tr>");
  	}
  %>
</table>


