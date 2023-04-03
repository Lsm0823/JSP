package ch08;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch08/exServlet2")
public class ExServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// 서블릿이 처음요청 한번만 실행

		System.out.println("init호출");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Client가 요청이 있을때 마다 실행

		System.out.println("service 호출");
	}
	
	@Override
	public void destroy() {
		// 서비스가 종료 및 서블릿 코드가 수정이 될 때 
		System.out.println("destroy 호출");
	}
}
