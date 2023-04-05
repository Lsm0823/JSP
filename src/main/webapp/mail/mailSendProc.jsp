<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="mail.MemberMgr"/>
<jsp:useBean id="msend" class="mail.MailSend"/>

<%
	// 전송 성공 및 실패 -> mailSend.jsp 응답
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	boolean result = msend.sendPwd(id, email);	
	if(result){
		response.sendRedirect("mailSend.jsp");
	}
	
%>