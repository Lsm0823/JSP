<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Simple Shopping Mall </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" height="100%">
	<%if(id != null){%>
	<tr> 
		<td align="center"><%=id%>님 방문해 주셔서 감사합니다.</td>
	</tr>
	<%}else{%>
	<tr>
		<td align="center">로그인 하신 후 이용해 주세요.</td>
	</tr>
	<%}%>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>  