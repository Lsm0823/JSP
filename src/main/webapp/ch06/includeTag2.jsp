<%@page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");		
	String pwd = request.getParameter("pwd");		
%>

<hr color = "red">
id : <%=id %><br>
pwd : <%=pwd %><br>

<!-- 추가적인 요청값이 있을때 param 사용 -->


