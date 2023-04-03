<%@page import="ch09.TeamBean"%>
<%@page import="ch09.MyUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr" />

<%
	int num = MyUtil.parseInt(request, "num");
	TeamBean bean = mgr.getTeam(num);
	String name = request.getParameter("name");
	mgr.updateTeam(bean);		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h1>Team Update</h1>
<form name="frm" method="post" action="teamUpdateProc.jsp">
<table border="1">
<tr>
	<td width="50" align="center">번호</td>
	<td width="150"><input name="num" value="<%=num%>" readonly></td>
</tr>
<tr>
	<td width="50" align="center">이름</td>
	<td width="150"><input name="name" value="<%=bean.getName()%>"></td>
</tr>
<tr>
	<td align="center">사는곳</td>
	<td><input name="city" value="<%=bean.getCity()%>"></td>
</tr>
<tr>
	<td align="center">나이</td>
	<td ><input name="age" value="<%=bean.getAge()%>"></td>
</tr>
<tr>
	<td align="center">팀명</td>
	<td><input name="team" value="<%=bean.getTeam()%>"></td>
</tr>
<tr>
	<td align="center" colspan="2">
		<%-- <input type="hidden" name = "num" value="<%=bean.getNum()%>"> --%>
		<input type="submit" value="UPDATE">
	</td>
</tr>
</table>
</form><p>
<a href="teamRead.jsp?num=<%=num%>">READ</a>
</div>
</body>
</html>