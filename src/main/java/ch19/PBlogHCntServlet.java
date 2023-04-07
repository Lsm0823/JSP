package ch19;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch19/pBlogUpHCnt")
public class PBlogHCntServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		PBlogMgr pMgr = new PBlogMgr();
		int num = Integer.parseInt(request.getParameter("num"));
		pMgr.upHCnt(num);
		String gid = request.getParameter("gid");
		if(gid==null)
			response.sendRedirect("home.jsp");
		else 
			response.sendRedirect("guest.jsp?gid="+gid);
	}
}