package xyz.hees.controller.action;

import java.io.IOException;
import java.util.Enumeration;

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

@WebServlet("/boardUpdate")
public class BoardUpdateAction extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		ServletContext context = getServletContext();
		String realPath = context.getRealPath("/upload");
		System.out.print("실제 서버 상의 디렉토리 : ");
		System.out.println(realPath);
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
		
		
		MultipartRequest multi = new MultipartRequest(req, realPath, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String name = multi.getParameter("name");
		String id = multi.getParameter("id");
		String pass = multi.getParameter("pass");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String originFileName = multi.getOriginalFileName("fileName");
		
		BoardVo bVo = new BoardVo();
		bVo.setNum(num);
		bVo.setName(name);
		bVo.setId(id);
		bVo.setPass(pass);
		bVo.setTitle(title);
		bVo.setContent(content);

		Enumeration<String> fileNames = multi.getFileNames();
        if(fileNames.hasMoreElements())
        {
            String fileName = fileNames.nextElement();
            String updateFile = multi.getFilesystemName(fileName);
            
            if(updateFile == null) {
            	// 새로운 파일 첨부 X -> 기존 파일명 세팅
            	bVo.setFileName(originFileName);
            	bVo.setOriginFileName(originFileName);
            }
            else {
            	// 새로운 파일 첨부
            	bVo.setFileName(updateFile);
            	bVo.setOriginFileName(originFileName);
            }
        }

		BoardDao bDao = BoardDao.getInstance();
		bDao.updateBoard(bVo);
		
		//new BoardListAction().execute(req, resp);
		resp.sendRedirect("BoardServlet?command=board_view&num="+num);
	}
}
