package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session1 = request.getSession();
			session1.removeAttribute("userD");
			
			HttpSession session2 = request.getSession();
			session2.setAttribute("logout-msg","Successfuly Logout..");
			response.sendRedirect("login.jsp");
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
