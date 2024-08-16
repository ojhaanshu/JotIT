package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.EventDao;
import com.db.dbconnect;
import com.google.gson.Gson;

/**
 * Servlet implementation class deleteEvent
 */
@WebServlet("/deleteEvent")
public class deleteEvent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		
		EventDao ed = new EventDao(dbconnect.getConn());
		boolean op= ed.deleteEvent(content, date);
		if(op) {
			System.out.print("deleted");
		}
		else {
			System.out.print("Not deleted");
		}
		
		Gson gson = new Gson();
        String json = gson.toJson(op);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"op\":" + json + "}");
        out.flush();
		
	}

}
