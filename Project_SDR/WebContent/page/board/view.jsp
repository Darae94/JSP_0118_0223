<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.board.BoardDAO"%>
<%@page import="myPkg.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO bd = bdao.getBoardByNum(num);
	
	Date date = sdf.parse(bd.getReg_date());
	//System.out.println(sdf.format(date));
	
	//System.out.println(bd.getBfile());
	String bfile = "<img style='width:80%' src = '"+request.getContextPath()+"/images/"+bd.getBfile()+"'>";
	if(bd.getBfile() == null) {
		bfile = "";
	}
%>

<div class="container theme-showcase">
	<h3 class="page-header">공지사항 보기</h3>
	<table class="table table-bordered" id="tbl">
		<tr>
			<td colspan=2 style="text-align:right">
				<% if(memRank == 0) { %>
					<input type="button" value="수정하기" class="btn btn-danger" onclick="location.href='update.jsp?num=<%=bd.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="삭제하기" class="btn btn-danger" onclick="javascript:deleteBoard(<%=bd.getNum()%>,<%=pageNum%>)">
				<% } %>
				<input type="button" value="목록보기" class="btn btn-default" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
		<tr>
			<th width="20%">제 목</th>
			<td><%=bd.getSubject()%> (조회 수 : <%=bd.getCount()%>)</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=bd.getWriter()%></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td><%=sdf.format(date)%></td>
		</tr>
		<tr>
			<th>파 일</th>
			<td><%=bfile%></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><%=bd.getContent()%></td>
		</tr>
		<tr>
			<th colspan=2 style="text-align:center"><b>** 댓글 **</b></th>
		</tr>
		<tr>
			<td colspan=2 style="text-align: center;">
				<input type="hidden" name="num" value="<%=bd.getNum()%>" class="form-control">
				아이디 : <input type="text" readonly name="re_writer" value="<%=memId%>" class="form-control"> &nbsp; &nbsp;
				댓 글 : <input type="text" maxlength=50 name="re_content" value="댓글을 입력합니다." class="form-control"> &nbsp; &nbsp;
				<input type="button" value="댓글 작성" class="btn btn-primary" onclick="javascript:review()">
			</td>
		</tr>
		<%
			//System.out.println(bd.getRe_writer());
			if(bd.getRe_writer() == null) {
		%>
		<tr id="noreview">
			<td colspan=2 style="text-align:center">
				 <b>댓글이 없습니다.</b>
			</td>
		</tr>
		<%
			} else {
				String[] re_w = bd.getRe_writer().split("/");
				String[] re_c = bd.getRe_content().split("/");
				String[] re_d = bd.getRe_reg_date().split("/");
				for(int i=0; i<re_w.length; i++) {
		%>
		<tr>
			<td colspan=2 style="text-align:center">
				 <b>[<%=re_w[i]%>]</b> <%=re_c[i]%> <i>(<%=re_d[i]%>)</i>
			</td>
		</tr>
		<%
				}
			}
		%>
	</table>
</div>

