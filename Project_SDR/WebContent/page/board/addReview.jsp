<%@page import="myPkg.board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	String re_writer = request.getParameter("re_writer");
	String re_content = request.getParameter("re_content");
	
	//out.print(num+ "=>"+re_writer+", "+re_content);
	
	Date day= new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String re_reg_date = sdf.format(day);
	
	BoardDAO bdao = BoardDAO.getInstance();
	int cnt = bdao.updateReview(re_writer, re_content, re_reg_date, num);
	if(cnt > 0) {
		out.print("<b>["+re_writer+"]</b> "+re_content+" <i>("+re_reg_date+")</i>");
	} else {
		out.print("no");
	}
%>
