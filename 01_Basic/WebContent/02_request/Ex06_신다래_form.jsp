<%@ page contentType = "text/html; charset=UTF-8" %>
 
 
폼에 데이터를 입력한 후 '전송' 버튼을 클릭하세요.
<form action="Ex06_신다래_result.jsp" method="post"> 
이름: <input type="text" name="name" size="10"> <br>
주소: <input type="text" name="address" size="30"> <br>
좋아하는 계절 : 
	   봄 <input type="radio" name="season" value="봄" checked>
        여름 <input type="radio" name="season" value="여름" >
        가을 <input type="radio" name="season" value="가을" >
        겨울 <input type="radio" name="season" value="겨울" >
 <p><p>
좋아하는 영화장르:
	<input type="checkbox" name="movie" value="액션">액션
	<input type="checkbox" name="movie" value="애니메이션">애니메이션
	<input type="checkbox" name="movie" value="판타지">판타지
	<input type="checkbox" name="movie" value="공포">공포
<br> <p><p>
	 좋아하는 과일?<br>
	<select name="fruit" size="3" multiple>
		<option value="사과">사과</option>
		<option value="오렌지">오렌지</option>
		<option value="복숭아">복숭아</option>
		<option value="바나나">바나나</option>
		<option value="딸기">딸기</option>
		<option value="포도">포도</option>
	</select><br>
<input type="submit" value="전송">
</form>

