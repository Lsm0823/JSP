<%@page contentType="text/html; charset=UTF-8"%>
<%
// 세션에 저장된 "idKey"라는 속성을 가진 값을 가져옴 (id는 직접 설정)

String id = (String) session.getAttribute("idKey");

	if (id != null) {
	//로그인 상태
	%>
<script>
	
	alert("로그인 되었습니다");
	location.href = "loginOk.jsp";
	
</script>

	<%
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<title>Simple LogIn</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600" topmargin="100">
<h2 align="center">Session 로그인</h2>
<table width="75%" border="1" align="center" bordercolor="#660000" bgcolor="#FFFF99">
  <tr bordercolor="#FFFF99"> 
    <td height="190" colspan="7"> 
	   <form method="post" action="loginProc.jsp">
        <table width="50%" border="1" align="center" cellspacing="0" cellpadding="0">
          <tr bordercolor="#FFFF66"> 
            <td colspan="2"><div align="center">Log in</div></td>
          </tr>
          <tr > 
            <td width="47%"><div align="center">ID</div></td>
            <!-- name = "id" 중요 -->
            <td width="53%"><div align="center"><input name="id"></div></td>
          </tr>
          <tr> 
            <td><div align="center">PWD</div></td>
            <!-- name = "pwd" 중요 -->
            <td><div align="center"><input name="pwd"></div></td>
          </tr>
          <tr> 
            <td colspan="2">
				<div align="center"> 
					<input type="submit" value="login">&nbsp; 
					<input type="reset" value="reset">
              </div>
			  </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
