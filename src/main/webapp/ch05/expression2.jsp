<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%!
	public int max(int a, int b){
	int c = a > b ? a : b;
	return c;
}
%>
<%
	Date d = new Date();
	int hour = d.getHours();
	int a = 10, b = 20;
%>

지금 오전일까요? 오후일까요? <%=(hour<12)? "오전" : "오후" %><br>
a와 b중에 큰 숫자를 출력하세요. <%=max(a,b)%>