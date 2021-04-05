<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<div class="container theme-showcase">
	<h3 class="page-header">비밀번호 찾기</h3>
	<form action="searchPwPro.jsp" method="post" onSubmit="return writeSave()">
		<table class="table table-bordered">
			<tr>
				<th align="center">아이디</th>
				<td>
					<input type="text" name="id" class="form-control" value="hong">
				</td>
			</tr>
			<tr>
				<th align="center">이름</th>
				<td>
					<input type="text" name="name" class="form-control" value="홍길동">
				</td>
			</tr>
			<tr>
				<th align="center">E-Mail</th>
				<td>
					<input type="text" name="email" class="form-control" value="gildong@naver.com">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="비밀번호 찾기" class="btn btn-primary">
					<input type="reset" value="취소" class="btn btn-danger">
				</td>
			</tr>	
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>
