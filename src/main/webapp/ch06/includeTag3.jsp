<%@page contentType="text/html; charset=UTF-8"%>
<%
	String bloodType = request.getParameter("bloodType");
	String name = "simba222";
%>
<jsp:include page ='<%=bloodType+".jsp" %>'>
	<jsp:param name="name" value="<%=name %>"/>
</jsp:include>