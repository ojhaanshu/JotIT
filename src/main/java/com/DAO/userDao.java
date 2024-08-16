package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.dbconnect;
import com.user.userDetails;

public class userDao {
	 Connection conn = null;

	public userDao(Connection conn) {
		super();
		this.conn =conn;
	}
	
public boolean adduser(userDetails us) {
	boolean f = false;
	try {
	String query ="insert into userdata (name,email,password) values(?,?,?)"; 
	PreparedStatement ps = conn.prepareStatement(query);
	ps.setString(1,us.getName());
	ps.setString(2,us.getEmail());
	ps.setString(3,us.getPassword());
	int i=ps.executeUpdate();
	if(i==1) {
		f = true;
	}
	
	
	}
	catch(Exception e) {
	   e.printStackTrace();
		
	}
	
	return f;
	
}



public userDetails loginuser(userDetails usd) {
userDetails udet = null;
	
	try {
		String query ="select * from userdata where email=? and password=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, usd.getEmail());
		ps.setString(2, usd.getPassword());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			udet= new userDetails();
			udet.setId(rs.getInt("id"));			
			udet.setName(rs.getString("name"));
			udet.setEmail(rs.getString("email"));
			udet.setPassword(rs.getString("password"));
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
		
	}
	
	
	return udet;
}
}

