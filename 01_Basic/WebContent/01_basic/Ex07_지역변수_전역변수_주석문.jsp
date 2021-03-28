<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	String id = "kim"; // 전역변수
	String name = "김연아"; // 전역변수 값이 없을 때는 기본 null 출력
	
	public String getId() {
		return id;
	}
%>

<%
	String id = "pack";
	//String name =  "박찬호";
	// 지역변수 이름이 같을 때 : Duplicate local variable name
	// String name;
	// 지역변수 값이 없을 때 : The local variable name may not have been initialized
	String comment = "주석문";
%>

<%= getId()%><br>
name : <%= name%><br>
comment1 : <%= comment%><br>
comment2 : <%-- <%= comment%> --%><br>
comment3 : <!-- <%= comment%> --><br>
<%-- comment3 : <%= comment%><br> --%>

<!-- 
지역변수와 전역변수의 차이
스크립트릿 안에 있는 것은 지역변수로 사용
선언문 안에 있는 것은 전역변수로 사용

지역변수는 값을 안 넣으면 초기화를 안했다고 에러가 출력되고
전역변수는 값을 안 넣으면 null값이 출력

지역변수가 없으면 전역변수로 출력됨
지역변수가 순위가 더 높음

JSP 주석문 : 코드에서 java 자체를 감춰서 실행하지 않고 실행문에서도 안보임
HTML 주석문 : 코드에서는 java 값을 실행하여 가지고 있지만 실행문에서 안보임
 -->