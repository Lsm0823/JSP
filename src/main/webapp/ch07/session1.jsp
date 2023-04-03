<%@page contentType="text/html; charset=UTF-8"%>
<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//세션에 idkey라는 이름으로 아이디를 저장하겠다.
		session.setAttribute("idKey", id);
		//3분동안 사용하지 않으면 삭제
		session.setMaxInactiveInterval(60*3);	
		
%>

<h1>Session Example1</h1>
<form method="post" action="session1_1.jsp">
    1.가장 좋아하는 계절은?<br/>
	<input type="radio" name="season" value="봄">봄
	<input type="radio" name="season" value="여름">여름
	<input type="radio" name="season" value="가을">가을
	<input type="radio" name="season" value="겨울">겨울<p/>

	2.가장 좋아하는 과일은?<br/>
	<input type="radio" name="fruit" value="watermelon">수박
	<input type="radio" name="fruit" value="melon">멜론
	<input type="radio" name="fruit" value="apple">사과
	<input type="radio" name="fruit" value="orange">오렌지<p/>
	<input type="submit" value="결과보기">
</form>