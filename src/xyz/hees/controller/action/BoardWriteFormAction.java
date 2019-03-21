package xyz.hees.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.hees.dao.BoardDao;
import xyz.hees.dao.MemberDao;
import xyz.hees.vo.BoardVo;
import xyz.hees.vo.MemberVo;

public class BoardWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String url = "boardWrite.jsp";
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberDao dao = MemberDao.getInstance();
		
		int result = dao.userCheck(id, pw);
		
		if(result == 1) {
			MemberVo vo = dao.getMember(id);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
		}
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}
