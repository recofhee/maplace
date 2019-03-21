package xyz.hees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/valid")
public class Valid extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		
		resp.setContentType("text/plain");
		if(email != null && pw != null && email.equals("hee@email.com") && pw.equals("045692")) {
			resp.getWriter().print("success");
		} else {
			resp.getWriter().print("failed");
		}
	}
}
