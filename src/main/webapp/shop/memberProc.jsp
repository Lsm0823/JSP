<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<jsp:useBean id="mBean" class="shop.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%boolean flag = mMgr.insertMember(mBean);%>
<html>
<head>
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#FFFFCC">
<br/><br/>
<div align="center">
<%
if(flag){
	  out.println("<b>회원가입을 축하 드립니다.</b><p>");
	  out.println("<a href=login.jsp>로그인</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=member.jsp>다시 가입</a>");
	}
%>
</div>
</body>
</html>
