<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/top.jsp" %>

<%
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) pageNum = "1";
	
	int currentPage = Integer.parseInt(pageNum); // 현재 페이지 넘버
	int startPage = (currentPage - 1) * pageSize + 1;
	int endPage = currentPage * pageSize;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<BoardDTO> lists = bdao.getAllBoard(startPage, endPage);
	
	int count = bdao.getListCount(); // 게시물 총 갯수
	int number = count - (currentPage - 1) * pageSize;
%>

<div class="container theme-showcase">
	<h3 class="page-header">공지사항 목록 [<%=count%>]</h3>
	<% if(memRank == 0) { %><input type="button" value="공지사항 등록" class="btn btn-sm btn-default btn-right" onclick="location.href='write.jsp'"><% } %>
	<table class="table">
		<tr>
			<th width="12%">번 호</th>
			<th width="36%">제 목</th>
			<th width="20%">작성자</th>
			<th width="20%">작성일</th>
			<th width="12%">조회</th>
		</tr>
		<%
			if(lists.size() == 0) {
				out.print("<tr><td colspan=5 style='text-align:center'>공지사항이 없습니다.</td></tr>");
			} else {
				for(BoardDTO bd : lists) {
					//System.out.println(bd.getReg_date());
					Date day = sdf.parse(bd.getReg_date());
					//System.out.println(sdf.format(day));
		%>
		<tr>
			<td><%=number--%><% if(memRank == 0) { %> [<a href="javascript:deleteBoard(<%=bd.getNum()%>,<%=pageNum%>)">삭제</a>]<% } %></td>
			<td><a href="view.jsp?num=<%=bd.getNum()%>&pageNum=<%=pageNum%>"><%=bd.getSubject()%></a></td>
			<td><%=bd.getWriter()%></td>
			<td><%=sdf.format(day)%></td>
			<td><%=bd.getCount()%></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<div style="text-align:center">
	<%
		if(count > 0) {
			int pageNums = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 게시글에 따른 페이지 수
			
			int pageCount = 5; // 페이지 노출 숫자
			
			int start = ((currentPage - 1) / pageCount * pageCount) + 1;
			int end = start + pageCount - 1;
			if(end > pageNums) end = pageNums;
			//System.out.println("list.jsp : "+pageNums+"/"+start+"~"+end);
			
			// start 페이지숫자가  페이지노출 숫자보다 크면 이전 생성 - start보다 하나 작은 곳으로 이동
			if(start > pageCount) out.print(" <a href='list.jsp?pageNum="+(start - 1)+"'>[이전]</a> ");
			
			// 게시물과 페이지 노출 숫자에 따른 시작 페이지와 end 페이지를 구해서 그 만큼 아래 링크로 출력!
			for(int i=start; i<=end; i++) {
				out.print(" <a href='list.jsp?pageNum="+i+"'>[ "+i+" ]</a> ");
			}

			// 게시물의 페이지 숫자가  end 페이지숫자보다 크면 다음 생성 - end보다 하나 큰 곳으로 이동
			if(pageNums > end) out.print(" <a href='list.jsp?pageNum="+(end + 1)+"'>[다음]</a> ");
		}
	%>
	</div>
</div>

<%@ include file="../home/bottom.jsp" %>
