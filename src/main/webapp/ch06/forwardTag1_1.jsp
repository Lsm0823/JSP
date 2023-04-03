<%@page contentType="text/html; charset=UTF-8"%>
<%
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

<%-- id : <%=id%> / pwd : <%=pwd%>  --%>
<jsp:forward page="forward1_2.jsp"/>