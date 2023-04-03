<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<jsp:useBean id="bean" class="ch14.MemberBean" scope="session"/>
<jsp:setProperty property="*" name="bean"/>
<%
   boolean result = mgr.updateMember(bean);
   if(result){
%>
   <script>
      alert("회원정보를 수정 하였습니다.");
      location.href = "login.jsp";
   </script>
<%}else{%>
   <script>
      alert("회원정보 수정에 실패 하였습니다.");
      history.back();
   </script>
<%}%>