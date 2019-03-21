package xyz.hees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xyz.hees.dao.BoardDao;
import xyz.hees.vo.BoardVo;

@WebServlet("/passCheck")
public class PassCheckServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass = req.getParameter("pass");
		String num = req.getParameter("num");
		
		BoardDao bDao = BoardDao.getInstance();
		// BoardVo bVo = bDao.selectOneBoardByNum(num);
		
		BoardVo bVo = bDao.checkPassword(pass, num);
		
		/*int result = bDao.checkPass(num);
		System.out.println("result : "+result);*/
		
		/*if(result == 1 && bVo.getPass().equals(pass)) {
			System.out.println("Servlet if : " + result);
			resp.getWriter().print(result);
		} else {
			System.out.println("Servlet else : " + result);
			resp.getWriter().print(result);
		}*/
		
		if(bVo != null) {
			System.out.println("if pass : "+pass);
			System.out.println("Servlet if : 1");
			resp.getWriter().print("1");
		} else {
			System.out.println("else pass : "+pass);
			System.out.println("Servlet else : -1");
			resp.getWriter().print("-1");
		}
		
	}
}
