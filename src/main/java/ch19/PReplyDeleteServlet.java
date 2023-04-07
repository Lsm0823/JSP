package ch19;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch19/pReplyDelete")
public class PReplyDeleteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		PReplyMgr rMgr = new PReplyMgr();
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		rMgr.deletePReply(rnum);
		String gid = request.getParameter("gid");
		if(gid==null)
			response.sendRedirect("home.jsp");
		else 
			response.sendRedirect("guest.jsp?gid="+gid);
	}
}