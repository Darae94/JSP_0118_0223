<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

response1.jsp <br>

<%
	String msg = request.getParameter("msg");
%>

response1.jsp msg : <%=msg+"<br>"%>

<%
	System.out.println("msg : "+msg);
	// HttpServletResponse respon = new HttpServletResponse();
	response.sendRedirect("response2.jsp?abc="+msg);
	// 페이지 전환(redirect) 기능
%>
<!-- 
sendRedirect 사용시 값이 다른 이유 : request 객체를 공유하지 않는다.
 -->