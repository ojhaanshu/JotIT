package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.postDao;
import com.db.dbconnect;


@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Integer noteid = Integer.parseInt(request.getParameter("note-id"));
	
	postDao dao = new postDao(dbconnect.getConn());
	boolean val=dao.deletebyid(noteid);
	
	if(val) {
		HttpSession session =request.getSession();
		session.setAttribute("delete-ms", "Successfully Deleted");
		response.sendRedirect("showNotes.jsp");
	}
	else {
		HttpSession session =request.getSession();
		session.setAttribute("delete-ms", "Something went wrong on server side ");
		response.sendRedirect("showNotes.jsp");
		
	}
	
	
	}

	

}
