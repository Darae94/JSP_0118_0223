<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex06_내이름_result.jsp<br>

<%
	// 참조변수(객체 생성)
	request.setCharacterEncoding("UTF-8"); // 모든 데이터 한글 처리
	String name = request.getParameter("name");
	String addr = request.getParameter("address");
	String season = request.getParameter("season");
	String[] movie = request.getParameterValues("movie");
	String[] fruit = request.getParameterValues("fruit");
	// 다중 선택은 꼭 getParameterValues로 받아서 진행해야 모두 확인 가능
%>

이름 : <%=name %><br>
주소 : <%=addr %><br>
<%="주소2 : "+addr+"<br>"%>
계절 : 
	<%
		if(season == null) {
			out.print("계절 선택 안함");
		} else {
			out.print(season);
		}
	%><br>
영화 : 
	<%
		if(movie == null) {
			out.print("영화 선택 안함");
		} else {
			for(int i=0;i<movie.length;i++) {
				out.print(movie[i]+" ");
			}
		}
	%>
<br>
과일 : 
	<%
		if(fruit == null) {
			out.print("과일 선택 안함");
		} else {
			for(String s : fruit) {
				out.print(s+" ");
			}
		}
	%>
<br>

<hr>

<%
	Enumeration<String> names =	request.getParameterNames();
	
	while(names.hasMoreElements()) {
		String element = names.nextElement();

		String[] value = request.getParameterValues(element);
		for(int i=0;i<value.length; i++){
			out.print(element + ":"+value[i]+"<br>");
		}
	}
%>
