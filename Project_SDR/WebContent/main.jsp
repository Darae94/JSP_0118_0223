<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>로그인 화면</title>
<%
	session.setAttribute("memRank", 3);
%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/signin.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

<div class="container">
	<form name="myform" method="post" action="loginProc.jsp" class="form-signin">
		<table>
			<tr align="center">
				<td colspan=2><h3 class="form-signin-heading label label-info">강의 신청 시스템</h3></td>
			</tr>
			<tr height=40>
				<td align="center" width="30%">아이디</td>
				<td>
					<input type="text" name="id" value="admin" class="form-control">
				</td>
			</tr>
			<tr height=40>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pw" value="1234" class="form-control">
				</td>
			</tr>
			<tr class="lightgray">
				<td colspan=2 align="center" height=40>
					<input type="submit" value="로그인" class="btn btn-lg btn-primary btn-block">
					<input type="button" value="회원가입" class="btn btn-lg btn-default btn-block" onclick="location.href='page/member/register.jsp'">
					<input type="button" value="아이디 찾기" class="btn btn-lg btn-default btn-block" onclick="location.href='page/member/searchId.jsp'">
					<input type="button" value="비밀번호 찾기" class="btn btn-lg btn-default btn-block" onclick="location.href='page/member/searchPw.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>