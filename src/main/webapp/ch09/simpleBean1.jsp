<%@page import="ch09.SimpleBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	SimpleBean bean = new SimpleBean();
	String msg = request.getParameter("msg");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	// 넘겨받은 값들을 Beans에 저장 : why? -> DB연동을 위해
		bean.setMsg(msg);
		bean.setCnt(cnt);
		
%>

msg : <%=bean.getMsg()%><br>
cnt : <%=bean.getCnt()%><br>