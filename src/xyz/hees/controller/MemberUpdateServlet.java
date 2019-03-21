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

@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		
		MemberVo vo = dao.getMember(id);
		req.setAttribute("mVo", vo);
		
		req.getRequestDispatcher("memberUpdate.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		String pw = req.getParameter("pw");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		String id = req.getParameter("id");
		
		MemberVo mVo = new MemberVo();
		mVo.setPw(pw);
		mVo.setEmail(email);
		mVo.setName(name);
		mVo.setBirth(birth);
		mVo.setGender(gender);
		mVo.setId(id);
		
		MemberDao dao = MemberDao.getInstance();
		
		dao.updateMember(mVo);
		resp.sendRedirect("login");
	}

}
