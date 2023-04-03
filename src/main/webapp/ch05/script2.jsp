<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%!

	public String randomColor(){
	Random r = new Random();
	String rgb = Integer.toHexString(r.nextInt(256));
	rgb += Integer.toHexString(r.nextInt(256));
	rgb += Integer.toHexString(r.nextInt(256));
	return "#"+rgb;
	
}
%>

<%
	for(int i =0; i< 10 ; i++){
		out.println("<font color=" + randomColor() + ">");
		out.println("오늘은 즐거운 수요일<p>");
		out.println("</font>");
	}
%>