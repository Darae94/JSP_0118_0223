<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<div class="container theme-showcase">
	<h3 class="page-header">회원가입</h3>
	<form name="f" action="registerPro.jsp" method="post" onSubmit="return writeSave()">
		<table class="table table-striped">
			<tr>
				<td colspan="2" align="center" bgcolor="#FFCC00">
					<font size="3" color="#5D1900"><b>◈ 가입 정보 ◈</b></font>
				</td>
			</tr>
			<tr>
				<th>* 가입 회원 구분</th>
				<td>
					<input type="radio" name="rank" value="1" checked> <span class="w20">학생</span>
					<input type="radio" name="rank" value="2"> <span class="w20">강사</span>
				</td>				
			</tr>
			<tr>
				<th> * 회원 아이디 </th>
				<td>
					<input placeholder="영문소문자, 숫자, _ 포함 작성" maxlength="12" type="text" name="id" class="form-control">
					<input class="btn btn-sm btn-default" type="button" id="id_check" value="중복체크" onClick="return duplicate()"></input>
					<span id="idmessage"></span>
				</td>
			</tr>
			<tr>
				<th> * 비밀 번호</th>
				<td><input placeholder="영문소문자, 숫자, _ 포함 작성" maxlength="12" type="password" name="pw" class="form-control"></td>
			</tr>
			<tr>
				<th> * 비밀 번호 확인</th>
				<td>
					<input type="password" name="repw" id="repw" class="form-control">
					<span id="pwmessage"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#FFCC00">
					<font size="3" color="#5D1900"><b>◈ 개인 신상 정보 ◈</b></font>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="홍길동" class="form-control"> <span class="alert-warning"> * 성과 이름을 붙여주세요 (예)홍길동</span></td>
			</tr>
			<tr>
				<th> E-Mail </th>
				<td>
					<input type="text" name="email" value="gildong@naver.com" class="form-control" class="form-control"> 
				</td>
			</tr>
			<tr>
				<th>휴대 전화 번호</th>
				<td>
					<select name="hp1" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
					- 
					<input type="text" name="hp2" size="4" maxlength="4" value="1234" class="form-control"> - 
					<input type="text" name="hp3" size="4" maxlength="4" value="5678" class="form-control"> <span class="alert-warning"> * 예) 011-000-0000</span>
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="date" name="birth" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="가입하기" class="btn btn-primary">&nbsp;&nbsp;
					<input type="reset" value="취소" class="btn btn-danger">
				</td>
			</tr>	
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>
