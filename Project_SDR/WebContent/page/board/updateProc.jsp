<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="myPkg.board.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int maxSize = 1024 * 1024 * 5;
	String encoding = "UTF-8", folder = "images";
	
	String configFolder = config.getServletContext().getRealPath(folder);
	//System.out.println(configFolder);
	
	MultipartRequest multi = new MultipartRequest(
				request, // 입력받기
				configFolder, // 얼로드할 폴더의 위치
				maxSize, // 업로드할 화일의 크기
				encoding, // 한글처리
				new DefaultFileRenamePolicy() // 동일한 화일 이름 다르게 저장
			);

	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String pageNum = multi.getParameter("pageNum");
	String num = multi.getParameter("num");
	String bfile_be = multi.getParameter("bfile_be");
 	
	Enumeration<String> images = multi.getFileNames();
	String imgSrc = "";
	while(images.hasMoreElements()) {
		String img = images.nextElement();
		
		imgSrc = multi.getFilesystemName(img);
	}
	//System.out.println(pageNum+"&"+num+": "+subject+"/"+content+"/"+bfile_be+"/"+imgSrc);
	
	if(bfile_be != null) {
		if(imgSrc != null) {
			File dir = new File(configFolder);
			File delFile = new File(dir, bfile_be);
			delFile.delete();
		} else {
			imgSrc = bfile_be;
		}
	}
	
	BoardDAO bdao = BoardDAO.getInstance();
	int cnt = bdao.updateBoard(subject, content, imgSrc, num);
	String msg = "실패";
	if(cnt > 0) {
		msg = "성공";
	}
%>

<script type="text/javascript">
	alert("공지사항 수정 <%=msg%>했습니다.");
	location.href="view.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
</script>
