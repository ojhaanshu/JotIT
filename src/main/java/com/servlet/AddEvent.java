package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.EventDao;
import com.db.dbconnect;

/**
 * Servlet implementation class AddEvent
 */
@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eid = Integer.parseInt(request.getParameter("eid"));
		String event = (request.getParameter("event"));
		String date =(request.getParameter("date"));
		
		EventDao edo = new EventDao(dbconnect.getConn());
		boolean r= edo.addEvents(event, date, eid);
		if(r) {
			System.out.println("data inserted successfully");
			HttpSession sess = request.getSession();
			sess.setAttribute("add_succ","New Event Added");
			response.sendRedirect("Calendar.jsp");
		}
		else {
			System.out.println("data not inserted successfully");
		}
		
		
	}

}
