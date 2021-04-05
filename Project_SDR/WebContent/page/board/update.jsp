<%@page import="myPkg.board.BoardDAO"%>
<%@page import="myPkg.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO bdto = bdao.getBoardByNum(num);
	
	String bfile = "<img style='width:80%' src = '"+request.getContextPath()+"/images/"+bdto.getBfile()+"'>";
	if(bdto.getBfile() == null) {
		bfile = "";
	}
%>

<div class="container theme-showcase">
	<h3 class="page-header">공지사항 수정</h3>
	<form action="updateProc.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="num" value="<%=bdto.getNum()%>">
		<table class="table">
			<tr>
				<th>제 목</th>
				<td><input style="width:100%" type="text" name="subject" value="<%=bdto.getSubject()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="bfile"><input type="hidden" name="bfile_be" value="<%=bdto.getBfile()%>"><%=bfile%></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea style="width:100%" name="content" cols=30 rows=8 class="form-control"><%=bdto.getContent()%></textarea></td>
			</tr>
			<tr>
				<th colspan=2 style="text-align:center">
					<input type="submit" value="수정하기" class="btn btn-primary" onclick="return writeSaveJquery()">
					<input type="reset" value="취소" class="btn btn-danger">
				</th>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../home/bottom.jsp" %>