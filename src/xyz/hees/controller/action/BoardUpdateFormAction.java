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

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String url = "boardUpdate.jsp";
		
		String num = req.getParameter("num");
		
		BoardDao bDao = BoardDao.getInstance();
		bDao.updateReadCount(num);
		
		BoardVo bVo = bDao.selectOneBoardByNum(num);
		req.setAttribute("board", bVo);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}
