package xyz.hees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xyz.hees.dao.MemberDao;
import xyz.hees.vo.MemberVo;

@WebServlet("/memberPwCheck")
public class PwCheckServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberDao mDao = MemberDao.getInstance();
		
		MemberVo mVo = mDao.checkPassword(id, pw);
		
		if(mVo != null) {
			System.out.println("if pass : "+pw);
			System.out.println("Servlet if : 1");
			resp.getWriter().print("1");
		} else {
			System.out.println("else pass : "+pw);
			System.out.println("Servlet else : -1");
			resp.getWriter().print("-1");
		}
		
	}
}
