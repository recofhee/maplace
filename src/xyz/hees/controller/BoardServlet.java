package xyz.hees.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.hees.controller.action.Action;
import xyz.hees.dao.MemberDao;
import xyz.hees.vo.MemberVo;

@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String command = req.getParameter("command");
		ActionFactory af = ActionFactory.getInstance();
		//if(command == null) command = "board_write";
		Action action = af.getAction(command);
//		action.execute(req, resp);

		String id = req.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		MemberVo vo = dao.getMember(id);

		if(vo != null && action != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
			action.execute(req, resp);
		} else if(action != null) {
			action.execute(req, resp);
		} else if(command == "board_write") {
			System.out.println("board_write");
		}
		
		/*String pw = req.getParameter("pw");
		
		
		int result = dao.userCheck(id, pw);
		
		if(result == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
			action.execute(req, resp);
		} else if(action != null) {
			action.execute(req, resp);
		}*/
	}

}
