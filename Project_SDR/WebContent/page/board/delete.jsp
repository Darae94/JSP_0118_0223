<%@page import="myPkg.board.BoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="myPkg.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

delete.jsp<br>

<%
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	
	String delPath = config.getServletContext().getRealPath("images");
	File dir = new File(delPath);
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO bdto = bdao.getBoardByNum(num);
	String img = bdto.getBfile();
	System.out.println(delPath+"/ "+img);
	if(img != null) {
		File delFile = new File(dir, img);
	}
	
	// 파일 있는 경우 삭제 필요함!
	int cnt = bdao.deleteLecture(num);
	String msg = "삭제 실패", url="history.back(-1)";
	if(cnt > 0) {
		msg = "삭제 성공";
		url = "location.href='../board/list.jsp?pageNum="+pageNum+"'";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>했습니다.");
	<%=url%>;
</script>
