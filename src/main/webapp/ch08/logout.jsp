<%@ page contentType="text/html; charset=UTF-8"%>
<%
		//서버에 만들어진 세션 객체를 제거 -> 새로운 세션객체가 생성
		session.invalidate();
		//현재 페이지를 login.jsp 호출
		response.sendRedirect("login.jsp");
%>