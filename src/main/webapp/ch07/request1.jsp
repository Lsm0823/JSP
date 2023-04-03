<%@ page contentType="text/html; charset=UTF-8"%>
<%
      //hobby를 제외한 다른 값들을 출력
   String name = request.getParameter("name");
   String gender = request.getParameter("gender");
   String studentNum = request.getParameter("studentNum");
   String major = request.getParameter("major");
   String hobby[] = request.getParameterValues("hobby");
%>
이름 : <%=name %><br>
성별 : <%=gender %><br>
학번 : <%=studentNum %><br>
전공 : <%=major %>
취미 : <%
      for(int i=0;i<hobby.length;i++){
    	  //nbsp?
         out.println((hobby[i])+"&nbsp;");
      }
   %>