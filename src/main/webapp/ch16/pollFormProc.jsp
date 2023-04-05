<!-- pollFormProc.jsp -->
<%@page import="ch16.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>\
<jsp:useBean id="mgr" class="ch16.PollMgr"/>
<%
	int listNum = UtilMgr.parseInt(request, "num");
	String itemNum[] = request.getParameterValues("itemnum");
	boolean result = mgr.updatePoll(listNum, itemNum);
	//out.print(result);
	String msg = "투표에 실패";
	if(result) msg = "투표에 성공";
%>
<script>
	alert("<%=msg%>");
	location.href = "pollList.jsp?num=<%=listNum%>";
</script>

