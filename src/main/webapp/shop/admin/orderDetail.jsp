<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*,shop.*"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<%
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		OrderBean order = orderMgr.getOrderDetail(no);
		ProductBean product = pMgr.getProduct(order.getProductNo());
%>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="top.jsp"%>
<form method="post" name="order" action="orderProc.jsp">
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr bgcolor="#996600">
				<td colspan="2" align="center">
					<font color="#FFFFFF">주문상세내역</font>
				</td>
			</tr>
			<tr align="center">
				<td>고객아이디</td>
				<td><%=order.getId()%></td>
			</tr>
			<tr align="center">
				<td>주문번호</td>
				<td><%=order.getNo()%></td>
			</tr>
			<tr align="center">
				<td>제품번호</td>
				<td><%=product.getNo()%></td>
			</tr>
			<tr align="center">
				<td>제품이름</td>
				<td><%=product.getName()%></td>
			</tr>
			<tr align="center">
				<td>제품가격</td>
				<td><%=UtilMgr.intFormat(product.getPrice())%>원</td>
			</tr>
			<tr align="center">
				<td>주문수량</td>
				<td><%=order.getQuantity() + ""%>개</td>
			</tr>
			<tr align="center">
				<td>재고수량</td>
				<td><%=product.getStock()%>개</td>
			</tr>
			<tr align="center">
				<td>주문날짜</td>
				<td><%=order.getDate()%></td>
			</tr>
			<tr align="center">
				<td>금액</td>
				<td><%=UtilMgr.intFormat(order.getQuantity() * product.getPrice())%>원</td>
			</tr>
			<tr align="center">
				<td>주문상태</td>
				<td>
					<select name="state">
						<option value="1">접수중</option>
						<option value="2">접수</option>
						<option value="3">입금확인</option>
						<option value="4">배송준비</option>
						<option value="5">배송중</option>
						<option value="6">완료</option>
					</select> 
				<script>document.order.state.value=<%=order.getState()%></script>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="수정"
					size="3" onclick="javascript:orderUpdate(this.form)"> / 
					<input type="button" value="삭제" size="3"
					onclick="javascript:orderDelete(this.form)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>"> 
		<input type="hidden" name="flag">
		</td>
	</tr>
</table>
</form>
<%@ include file="bottom.jsp"%>
</body>
</html>