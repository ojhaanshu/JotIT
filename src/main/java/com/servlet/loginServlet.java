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

@WebServlet("/UserLogin")
public class loginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request ,HttpServletResponse response)throws ServletException ,IOException{
		
		String email = request.getParameter("lmail");
		String password = request.getParameter("lpass");
		
		userDetails usd = new userDetails();
		usd.setEmail(email);
		usd.setPassword(password);
		
		userDao ud = new userDao(dbconnect.getConn());
		
		
		userDetails user = ud.loginuser(usd);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userD",user );
			response.sendRedirect("home.jsp");
			
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("lo-fail", "Wrong Username or Password");	
			response.sendRedirect("login.jsp");
			}
			
		}
	}


