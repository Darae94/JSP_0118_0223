<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex05_result.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String[] pet = request.getParameterValues("pet");
	
	out.print("이름 : "+name+"<br>");
	out.print("주소 : "+address+"<br>");
	out.print("좋아하는 동물 : ");
	for(String i : pet) {
		out.print(i+" ");
	}
%>
<br>
<hr>
<br>
<%
	Enumeration<String> pEnum = request.getParameterNames();

	while(pEnum.hasMoreElements()) {
		String element = pEnum.nextElement();
		//out.print("element : "+element+"<br>");
		
		String[] values = request.getParameterValues(element);
		
		for(int i=0; i<values.length; i++) {
			out.print(element+" : "+values[i]+"<br>");
		}
	}
%>
