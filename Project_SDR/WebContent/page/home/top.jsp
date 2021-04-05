<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/custom.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/script.js"></script>

<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>

<%
	String memId = (String) session.getAttribute("memId");
	int memRank = (Integer) session.getAttribute("memRank");
	String main = request.getContextPath()+"/page/home/main.jsp";
	//System.out.println(memId+"/"+memRank);
	
	if(memId == null) {
		memId = "비회원";
		main = request.getContextPath()+"/main.jsp";
	}
	
	/*
	if(memRank == 0) // 관리자
	if(memRank == 1) // 학생
	if(memRank == 2) // 강사
	if(memId != "비회원") // 비회원
	 */
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=main%>">
				수강 신청 시스템
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="../lecture/list.jsp">강의 조회</a></li>
				<li><a href="../messenger/list.jsp">메시지함</a></li>
				<li><a href="../board/list.jsp">공지사항</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b><%=memId%></b>님 <span class="caret"></span></a>
					<% if(memId != "비회원") { %>
					<ul class="dropdown-menu" role="menu">
						<% if(memRank == 0) { %>
							<li><a href="../home/allMember.jsp">회원관리</a></li>
							<li><a href="../home/teacherLecture.jsp">강사별강의관리</a></li>
						<% } else { %>
							<li><a href="../member/update.jsp?id=<%=memId%>">정보 수정</a></li>
						<% } %>
						<li><a href="<%=request.getContextPath()+"/logout.jsp"%>">로그아웃</a></li>
					</ul>
					<% } %>
				</li>
			</ul>
        </div>			
	</div>
</nav>