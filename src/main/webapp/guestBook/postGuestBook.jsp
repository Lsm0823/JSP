<%@page import="guestbook.JoinBean"%>
<%@page pageEncoding="UTF-8"%>
<jsp:useBean id="login" scope="session" class="guestbook.JoinBean"/>
<%
		//JoinBean login = (JoinBean)session.getAttribute("login");
%>
<html>
<head>
<title>GuestBook</title>
<script type="text/javascript">
	function checkInputs() {
		frm = document.postFrm;
		if(frm.contents.value==""){
			alert("내용을 입력해 주세요.");
			frm.contents.focus();
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>
	<div align="center">
		<table cellspacing="0" cellpadding="3">
			<tr>
				<td bgcolor="#F5F5F5"><font size="4"><b>글올리기</b></font></td>
			</tr>
		</table>
		<form name="postFrm" method="post" action="postGuestBookProc.jsp">
			<table border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table>
							<tr>
								<td height="40" align="center">
								<img src="img/face.bmp" border="0" alt="성명"> 
								<input title="이름을 적어주세요" name="name" size="9" 
								maxlength="20" value="<%=login.getName()%>" readonly>
								<img src="img/email.bmp" border="0" alt="메일">
								<input title="전자메일 주소를 적는 곳이군요" name="email" size="20"
									maxlength="80" value="<%=login.getEmail()%>"> 
								<img src="img/hp.bmp" border="0" alt="홈페이지"> 
								<input title="홈페이지도 있으면 알려주세요." name="hp" size="20"
									maxlength="80" value="<%=login.getHp()%>">
									</td>
							</tr>
							<tr>
								<td align="center">
									<textarea title="좋은 글 남겨주세요"
										name="contents" cols="60" rows="6">하이~~~</textarea>
								</td>
							</tr>
							<tr>
								<td width="500" height="30" colspan="3" align="center">
									<!-- table start -->
									<input type="hidden" name="id" value="<%=login.getId()%>">
									<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
									<input type="button" value="글올리기" onclick="checkInputs()"> 
									<input type="reset" value="고치기">
									<input type="checkbox" name="secret" value="1">비밀글
									<!--table end  -->
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
