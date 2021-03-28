<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! /* 메서드 정의 */
	public int multiply(int a, int b) {
		int c = a * b;
		return c;
	}
%>

10 * 25 = <%= multiply(10,25)%>; <!-- 넘어오는 값이 있을때 -->

<%-- : JSP주석
<% %> : scriptlet 
<%= %> : 표현식
<%@ %> : 지시어(page, include, taglib)
<%! %> : 선언문 - 메서드 정의
--%>