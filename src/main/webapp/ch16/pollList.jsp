<!-- pollList.jsp -->
<%@page import="ch16.PollListBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch16.PollMgr"/>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<h2>Poll Program</h2>
<hr width="60%">
<jsp:include page="pollForm.jsp"/>
<b>설문 리스트</b>
<table>
	<tr>
		<td>
		<table  border="1">
			<tr>
				<th width="50">번호</th>
				<th width="250" align="left">질문</th>
				<th width="200">시작일~종료일</th>
			</tr>
			<%
					Vector<PollListBean> vlist = mgr.getPollList();
					for(int i=0;i<vlist.size();i++){
						PollListBean plBean = vlist.get(i);
						int num = plBean.getNum();
						String question = plBean.getQuestion();
						String sdate = plBean.getSdate();
						String edate = plBean.getEdate();
			%>
			<tr>
				<td align="center"><%=vlist.size()-i%></td>
				<td><a href="pollList.jsp?num=<%=num%>"><%=question%></a></td>
				<td align="center"><%=sdate+"~"+edate%></td>
			</tr>
			<%}//---for%>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="pollInsert.jsp">설문작성하기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>





