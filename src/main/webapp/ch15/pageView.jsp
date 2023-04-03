<!-- pageView.jsp -->
<%@page import="ch15.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
		int totalRecord = UtilMgr.parseInt(request, "totalRecord");//총게시물수
		int numPerPage = 10;//페이지당 레코드 개수
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock =0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		int start = (nowPage*numPerPage)-numPerPage;
	
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
%>
<!DOCTYPE html>
<html>
<head>
	<title>페이징 & 블럭 처리 테스트</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function block(block) {
		document.readFrm.nowPage.value=
		<%=pagePerBlock%>*(block-1)+1;   
		document.readFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
</script>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>페이징 & 블럭 처리 테스트</h2>
<table>
	<tr>
		<td  width="700" align="center">
		Total : <%=totalRecord%>Articles(
		<font color="red"><%=nowPage+"/"+totalPage%>Pages</font>
		)
		</td>
	</tr>
</table>
<!-- 게시물 번호 Start -->
<table>
	<tr>
	<td>게시물 번호 : &nbsp;</td>
	<%
		int listSize = totalRecord - start;
		for(int i = 0; i < numPerPage; i++){
			if(i==listSize)break;
		%>
		<td align="center"><%=totalRecord-start-i%>&nbsp;</td>
		<% }%>

	</tr>
	
</table>
<!-- 게시물 번호 End -->
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>

<!-- 페이징 및 블럭 번호 Start -->
<table>
   <tr>
      <td>
      <!-- 이전 블럭 -->
      <%if(nowBlock>1){%>
         <a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
      <%}%>
      <!-- 페이징 -->
      <%
         int pageStart = (nowBlock-1)*pagePerBlock+1;
         int pageEnd = (pageStart + pagePerBlock)<totalPage?
               pageStart + pagePerBlock:totalPage+1;//마지막 블럭 값을 위해
         for(;pageStart<pageEnd;pageStart++){
      %>
         <a href="javascript:pageing('<%=pageStart%>')">
         
            <%if(nowPage==pageStart){%><font color="red"><%}%>
               [<%=pageStart%>]
            <%if(nowPage==pageStart){%></font><%}%>
         </a>
         <%}//for %>
         
      <!-- 다음 블럭 -->
      <%if(totalBlock>nowBlock){%>
         <a href="javascript:block('<%=nowBlock+1%>')">next...</a>
      <%}%>
      </td>
   </tr>
</table>


<!-- 페이징 및 블록 번호 End -->

<hr width="60%"/>
<b>
totalRecord : <%=totalRecord%>&nbsp;
numPerPage : <%=numPerPage%>&nbsp;
pagePerBlock : <%=pagePerBlock%>&nbsp;
totalPage : <%=totalPage%>&nbsp;<br/>
totalBlock : <%=totalBlock%>&nbsp;
nowPage : <%=nowPage%>&nbsp;
nowBlock : <%=nowBlock%>&nbsp;
pageStart : <%=pageStart %>&nbsp;
pageEnd : <%=pageEnd %>&nbsp;
</b>
<p/>
<input type="button" value="TotalRecord 입력폼"
 onClick="javascript:location.href='pageView.html'">
</div>
</html>
