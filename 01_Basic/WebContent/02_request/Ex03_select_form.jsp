<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="post" action="Ex03_select_result.jsp">
	이름 : <input type="text" name="name"> <br>
	<p>
	나이 : <input type="text" name="age"> <br>
	<p>
	성별 : 남자 <input type="radio" name="gender" value="m">
		  여자 <input type="radio" name="gender" value="f"> <br>
	<p>
	취미 : <select name="hobby">
			<option value="Java공부">Java공부</option>
			<option value="TV시청">TV시청</option>
			<option value="만화보기">만화보기</option>
			<option value="게임">게임</option>
			<option value="등산">등산</option>
		</select>
	<p>
	색선택 : <select name="color">
			<option value="blue">파랑색</option>
			<option value="green">초록색</option>
			<option value="red">빨간색</option>
			<option value="yellow">기타</option>
		</select>
	<p>
	<input type="submit" value="보내기">
</form>