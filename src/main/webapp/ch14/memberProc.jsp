<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bean" class="ch14.MemberBean"/>
<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<jsp:setProperty property = "*" name = "bean"/>
<%
	//가입을 하고 실패하면 '가입실패' 알림 member.jsp
	boolean result = mgr.insertMember(bean);
	String msg = "가입실패";
	String url = "member.jsp";
	
	if(result){
		msg = "가입성공";
		url = "login.jsp";
		session.setAttribute("idKey" , bean.getId());
	}
	//가입을 하고 성공하면 '가입성공' 후에 login.jsp로 응답
%>

<script>
	alert(" <%=msg%> ");
	location.href = " <%=url%> ";
</script>