<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		document.write("hello<br>");
	</script>
	<!-- javascript로 hello 작성 -->
	가나다 <br>
	<!-- 자바코드 작성 : name 변수에 홍길동 넣기 -->
	<%
	/* 자바 변수 지정 - 지역변수 선언은 따로 있음 */
	String name = "홍길동";
	int age = 30;
	double height = 171.8;
	%>
	<b>저의 이름은 </b>
	<!-- 자바코드 작성 : name 변수에 넣은 홍길동 값 가져오기  -->
	<%= name%> 입니다.<br>
	저의 나이는 <%= age%> 살 입니다.<br>
	저의 키는 <%= height%> cm 입니다.
</body>
</html>

<!-- java DB Html css Javascript jQuery -->