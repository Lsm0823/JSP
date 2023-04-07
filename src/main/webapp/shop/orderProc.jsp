<!-- orderProc.jsp -->
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>
<%
	//세션에 저장된 장바구니를 리턴
	Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
	Enumeration<Integer> hCartKey = hCart.keys();
	String msg = "";
	if(!hCart.isEmpty()){
		while(hCartKey.hasMoreElements()){
			OrderBean order = hCart.get(hCartKey.nextElement());
			//주문처리
			orderMgr.insertOrder(order);
			//재고정리
			pMgr.reduceProduct(order);
			//장바구니에 주문한 상품삭제
			cMgr.deleteCart(order);
		}
		msg = "주문 처리 하였습니다.";
	}else{
		msg = "장바구니가 비었습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderList.jsp";
</script>