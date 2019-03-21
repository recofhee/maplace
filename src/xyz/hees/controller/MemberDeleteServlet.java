package xyz.hees.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.hees.controller.action.Action;
import xyz.hees.dao.BoardDao;
import xyz.hees.dao.MemberDao;
import xyz.hees.vo.BoardVo;
import xyz.hees.vo.MemberVo;

@WebServlet("/memberDelete")
public class MemberDeleteServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		System.out.println("servlet id : " + id);
		
		MemberDao mDao = MemberDao.getInstance();
		mDao.deleteMember(id);

		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("index");
	}
	
}
