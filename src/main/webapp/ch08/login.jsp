<%@ page contentType="text/html; charset=UTF-8"%>
<%
		//세션에 id값을 가져온다.
		String id = (String)session.getAttribute("idKey");
%>
<h1>로그인</h1>
<%
		if(id!=null){
%>
<!-- 로그인 된 영역 -->
<%=id%>님 반갑습니다.
<a href="logout.jsp">로그아웃</a>
<%}else{%>
<!-- 로그인 안된 영역 -->
<form method="post" action="loginServlet">
id : <input name="id"><br/>
pwd : <input type="password" name="pwd"><br/>
<input type="submit" value="로그인">
</form>
<%}%>




