<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex01_result.jsp <br>
<!-- 
서블릿 화일의 위치 -> 자바로 바뀐 파일 위치
D:\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\01_Basic\org\apache\jsp\_02_005frequest
 -->
<!-- 
HttpServletRequest request = new HttpServletRequest();
request : new로 객체생성안해도 되는 내장 객체
객체 생성 없이 바로 객체 사용 하는 이유 : 내장 객체이기에 따로 객체 생성 안해도 사용 가능
 -->
<%	
	/* 
	한글처리 - 값 받아오기 전에 작성
	**get방식은 자동으로 한글처리되지만 post방식은 한글이 깨지기 때문에 작성하는것이 좋다
	ㄴ*/
	request.setCharacterEncoding("UTF-8");
	/* 
	getParameter("name 속성값")
	-> name 속성값에 담긴 것을 문자열로 가져오기 때문에 받는 변수는 String 타입만 가능
	*/
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

이름 : <%=name %> <br>
나이 : <%=age%> <br>

전송방식 : <%= request.getMethod() %> <br>
요청 URI : <%= request.getRequestURI() %> <br>
컨텍스트 : <%= request.getContextPath() %> <br>

<!-- 
class Person {
	private String name;
	private int age;
	
	public void setName(string name){
		this.name = name
	}
	
	public int getAge() {
		return age;
	}
}

Person per = new Person();
per.setName("윤아");

Date dd = new Date();
dd.toLocaleString();
 -->