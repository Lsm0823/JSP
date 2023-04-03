<!-- ch12/taseteCookie-->
<%@page contentType="text/html; charset=UTF-8"%>
<%
		//응답된 쿠키의 정보는 request에 저장
		Cookie cookles[] = request.getCookies();
		if(cookles != null){
			for(int i = 0; i < cookles.length; i++){
		%>
			Cookie Name : <%= cookles[i].getName() %><br>
			Cookie Value : <%= cookles[i].getValue()%><br>
		<%
			}
		}
		
%>

<a href="cookCookie.jsp">쿠키요리~</a>"