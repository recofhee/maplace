package xyz.hees.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import xyz.hees.dao.BoardDao;
import xyz.hees.vo.BoardVo;

@WebServlet("/boardWrite")
public class BoardWriteAction extends HttpServlet{

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		ServletContext context = getServletContext();
		String realPath = context.getRealPath("/upload");
		System.out.print("실제 서버 상의 디렉토리 : ");
		System.out.println(realPath);
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
		
		
		MultipartRequest multi = new MultipartRequest(req, realPath, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		String name = multi.getParameter("name");
		String id = multi.getParameter("id");
		String pass = multi.getParameter("pass");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String fileName = multi.getFilesystemName("fileName");
		String originFileName = multi.getOriginalFileName("fileName");
		
		BoardVo bVo = new BoardVo();
		bVo.setName(name);
		bVo.setId(id);
		bVo.setPass(pass);
		bVo.setTitle(title);
		bVo.setContent(content);
		bVo.setFileName(fileName);
		bVo.setOriginFileName(originFileName);
		
		/*BoardVo bVo = new BoardVo();
		bVo.setName(req.getParameter("name"));
		bVo.setId(req.getParameter("id"));
		bVo.setPass(req.getParameter("pass"));
		bVo.setTitle(req.getParameter("title"));
		bVo.setContent(req.getParameter("content"));
		bVo.setFileName(req.getParameter("fileName"));*/
		
		BoardDao bDao = BoardDao.getInstance();
		bDao.insertBoard(bVo);
		
		//new BoardListAction().execute(req, resp);
		resp.sendRedirect("BoardServlet?command=board_list");
	}
	
}
