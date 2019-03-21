package xyz.hees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.hees.dao.MemberDao;
import xyz.hees.vo.MemberVo;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String url = "login.jsp";
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			url = "main.jsp";
		}
		*/
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String url = "login.jsp";
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberDao dao = MemberDao.getInstance();
		
		int result = dao.userCheck(id, pw);
		
		if(result == 1) {
			MemberVo vo = dao.getMember(id);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
			//resp.getWriter().print(result);
			url = "index.jsp";
		}/* else {
			resp.getWriter().print(result);
		}*/

		req.getRequestDispatcher(url).forward(req, resp);
	}

}
