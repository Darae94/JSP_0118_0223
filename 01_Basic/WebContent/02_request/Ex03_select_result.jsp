<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex03_select_result.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	if(gender.equals("m")) {
		gender = "남자";
	} else {
		gender = "여자";
	}
	
	String hobby = request.getParameter("hobby");
	String color = request.getParameter("color");
	
	String col = "";
	
	switch(color) {
	case "blue" : col="파랑색"; break;
	case "red" : col="빨간색"; break;
	case "green" : col="초록색"; break;
	default : col="기타";
	}
%>

이름 : <%= name %><br>
나이 : <%= request.getParameter("age") %><br>
성별 : <%= gender %><br>
취미 : <% out.write(hobby + "<br>"); %>
선택한 색 : <%=col %> <img src="../images/<%=color%>.jpg"> <br>
<%
	out.print("<img src='../images/"+color+".jpg'>");
%> <br>
<img src="../images/<%=color+".jpg"%>" border="2">