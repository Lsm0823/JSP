<!-- cartList.jsp -->
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.UtilMgr"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
	if((String)session.getAttribute("idKey")==null){
		response.sendRedirect("login.jsp");
		return;//이후에 코드를 무력화
	}
	Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
	int totalPrice = 0;
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600">
				<td><font color="#FFFFFF">제품</font></td>
				<td><font color="#FFFFFF">수량</font></td>
				<td><font color="#FFFFFF">가격</font></td>
				<td><font color="#FFFFFF">수정/삭제</font></td>
				<td><font color="#FFFFFF">조회</font></td>
			</tr>
			<%if(hCart.isEmpty()){%>
			<tr>
				<td colspan="5" align="center">장바구니는 비어 있습니다.</td>
			</tr>	
			<%}else{
				//Hashtable에 저장된 키값을 리턴
				Enumeration<Integer> hCartkey = hCart.keys();
				while(hCartkey.hasMoreElements()){
					//키값으로 주문객체를 리턴
					OrderBean order = hCart.get(hCartkey.nextElement());
					int productNo = order.getProductNo();
					//상품정보를 리턴
					ProductBean pbean = pMgr.getProduct(productNo);
					String pName = pbean.getName();
					int price = pbean.getPrice();
					int quantity = order.getQuantity();
					int subTotal = price * quantity;//주문가격
					//전체주문가격
					totalPrice+=subTotal;
			%>
			<tr align="center">
			<form method="post" action="cartProc.jsp">
				<input type="hidden" name="productNo" value="<%=productNo%>">
				<td><%=pName%></td>
				<td><input name="quantity" style = "text-align:right;" 
					value="<%=quantity%>" size="3">개</td>
				<td><%=UtilMgr.monFormat(subTotal)%></td>
				<td>
					<input type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> /
					<input type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
				</td>
				<td>
					<a href="javascript:productDetail('<%=productNo%>')">상세보기</a>
				</td>
				<input type="hidden" name="flag">
				</form>
			</tr>
			<%}//while%>				
			<tr>
				<td colspan="4" align="right">
					총 주문금액 : <%=UtilMgr.monFormat(totalPrice)%>원	
				</td>
				<td align="center">
					<a href="orderProc.jsp">주문하기</a>
				</td>
			</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>	
</body>
</html>