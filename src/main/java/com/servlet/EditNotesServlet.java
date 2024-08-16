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

/**
 * Servlet implementation class EditNotesServlet
 */
@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		
		Integer noteid= Integer.parseInt(request.getParameter("note"));
		String  title= request.getParameter("title");
		String  content = request.getParameter("content");
		postDao ob = new postDao(dbconnect.getConn());
		boolean f = ob.postUpdate(noteid, title, content);
		if(f) {
			System.out.print("data updated successfully");
			HttpSession sess = request.getSession();
			sess.setAttribute("update_succ","Successfully Updated");
			response.sendRedirect("showNotes.jsp");
			
			
		}
		else {
			System.out.print("data updated not successfully");
		}
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	

}
