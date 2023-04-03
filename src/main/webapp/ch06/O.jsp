<h1>Forward Tag Example2</h1>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
   String name = request.getParameter("name");
   String bloodType = request.getParameter("bloodType");
%>
<b><%=name%></b>님의 혈액형은
<b><%=bloodType%></b>형이고
강한 의지의 소유자입니다.