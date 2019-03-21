package xyz.hees.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xyz.hees.dao.BoardDao;
import xyz.hees.vo.BoardVo;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "boardList.jsp";
		
		BoardDao bDao = BoardDao.getInstance();
		
		List<BoardVo> boardList = bDao.selectAllBoards();
		
		req.setAttribute("boardList", boardList);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}
