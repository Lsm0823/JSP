<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id = "bean" class = "ch09.TeamBean"/>

<jsp:setProperty property = "*" name = "bean"/>

num = <%=bean.getNum()%><br>
name = <%=bean.getName()%><br>	
city = <%=bean.getCity()%><br>	
age = <%=bean.getAge()%><br>	
team = <%=bean.getTeam()%><br>

<%-- num : <jsp:getProperty property = "num" name = "bean"/><br>
name : <jsp:getProperty property = "name" name = "bean"/><br>
city : <jsp:getProperty property = "city" name = "bean"/><br>
age : <jsp:getProperty property = "age" name = "bean"/><br>
team : <jsp:getProperty property = "team" name = "bean"/><br> --%>