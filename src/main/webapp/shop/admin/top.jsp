<%@ page pageEncoding="UTF-8"%>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <th><a href="../index.jsp">홈</a></th>
    <th><a href="adminLogout.jsp">로그아웃</a></th>
    <th><a href="memberMgr.jsp">회원관리</a></th>
    <th><a href="productMgr.jsp">상품관리</a></th>
    <th><a href="orderMgr.jsp">주문관리</a></th>
  </tr>
</table> 