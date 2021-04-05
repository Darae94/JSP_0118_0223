<%@page import="myPkg.member.MemberBean"%>
<%@page import="myPkg.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String id = request.getParameter("id");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mbean = mdao.getSearch(id);
	
	String rank = "관리자";
	if(mbean.getRank() == 1) rank="학생";
	else if(mbean.getRank() == 2) rank="강사";
	String hp = "0" + mbean.getHp1();
%>

<div class="container theme-showcase">
	<h3 class="page-header">회원 수정</h3>
	<form name="f" action="updatePro.jsp" method="post"onSubmit="return writeSaveJquery()" >
		<input type="hidden" name="no" value="<%=mbean.getNo()%>">
		<table class="table table-striped">
			<tr>
				<td colspan="2" align="center" bgcolor="#FFCC00">
					<font size="3" color="#5D1900"><b>◈ 가입 정보 ◈</b></font>
				</td>
			</tr>
			<tr>
				<th>* 가입 회원 구분</th>
				<td><%=rank%></td>				
			</tr>
			<tr>
				<th> * 회원 아이디 </th>
				<td><%=mbean.getId()%></td>
			</tr>
			<tr>
				<th> * 비밀 번호</th>
				<td><input maxlength="12" type="password" name="pw" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#FFCC00">
					<font size="3" color="#5D1900"><b>◈ 개인 신상 정보 ◈</b></font>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=mbean.getName()%>" class="form-control"> <span class="alert-warning"> * 성과 이름을 붙여주세요 (예)홍길동</span></td>
			</tr>
			<tr>
				<th> E-Mail </th>
				<td>
					<input type="text" name="email" value="<%=mbean.getEmail()%>" class="form-control" class="form-control"> 
				</td>
			</tr>
			<tr>
				<th>휴대 전화 번호</th>
				<td>
					<select name="hp1" class="form-control">
						<option value="010"
						<% if(hp.equals("010")){ %> selected<% } %>
						>010</option>
						<option value="011"
						<% if(hp.equals("011")){ %> selected<% } %>
						>011</option>
					</select>
					- 
					<input type="text" name="hp2" size="4" maxlength="4" value="<%=mbean.getHp2()%>" class="form-control"> - 
					<input type="text" name="hp3" size="4" maxlength="4" value="<%=mbean.getHp3()%>" class="form-control"> <span class="alert-warning"> * 예) 010-0000-0000</span>
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="date" name="birth" class="form-control" value="<%=mbean.getBirth()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기" class="btn btn-primary">
					<input type="reset" value="취소" class="btn btn-danger">
				</td>
			</tr>	
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>
