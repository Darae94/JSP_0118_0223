<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex06_신다래_result.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String season = request.getParameter("season");
	String[] movie = request.getParameterValues("movie");
	String[] fruit = request.getParameterValues("fruit");
%>

<%="이름 : "+name+"<br>"%>
<%="주소 : "+address+"<br>"%>
<%="좋아하는 계절 : "+season+"<br>"%>
좋아하는 영화장르 : 
<%
for(String i:movie){
	out.print(i+" ");
}
%>
<br>
좋아하는 과일 : 
<%
for(String i:fruit){
	out.write(i+" ");
}
%>

<hr>

<%
	Enumeration<String> lists = request.getParameterNames();

	while(lists.hasMoreElements()) {
		String list = lists.nextElement();
		String list0 = "";
		switch(list) {
		case "name" : list0 = "이름"; break;
		case "address" : list0 = "주소"; break;
		case "season" : list0 = "좋아하는 계절"; break;
		case "movie" : list0 = "좋아하는 영화장르"; break;
		case "fruit" : list0 = "좋아하는 과일"; break;
		}
%>
		* <%=list0%> : 
<%
			String[] item = request.getParameterValues(list);
			for(int i=0; i<item.length; i++){
%>
				<%=item[i]%> 
<%		
			}
%>
		<br>
<%
	}
%>
