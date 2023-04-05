<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch16.PollMgr"/>
<jsp:useBean id="plbean" class="ch16.PollListBean"/>
<jsp:setProperty property="*" name="plbean"/>
<jsp:useBean id="pibean" class="ch16.PollItemBean"/>
<jsp:setProperty property="*" name="pibean"/>
<%
	boolean result = mgr.insertPoll(plbean, pibean);
	String msg = "설문 추가 실패";
	String url = "pollInsert.jsp";
	if(result){
		msg = "설문 추가 성공";
		url = "pollList.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
