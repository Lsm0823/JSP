<!-- productProc.jsp -->
<%@page import="shop.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
	String flag = request.getParameter("flag");
	String msg = "오류가 발생하였습니다.";
	if(flag.equals("insert")){
		if(pMgr.insertProduct(request)){
			msg = "상품을 등록 하였습니다.";
		}
	}
	if(flag.equals("update")){
		if(pMgr.updateProduct(request)){
			msg = "상품을 수정 하였습니다.";
		}
	}
	if(flag.equals("delete")){
		if(pMgr.deleteProduc(UtilMgr.parseInt(request, "no"))){
			msg = "상품을 삭제 하였습니다.";
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "productMgr.jsp";
</script>
