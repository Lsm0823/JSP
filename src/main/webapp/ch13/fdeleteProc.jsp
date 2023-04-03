<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch13.FileloadMgr"/>
<%
	String snum[] =
	request.getParameterValues("fch");

	int num[] = new int[snum.length-1];
	for(int i =0; i<num.length; i++){
		num[i] = Integer.parseInt(snum[i+1]);
	}
	mgr.deleteFile(num);
	response.sendRedirect("flist.jsp");
%>