<%@page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!-- 이페이지가 클라이언트에게 중단된다. -->
id : <%=id %> <br>
pwd : <%=pwd %> <br>