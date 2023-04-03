<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<jsp:useBean id="bean" class="ch09.TeamBean"/>
<jsp:setProperty property="*" name = "bean" />
<%
		boolean result = mgr.updateTeam(bean);
		out.print(result);
		String msg = "수정실패";
		String url = "teamList.jsp";
		if(result){
			msg = "수정성공";
			url = "teamRead.jsp?num=" + bean.getNum();
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>