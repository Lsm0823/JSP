<%@page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//DB에 왔다 갔다 가정하고 ~
	
	boolean result = true;
	
	// id 와 pwd 일치하면 세션에 값을 넣기
	String msg = "로그인 실패하였습니다.";
	String url = "login.jsp";
	if(result){
		msg = "로그인 되었습니다.";
		url = "loginOk.jsp";
		
		//로그인이 계속 유지하기 위해 "idKey"속성을 가진 id를 세션에 넣기
		session.setAttribute("idKey", id);
		
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=url%>";
</script>