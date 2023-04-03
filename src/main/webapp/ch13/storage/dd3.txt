<!--  updateGuestBook.jsp -->
<%@page import="guestbook.GuestBookBean"%>
<%@page import="guestbook.MyUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="login" scope="session" class="guestbook.JoinBean"/>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>

<%
   int num = 0;
    GuestBookBean bean = null;
   if(request.getParameter("num")!=null){
      num = MyUtil.parseInt(request, "num");
      bean = mgr.getGuestBook(num);
   }     
%>
<html>
<head>
<title>GuestBook</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
   <div align="center">
      <table width="505" cellspacing="0" cellpadding="3">
         <tr>
            <td bgcolor="#F5F5F5"><font size="4"><b>글수정하기</b></font></td>
         </tr>
      </table>
      <form method="post" action="updateGuestBookProc.jsp?num=<%=num%>">
         <table width="505" border="1" cellspacing="0" cellpadding="0">
            <tr>
               <td>
                  <table>
                     <tr>
                        <td height="40" align="center">
                           <img src="img/face.bmp" border="0" alt="성명"> 
                           <input name="name" size="9" value="<%=login.getName()%>" readonly> 
                           <img src="img/email.bmp" border="0" alt="메일"> 
                           <input name="email" size="20" value="<%=login.getEmail()%>"> 
                           <img src="img/hp.bmp" border="0" alt="홈페이지"> 
                           <input title="홈페이지도 있으면 알려주시어요" name="hp" size="20" value="<%=login.getHp()%>">
                        </td>
                     </tr>
                     <tr>
                        <td align="center">
                           <textarea name="contents" cols="60" 
                           rows="6"><%=bean.getContents()%></textarea>
                        </td>
                     </tr>
                     <tr>
                        <td width="500" height="30" colspan="3" align="center">
                        <input type="hidden" name="id" value="<%=bean.getId()%>">
                        <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
                        <input type="submit" value="글수정"> 
                        <input type="reset" value="고치기"> 
                        <input type="checkbox" name="secret" value="1">
                        <%if(bean.getSecret().equals("1")) out.print("checked");%>
                        비밀글
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>