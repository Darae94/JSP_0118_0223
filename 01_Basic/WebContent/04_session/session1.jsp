<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

form.jsp => session1.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	//out.print("아이디 : "+id+"<br>");
	//out.print("패스워드 : "+pw+"<br>");
%>
id : <%=id%><br>
passwd : <%=passwd%><br>
<hr>

<%
	//session -> 여러 페이지로 입력(저장)된 정보를 유지하여 전달하고자 할 때
	//HttpSession session = new HttpSession();
	session.setAttribute("id", id); // ("세션이름","세션으로 설정할 값")
	session.setAttribute("pw", passwd);
	
	session.setMaxInactiveInterval(10); // 세션 유지 시간(초)
	// default session 유지 시간 : 30분
%>

<form method="post" action="session2.jsp">
	<%-- 
	아이디 : <input type="hidden" name="id" value="<%=id%>"><p>
	패스워드 : <input type="hidden" name="passwd" value="<%=passwd%>"><p>
	--%>
	☆가장 좋아하는 스포츠를 선택하세요☆<br>
	<input type="radio" name="sports" value="태권도">태권도
	<input type="radio" name="sports" value="유도">유도
	<input type="radio" name="sports" value="수영">수영 <p>
	
	☆가장 좋아하는 게임을 선택하세요☆<br>
	<select name="game">
		<option value="카트라이더">카트라이더</option>
		<option value="리니지">리니지</option>
		<option value="기적의검">기적의검</option>
	</select><p>
	<input type="submit" value="전송">
</form>
