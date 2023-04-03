<!-- showGuestBook.jsp -->
<%@page import="guestbook.CommentBean"%>
<%@page import="java.util.Vector"%>
<%@page import="guestbook.GuestBookBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="cmgr" class="guestbook.CommentMgr"/>
<%
   String id = (String)session.getAttribute("idKey");
   if(id==null){
      //현재 접속된 url을 리턴
      StringBuffer url = request.getRequestURL();
      //out.print(url);
      response.sendRedirect("login.jsp?url="+url);
   }
%>
<html>
<title>GuestBook</title>
<script type="text/javascript">
   function updateFn(num){
      url = "updateGuestBook.jsp?num="+num;
      window.open(url,"GuestBook Update","width=540, height=300");
   }
   
   //commentFn(this.form)
   // 댓글 폼이 여러개 이므로 this를 사용하지 않으면 인식 불가
   function commentFn(frm) {
      if(frm.comment.value == ""){
         //frm에 comment의 값이 빈값이면
         alert("댓글을 입력하세요.");
         frm.comment.focus();
         retrun;
      }
      frm.submit();
   }
   
   function disFn(num) {
   //alert(num);
      var v = "cmt"+num;//cmt7
      var e = document.getElementById(v);
      if(e.style.display=='none')
         e.style.display='block';//보이는 것
      else
         e.style.display='none';//안보임
   }
   function delFn(cnum) {
   document.delFrm.action = "commentProc.jsp";
   document.delFrm.cnum.value = cnum;
   document.delFrm.submit();
}
   
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@include file="postGuestBook.jsp" %>
<table width="520" cellspacing="0" cellpadding="3">
   <tr bgcolor="#F5F5F5"> 
      <td><b><%=login.getName()%></b></td>
      <td align="right"><a href="logout.jsp">로그아웃</a></b></td>
   </tr>
</table>
<!-- GuestBook List Start -->
<%
   Vector<GuestBookBean> vlist = mgr.listGuestBook(id, login.getGrade());
   //out.print(vlist.size());
   if(vlist.isEmpty()){
%>      
   <table width="520" cellspacing="0" cellpadding="7">
      <tr>
         <td>등록된 글이 없습니다.</td>
      </tr>
   </table>
   <%}else{
      for(int i=0;i<vlist.size();i++){
         //방명록 글
         GuestBookBean bean = vlist.get(i);
         //방명록 글쓴이
         JoinBean writer = mgr.getJoin(bean.getId());
         //out.println(bean.getContents()+ "<br>");
         //out.println(writer.getName()+ "<p>");
%>
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
   <tr>
      <td>
         <table bgcolor="#F5F5F5">
            <tr>
               <td width="225">NO : <%=vlist.size()-i %> </td>               
               <td width="225">
                  <img src="img/face.bmp" border="0" alt="이름">
                  <a href="mailto:<%=writer.getEmail()%>"></a>
                     <%=writer.getName()%>
               </td>               
               <td width="150" align="center">
                  <%   if(writer.getHp()==null||writer.getHp().equals("")){
                     out.println("홈페이지가 없습니다.");
                  }else{
                  %>
                  <a href="http://"<%=writer.getHp() %>">
                     <img alt="홈페이지" src="img/hp.bmp" border="0">
                  </a>
               <% }%>
               </td>               
            </tr>
            <tr>
               <td colspan="3"><%=bean.getContents() %></td>               
            </tr>
            <tr>
               <td>IP : <%=bean.getIp() %></td>               
               <td><%=bean.getRegdate()+" "+bean.getRegtime() %></td>               
               <td>
               <%
                  //수정, 삭제 : 로그인 id와 writer가 동일한 경우에는 활성화
                  //삭제 : 관리자
                  //비밀글 : secret 1일때
               boolean chk = login.getId().equals(writer.getId());
               if(chk||login.getGrade().equals("1")){
                  if(chk){
               %>
                  <a href="javascript:updateFn('<%=bean.getNum()%>')">[수정]</a>
               <%}//---if2%>
                  <a href="deleteGuestBook.jsp?num=<%=bean.getNum()%>">[삭제]</a>
               <%if(bean.getSecret().equals("1")){%>   
               비밀글
               <%
                  }//---if3
               }//---if1
               %>
               </td>                  
            </tr>
         </table>
      </td>
   </tr>
</table>
<!-- Comment List Start -->
<div id="cmt<%=bean.getNum()%>" style="display: none">
<% 
   Vector<CommentBean> cvlist = cmgr.listComment(bean.getNum());
   /* out.print(cvlist.size()); */
   if(!cvlist.isEmpty()){
%>      
   <table width="500" bgcolor="#F5F5F5">
      <%         
         for(int j=0;j<cvlist.size();j++){
            CommentBean cbean = cvlist.get(j);
      %>
         <tr>
            <td>
               <table width="500">
                  <tr>
                     <td><b><%=cbean.getCid()%></b>   </td>
                     <td align="right">
                     <!-- 삭제는 로그인 id와 댓글 쓴 id랑 동일 -->
                     <%if(id.equals(cbean.getCid())){ %>
                     <%-- <a href="commentProc.jsp?flag=delete&cnum=<%=cbean.getCnum()%>">[삭제]</a> --%>
                     <a href="javascript:delFn('<%=cbean.getCnum()%>')">[삭제]</a>
                     <%}%>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2"><%=cbean.getComment() %></td>
                  </tr>
                  <tr>
                     <td><%=cbean.getCip()%></td>
                     <td align="right"><%=cbean.getCregDate()%></td>
                  </tr>
               </table>
            <hr>   
            </td>
         </tr>
      <%}//---for(Comment)%>
      </table>
<%}//if(comment)%>   
</div>
<!-- Comment List End -->
<table width="500">
<tr><td>
   <button onclick="disFn(<%=bean.getNum()%>)">
   댓글<%=cvlist.isEmpty() ? "" : cvlist.size()%></button>
</table>
<!-- Comment Form Start -->
   <form name="cFrm" method="post" action="commentProc.jsp">
<table>
   <tr>
      <td>
         <textarea placeholder="댓글입력..." name="comment" rows="2" 
         cols="65" maxlength="1000"></textarea>
      </td>
      <td>
         <input type="button" value="댓글" onclick="commentFn(this.form)">
         <input type="hidden" name="flag" value="insert">
         <!-- 방명록 글번호 -->
         <input type="hidden" name="num" value="<%=bean.getNum()%>">
         <!-- 로그인 id (로그인 되어있는 아이디 : login.getId())-->
         <input type="hidden" name="cid" value="<%=login.getId()%>">
         <!-- 댓글 입력 ip 주소 -->
         <input type="hidden" name="cip" value="<%=request.getRemoteAddr()%>">
      </td>
   </tr>
</table>   
</form>
<!-- Comment Form End -->


<% 
      }//-- GuestBook for
   }//-- GuestBook if-else%>
<!-- GuestBook List End -->
<form method="post" name=delFrm>
   <input type="hidden" name="flag" value="delete">
   <input type="hidden" name="cnum">
</form>
</div>
</body>
</html>