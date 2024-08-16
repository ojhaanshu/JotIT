package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.user.event;



public class EventDao {
	
	private Connection conn;
	
	public EventDao(Connection conn){
		super();
		this.conn = conn;
	}
	
	public boolean addEvents(String event ,String date,int eid) {
		boolean f = false;
		try {
			String que = "Insert into calendar(event,date,eid) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setString(1,event);
			ps.setString(2, date);
			ps.setInt(3, eid);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			
		}
		return f;
		
	}
	
	public List<event> getEvent(String eid,String date){
		ArrayList<event> events = new ArrayList<>();
		event e = null;
		try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/jotit";
            String jdbcUser = "root";
            String jdbcPassword = "root123";
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

            String query = "SELECT * FROM calendar WHERE  date = ? and eid= ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, date);
            statement.setString(2, eid);
            ResultSet resultSet = statement.executeQuery();
            

            while (resultSet.next()) {
            	e = new event(); 
            	e.setId((resultSet.getInt(1)));
            	e.setEvent(resultSet.getString(2));
            	e.setDate(resultSet.getString(3));
            	
                events.add(e);
            }
            

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
		
		return events;
	}
	
	public boolean deleteEvent(String content , String date) {
		boolean b = false;
		
		try {
			String que = "delete from calendar where event=? and date =?";
			PreparedStatement ps= conn.prepareStatement(que);
			ps.setString(1, content);
			ps.setString(2, date);
			
			int x =ps. executeUpdate();
			if(x == 1) {
				b=true;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return b;
	}

}
