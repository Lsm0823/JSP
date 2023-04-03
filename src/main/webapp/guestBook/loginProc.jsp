<!-- guestbook/loginProc.jsp -->
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="login" class="guestbook.JoinBean" scope="session"/>
<jsp:setProperty property="*" name="login"/>

<%
	String url = "login.jsp";
	if(request.getParameter("url")!=null && 
			!request.getParameter("url").equals("null")){
		url = request.getParameter("url");
	}
	boolean result = mgr.loginJoin(login.getId(), login.getPwd());
/* 	out.print(result); */
	String msg = "로그인 실패";
	if(result){
		msg = "로그인 성공";
		login = mgr.getJoin(login.getId());
		session.setAttribute("idKey", login.getId());
		session.setAttribute("login", login);
	}
	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>















