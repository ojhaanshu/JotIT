package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDao;
import com.db.dbconnect;
import com.user.userDetails;

@WebServlet("/UserServlet")
public class userServlet extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException ,IOException {
		
		PrintWriter out = res.getWriter();
		String name =req.getParameter("uname");
		String email =req.getParameter("uemail");
		String pass =req.getParameter("upass");
		
		userDetails us = new userDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(pass);
		
		
		userDao ud = new userDao(dbconnect.getConn());
		boolean f =ud.adduser(us);
		HttpSession session;
		
		if(f) {
			
			session =req.getSession();
			session.setAttribute("rsuccess", "Registered Successfuly !!!");
			res.sendRedirect("register.jsp");
		}
		else {
			
			session =req.getSession();
			session.setAttribute("rfail", "Sorry !! Someting Went Wrong");
			res.sendRedirect("register.jsp");
		}
		
		

}
}
