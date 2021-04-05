<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<div class="container theme-showcase">
	<h3 class="page-header">공지사항 작성</h3>
	<form action="writeProc.jsp" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>제 목</th>
				<td><input style="width:100%" type="text" name="subject" value="공지사항입니다." class="form-control"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="bfile"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea style="width:100%" name="content" cols=30 rows=8 class="form-control">홈페이지 사용 시 유의사항 공지드립니다.</textarea></td>
			</tr>
			<tr>
				<th colspan=2 style="text-align:center">
					<input type="submit" value="작성하기" class="btn btn-primary" onclick="return writeSaveJquery()">
					<input type="reset" value="취소" class="btn btn-danger">
					<input type="button" value="목록" class="btn btn-default" onClick="history.back()">
				</th>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>