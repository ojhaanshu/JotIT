package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.postDao;
import com.db.dbconnect;
import com.user.post;
 

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   int uid =Integer.parseInt(request.getParameter("uid"));
	   String title=request.getParameter("title");
	   String content = request.getParameter("content");
	   
	  postDao po = new postDao(dbconnect.getConn());
	  boolean f = po.addNotes(title, content, uid);
	  
	  if(f) {
		  System.out.println("data inserted successfully");
		  response.sendRedirect("showNotes.jsp");
	  }
	  else {
		  System.out.println("data not inserted ");
	  }
	
	
	
	
	}

	
}
