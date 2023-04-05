<%@page import="java.util.Vector"%>
<%@page import="ch16.PollListBean"%>
<%@page import="ch15.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class = "ch16.PollMgr"/>

<%
   int num = 0; 
   if(request.getParameter("num") != null){
      num = UtilMgr.parseInt(request, "num");  
   }
   
   PollListBean plBean = mgr.getPoll(num);
   Vector<String> vItem = mgr.getItemList(num);
   String question = plBean.getQuestion();
   int type = plBean.getType();
   int active = plBean.getActive();
   int sumCount = mgr.sumCount(num); //미구현
   //out.print(question  +" : " + vItem.size());
%>

<form action="pollFormProc.jsp"> 
<table border="1">
	<tr>
		<td colspan="2" width="300">
			Q : <%=question%> <font color="blue">(<%=sumCount%>)</font>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<%
				for(int i=0;i<vItem.size();i++){
					String item = vItem.get(i);
		%>
		<%if(type==1){%>
			<input type="checkbox" name="itemnum" value="<%=i%>">
		<%}else if(type==0){ %>
			<input type="radio" name="itemnum" value="<%=i%>">
		<%}%>
		<%=item%><br>
		<%}%>
		</td>
	</tr>
	<tr>
		<td width="150">
		<%if(active==1){%>
			<input type="submit" value="투표">
		<%}else{%>
			투표종료
		<%}%>	
		</td>
		<td>
			<input type="button" value="결과" 
			onclick="javascript:window.open('pollView.jsp?num=<%=num%>'
			,'pollView','width=500, height=350')">
		</td>
	</tr>
</table>	
<input type="hidden" name="num" value="<%=num%>">
</form>