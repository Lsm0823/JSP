
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr" />
<%
	mgr.deleteTeam(Integer.parseInt(request.getParameter("num")));
	response.sendRedirect("teamList.jsp");
	
%>

