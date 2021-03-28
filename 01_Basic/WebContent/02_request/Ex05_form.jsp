<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="post" action="Ex05_result.jsp">
	이름 : <input type="text" name="name"> <p>
	주소 : <input type="text" name="address"> <p>
	
	좋아하는 동물 :
	<input type="checkbox" name="pet" value="dog">강아지 
	<input type="checkbox" name="pet" value="cat">고양이 
	<input type="checkbox" name="pet" value="pig">돼지 
	<p>
	<input type="submit" value="전송">
</form>