package com.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.EventDao;
import com.db.dbconnect;
import com.google.gson.Gson;
import com.user.event;

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String date = request.getParameter("date");
	     String eid = request.getParameter("id");
	     ArrayList<String> eventNames = new ArrayList<>();
	     
	     EventDao ed= new EventDao(dbconnect.getConn());
	     List<event> events = ed.getEvent(eid, date);
	        
	        
	        // Database connection and query
	        
	        
	        for (event e : events) {
                eventNames.add(e.getEvent());
            }
	       
	        
	        
	        
	        // Convert events to JSON and send response
	        Gson gson = new Gson();
	        String json = gson.toJson(eventNames);
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        out.print("{\"eventNames\":" + json + "}");
	        out.flush();
	    }
	}
