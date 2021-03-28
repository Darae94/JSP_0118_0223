<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex02_result.jsp <br>

<%
	String num1 = request.getParameter("num1");
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	// 숫자 변환
	int num01 = Integer.parseInt(num1);
	
	int result = 1;
	for(int i=0; i<num2; i++){
		result = result * num01;
	}
	
	int count = 0;
	int mul = 1;
	while(count < num2) {
		mul *= num01;
		count ++;
	}
%>

num1 : <%=num1 %> <br>
num2 : <% out.print(num2 + "<br>"); %>

result : <%=result%> <br>
결과 : <%= mul %> <br>
결과2 : <%= Math.pow(num01, num2) %> <!-- 실수 처리 -->