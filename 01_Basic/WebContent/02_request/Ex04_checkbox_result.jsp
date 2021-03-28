<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex04_checkbox_result.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	// getParameterValues() -> 문자 배열을 받기에 값은 for문등의 반복문 필요
	String[] fruit = request.getParameterValues("fruit"); // 처음 선택한 하나만 넘어옴
%>

이름 : <%=name%><br>
<%-- 과일 : <%=request.getParameter("fruit")%><br> --%>
과일 갯수 : <%=fruit.length%><br>
과일 : 
<% 
for(String i : fruit) {
	out.print(i+" ");
}
%>
<br><br>
<% 
for(int i=0;i<fruit.length;i++) {
%>
	<%=fruit[i]%> , 
<%
}
%>
<br><br>

<% 
for(int i=0; i<fruit.length;i++) {
	out.print(fruit[i]+" ");
}
%>

