<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	public int add(int a, int b) {
		int c = a + b;
		return c;
	}
	
	public int subtract(int a, int b) {
		int c = a - b;
		return c;
	}
%>

<%
	int value1 = 3;
	int value2 = 10;
	
	int addResult = add(value1,value2);
	int subtractResult = subtract(value1,value2);
%>

결과 1 : <%= value1%> + <%= value2%> = <%= addResult%><br>
결과 2 : <%= value1%> - <%= value2%> = <%= subtractResult%><br>
결과 3 : <%= value2%> - <%= value1%> = <%= subtract(value2,value1)%><br>