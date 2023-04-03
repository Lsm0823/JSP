<!-- updateGuestBookProc -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	if(bean.getSecret()==null)
		bean.setSecret("0"); // 비밀글을 체크를 안 할 경우
	mgr.updateGuestBook(bean);
%>
<!-- 수정과 동시에 자신의 창은 close 하고 수정된 방명록 글이 적용될려면
showGuestBook.jsp 새로그침 -->
<script type="text/javascript">
	opener.location.reload();
	self.close();
</script>