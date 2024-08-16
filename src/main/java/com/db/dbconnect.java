package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnect {
	
	public static Connection getConn() {
		 Connection conn = null;
		try {
			if(conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/jotit","root","root123");
			
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return conn;
		
	}
	

}
