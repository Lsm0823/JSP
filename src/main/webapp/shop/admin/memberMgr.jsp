<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, shop.*"%>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %> 
	<%Vector<MemberBean> vlist = mMgr.getMemberList();%>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#996600"> 
			<td><font color="#FFFFFF">회원이름</font></td>
			<td><font color="#FFFFFF">회원아이디</font></td>
			<td><font color="#FFFFFF">패스워드</font></td>
			<td><font color="#FFFFFF">성별</font></td> 
			<td><font color="#FFFFFF">생년월일</font></td> 
			<td><font color="#FFFFFF">이메일</font></td>
			<td><font color="#FFFFFF">수정</font></td>
			<td><font color="#FFFFFF">메일보내기</font></td>
		</tr>
		<%
		for(int i=0; i<vlist.size(); i++){
			MemberBean mBean = vlist.get(i);
		%>
		<tr align="center"> 
			<td><%=mBean.getName()%></td>
			<td><%=mBean.getId()%></td>
			<td><%=mBean.getPwd()%></td>
			<td>
			<%=mBean.getGender().equals("1")?"남자":"여자"%>
			</td>
			<td><%=mBean.getBirthday()%></td>
			<td><%=mBean.getEmail()%></td>
			<td><a href="javascript:update('<%=mBean.getId()%>')">수정하기</a></td>
			<td><font color="#FFFFFF">
			<a href="sendAccount.jsp?id=<%=mBean.getId()%>">메일보내기</a>
			</font></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="update" method="post" action="memberUpdate.jsp">
	<input type=hidden name="id">
	</form>
</body>
</html>
