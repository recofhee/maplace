package xyz.hees.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.hees.dao.MemberDao;
import xyz.hees.vo.MemberVo;

/**
 * Servlet implementation class joinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("join.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birthY = req.getParameter("birthY");
		String birthM = req.getParameter("birthM");
		String birthD = req.getParameter("birthD");
		String birth = birthY + birthM + birthD;
		String gender = req.getParameter("gender");
		String id = req.getParameter("id");
		
		MemberVo mVo = new MemberVo();
		mVo.setEmail(email);
		mVo.setPw(pw);
		mVo.setName(name);
		mVo.setBirth(birth);
		mVo.setGender(gender);
		mVo.setId(id);
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.insertMember(mVo);
		
		HttpSession session = req.getSession();
		
		if(result == 1) {
			session.setAttribute("id", mVo.getId());
		}
		
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}

}
