<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<%
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pwd");
	  String msg = "로그인에 실패 하였습니다.";
	  
	  boolean result = mgr.loginMember(id,pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "로그인에 성공 하였습니다.";
	  }
%>
<script>
	alert("<%=msg%>");
	location.href = "login.jsp";
</script>