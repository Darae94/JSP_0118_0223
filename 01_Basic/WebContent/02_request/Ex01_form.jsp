<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp<br>
<form method="post" action="Ex01_result.jsp">
	이름 : <input type="text" name="name" id="irum"> <p>
	나이 : <input type="text" name="age" id="nai"> <p>
	
	<input type="submit" value="확인">
</form>

<!-- 
** 웹서버 폴더의 위치
D:\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\01_Basic\02_request

input type="submit" : action 파일로 이동
form 안의 input의 name은 반드시 달라야함

<< method 방식 차이 >>
* get 방식
Ex01_result.jsp?name=kim&age=22 (넘어가는 데이터가 보임)
default-기본값
전달 속도 빠름
데이터 사이즈 제한 : 256byte

* post 방식
Ex01_result.jsp (넘어가는 데이터 보이지 않음, 꼭 UTF-8로 받아줘야함)
보안 좋음
데이터 사이즈 제한 없음
 -->
