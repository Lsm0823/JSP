<%@page contentType="text/html; charset=UTF-8"%>
<%
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	
	String id = (String)session.getAttribute("idKey");
	int intervalTime = session.getMaxInactiveInterval();
	
	//세션키가 만료되면 사용
	if(id != null){
%>
	<%=id%>님이 좋아하는 계절과 과일은<p>
	<b><%=season %></b>과 <b><%=fruit %></b> 입니다.<p>
	세션ID : <%=session.getId()%><br>
	세션 유지 시간 : <%=intervalTime %>초
<%			
	}else{
		out.println("세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수가 없습니다.");
	}
%>


