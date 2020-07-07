package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChatRoomServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChatRoomServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name") == null){
			session.setAttribute("name", "ÓÎ¿Í"+Math.round(Math.random()*1000));
		}
		
		ServletContext application = this.getServletContext();	
		String content = request.getParameter("content");
		String old = (String)application.getAttribute("content");
		
		if(old == null)
		{
			application.setAttribute("content", "");			
		}
		
		if(content!=null)
		{
			if(!content.equals(""))
			{
				content=  session.getAttribute("name")+ "Ëµ£º" + content + "\n"+ old;
				application.setAttribute("content", content);
			}
		}
		
		out.println(application.getAttribute("content"));

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
