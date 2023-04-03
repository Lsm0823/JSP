<%@page contentType="text/html; charset=UTF-8"%>
<%
	String hobby[] = request.getParameterValues("hobby");
	for(int i = 0; i < hobby.length; i++){
		out.println(hobby[i] + "<br>");
	}
%><hr>
<jsp:useBean id="bean" class="ch14.MemberBean"/>
<jsp:setProperty property="hobby" name = 'bean'/>
<%
	String hobby2[] = bean.getHobby();
	for(int i = 0; i < hobby2.length; i++){
		out.println(hobby[i] + "<br>");
	}
%>