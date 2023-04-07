<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>회원가입</a>";
	else reg = "<a href=memberUpdate.jsp>회원수정</a>";
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <th><%=log%></th>
    <th><%=reg%></th>
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</table>
