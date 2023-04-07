<%@page contentType="text/html;charset=UTF-8"%>
<%
	String mode = request.getParameter("mode");
	String msg = "";
	String color = "red";
	if (mode.equals("0")) {
		msg = "아이디 및 비밀번호를 다시 확인하시기 바랍니다.";
	} else if (mode.equals("1")) {
		msg = "아이디는 맞지만 비밀번호는 다시 확인하시기 바랍니다.";
		color = "blue";
	}
%>
<html>
<head>
<title>로그인 에러</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<br />
	<br />
	<br />
	<div align="center">
		<b>로그인에 실패하셨습니다.<br /><br />
		<font color="<%=color%>"><%=msg%></font>
		<br /> <br />
		</b> 
		<input type="button" value="다시쓰기" onClick="history.back()">
	</div>
</body>
</html>