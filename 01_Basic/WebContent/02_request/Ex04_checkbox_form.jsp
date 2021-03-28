<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="post" action="Ex04_checkbox_result.jsp">
	이름 : <input type="text" name="name" value="홍길동"> <p>
	
	[과일 선택] <br>
	<input type="checkbox" name="fruit" value="포도">포도<br>
	<input type="checkbox" name="fruit" value="수박">수박<br>
	<input type="checkbox" name="fruit" value="사과">사과<br>
	<input type="checkbox" name="fruit" value="오렌지">오렌지<br>
	<p>
	<input type="submit" value="전송">
	<input type="reset" value="취소">
</form>
