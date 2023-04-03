<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="pBean" class="ch09.ScopeBean" scope="page"/>
<jsp:useBean id="sBean" class="ch09.ScopeBean" scope="session"/>
<!-- 
	scope가 session이면 id가 동일한 객체가 있는지 없는지 검색
	-> 없으면 새롭게 생성을 하지만 있으면 그 객체를 재사용
	-> 그러나 세션이 종료 또는 제거가 되면 안에 있는 객체도 같이 없어짐.
	-> scope = "session" 밑에 코드가 많이 사용
 -->
<!--  	 session안에 sBean이라는 객체를 사용하겠다. -->
 <% session.setAttribute("sBean", sBean); %>
	
<!-- 	 name의 이름은 useBean의 id와 동일하게 해야한다. -->
<jsp:setProperty property="num" name="pBean"
value= "<%=pBean.getNum()+10 %>"/>
<jsp:setProperty property="num" name="sBean"
value= "<%=sBean.getNum()+10 %>"/>

<h1>Scope Bean</h1>
pBean num값 : <jsp:getProperty property="num" name="pBean"/>

sBean num값 : <jsp:getProperty property="num" name="sBean"/>

 <a href="scopeBean2.jsp">세션 종료</a>
