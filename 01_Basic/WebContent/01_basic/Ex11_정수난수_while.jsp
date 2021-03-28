<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
1부터 10사이의 정수 난수 발생하여
20번 반복하면서 7이 발생하면 반복 중단하기
7이 몇번째 발생하는지 확인
-->
<%
	int count = 1;
	boolean sevenNo = false;
	while(count<=20) {
		int x = (int)(Math.random()*10)+1;
		out.print(x+"<br>");
		if(x == 7) {
			out.print(count + "번째 : " + x + " 발생");
			sevenNo = true;
			break;
		}
		count ++;
	}
	if(sevenNo == false) out.print("7이 나오지 않았습니다.");
%>

<br><br>

<%
	count = 1;
	while(count<=20) {
		int x = (int)(Math.random()*10)+1;
%>
		<%=count %>번째: <%=x %> <br>
<%
		count ++;
		if(x == 7) {
			break;
		}
	}
%>

<br><br>

<%
	count = 1;
	while(count<=20) {
		int x = (int)(Math.random()*10)+1;
		out.print(count+"번째: "+x+"<br>");
		count ++;
		if(x == 7) {
			break;
		}
	}
%>

<%-- 
jsp 태그
<%@ %> 지시어 (import)
<%= %> 표현식 (변수 출력, 메소드 호출(리턴))
<%! %> 선언문 (전역변수랑 메소드 선언(정의))
<% %> 스크립트릿 (if, for, 자바코드)
주석 처리 JSP 자체 실행 안함 <%-- --%>