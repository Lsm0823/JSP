<!-- guestbook/login.jsp -->
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="login" class="guestbook.JoinBean" scope="session"/>

<%
		String id = (String)session.getAttribute("idKey");
		String url = request.getParameter("url");
%>

<title>로그인</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<body bgcolor="#996600">
<br><br>
<div align="center">
<%
		if(id!=null){
			%>
				<b><%=login.getName()%></b>님 환영합니다.<br>
				<a href="showGuestBook.jsp" >방명록 </a>&nbsp;
				<a href="logout.jsp" >로그아웃</a>
			<%
		}else{
%>
<h2>GuestBook 로그인</h2>
<form method="post" action="loginProc.jsp">
<table border="1">
	<tr>
		<td>id</td>
		<td> <input name="id" value="aaa">
		</td>
	</tr>
	<tr>
		<td>pwd</td>
		<td><input name="pwd" value="1234"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="hidden" name = "url" value = "<%=url %>">
		<INPUT TYPE="submit" value="로그인">
		</td>
	</tr>
</table>
</form>
<%}%>
</div>
</body>








