<%@page contentType="text/html; charset=UTF-8"%>

<%!
	//필드는 JVM이 초기화를 세팅해줌. <- 선언문이기 때문
	int one;
	int two=1;
	public int plus(){
		int three = one + two;
		return three;
	}
%>

<%=plus() %>

<%!
	int a;
	int b =1;
	int c = a + b;
%>