package xyz.hees.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/proxy")
public class ProxyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getParameter("url");
		// TODO Auto-generated method stub
		// byte -> char
		Reader in = new InputStreamReader(new URL(url).openStream());
		
		// char
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		int i = 0;
		while((i = in.read()) != -1) {
			out.write(i);
		}
	}

}
