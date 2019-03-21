package xyz.hees.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xyz.hees.dao.BoardDao;
import xyz.hees.vo.BoardVo;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = null;
		
		String num = req.getParameter("num");
		String pass = req.getParameter("pass");
		
		BoardDao bDao = BoardDao.getInstance();
		BoardVo bVo = bDao.selectOneBoardByNum(num);
		
		int result = bDao.checkPass(num);;
		
		if(bVo.getPass().equals(pass)) {
			resp.getWriter().print(result);
		} else {
			resp.getWriter().print(result);
		}
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}
