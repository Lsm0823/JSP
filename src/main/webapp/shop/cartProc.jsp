<!-- cartProc.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="order" class="shop.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
	String id = (String)session.getAttribute("idKey");
	if(id==null){
		response.sendRedirect("login.jsp");
		return;//이후에 코드를 무력화
	}
	order.setId(id);
	//insert, update, delete
	String flag = request.getParameter("flag");
	String msg = "";
	if(flag.equals("insert")){
		msg = "장바구니에 저장 하였습니다.";
		cMgr.addCart(order);
	}else if(flag.equals("update")){
		msg = "장바구니를 수정 하였습니다.";
		cMgr.updateCart(order);		
	}else if(flag.equals("delete")){
		msg = "장바구니를 삭제 하였습니다.";
		cMgr.deleteCart(order);
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "cartList.jsp";
</script>