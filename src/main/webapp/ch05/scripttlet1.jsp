<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	float f = 2.3f;
	int a = Math.round(f);
	Date d = new Date();
%>

실수 f의 반올림 : <%=a%> <br>
날짜와 시간 : <%=d%><br>
로컬타입의 날짜와 시간