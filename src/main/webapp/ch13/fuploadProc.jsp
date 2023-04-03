<!-- fuploadProc.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch13.FileloadMgr"/>
<%
	
	String flag = request.getParameter("flag");
	mgr.uploadFile(request);
	response.sendRedirect("flist.jsp");
%>