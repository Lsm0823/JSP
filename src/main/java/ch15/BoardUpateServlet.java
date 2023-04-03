package ch15;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/ch15/boardUpdate")
public class BoardUpateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에 저장된 bean 객체를 리턴
		HttpSession session = request.getSession();
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		MultipartRequest multi = 
				new MultipartRequest(
				request ,BoardMgr.SAVEFOLDER, BoardMgr.MAXSIZE,
				BoardMgr.ENCODING
				,new DefaultFileRenamePolicy()); 
		//update.jsp 입력한 값
		String inPass = multi.getParameter("pass");
		if(dbPass.equals(inPass)) {
			BoardMgr mgr = new BoardMgr();
			mgr.updateBoard(multi);
			
			String nowPage = multi.getParameter("nowPage");
			String numPerPage = multi.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage
					+"&numPerPage="+numPerPage+"&num="+bean.getNum());
			
			
		}else {
			// 비밀번호 일치 하지 않는 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
