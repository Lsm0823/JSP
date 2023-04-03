<%@page import="guestbook.MyUtil"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="cmgr" class="guestbook.CommentMgr"/>

<%
	int num = 0;
	if(request.getParameter("num")!= null){
		num = MyUtil.parseInt(request, "num");
		mgr.deleteGuestBook(num);
		// 방명록 원글 삭제시 관련된 댓글 삭제.
		cmgr.deleteAllComment(num);
				
	}
	response.sendRedirect("showGuestBook.jsp");
%>