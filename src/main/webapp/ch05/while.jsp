<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	int number = Integer.parseInt(request.getParameter("number"));
	int count = 0;
	while(number > count){
%>
	<%-- <font color="<%= MyUtil.randomColor()%>"> --%>
	<%=msg%></font><p>
		
<%
	count++;
		
	}
%>