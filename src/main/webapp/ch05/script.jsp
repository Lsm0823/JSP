<!-- /ch05/script.jsp -->

<%@ page contentType="text/html; charset=UTF-8"%>
           
           <!--  선언문(Declaration)  
           다른 페이지에서 메소드 사용불가 전역변수 이기 때문에 -> 메소드 필요시 java로 만들어서 사용 
           사용빈도 적음 (효율성 별로) -->
<%!

//필드선언
String dec = "선언한 변수";

//메소드 선언
public String decMethod(){
		return dec;
}

%>

			<!--  스크립트릿(Scriptlet) -->
			

<%
	String scriptlet = "스크립트릿";
	out.println("내장객체를 이용한 출력: " + dec + "<p>");
	// 메소드 선언불가 -> 메소드안에 메소드 생성이 안되기 때문
%>

			<!--  표현문(Expression) -->
선언문1 : <%=dec%><p>
선언문2 : <%=decMethod()%><p>
선언문3 : <%=scriptlet%><p>


			<!--  JSP 주석()  -->


<% 
//
/**/
String comment="Comment";
%>

<!-- jsp주석1<%=comment%> -->
<%-- JSP주석2 : <%=comment%> --%>
