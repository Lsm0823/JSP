<%@page import="ch05.MyUtil"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
	for(int i =0; i< 10 ; i++){
		out.println("<font color=" + MyUtil.randomColor() + ">");
		out.println("오늘은 즐거운 목요일<p>");
		out.println("</font>");
	}

%>