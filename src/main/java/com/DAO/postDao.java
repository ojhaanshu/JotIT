package com.DAO;
import com.user.post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class postDao {
	
	private Connection conn;
	
	public postDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addNotes(String ti,String con,int uid) {
		boolean f = false;
		
		try {
			String que ="Insert into post(title,content,uid) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(que);
			
			ps.setString(1, ti );
			ps.setString(2, con);
			ps.setInt(3, uid);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f =true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		return f;
	}
	
	public List<post> getData(int uid){
		
		List<post> list = new ArrayList<post>();
		post po = null;
		try {
			String que = "select * from post where uid=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				po= new post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	public post getdatabyid(Integer noteid) {
		post p =null;
		try {
			String que ="select * from post where id=?";
			PreparedStatement ps =conn. prepareStatement(que);
			ps.setInt(1,noteid);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p = new post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
				
				
	   return p;
	}
	
	public boolean postUpdate(int id,String ti,String con ) {
		boolean f=false;
		try {
			String que ="update post set title=?,content=? where id =?";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setString(1,ti);
			ps.setString(2,con);
			ps.setInt(3,id);
			
			int p = ps.executeUpdate();
			if(p==1) {
				f = true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean deletebyid(int id) {
	boolean f = false;
	try {
		String que ="delete from post where id=?";
		PreparedStatement ps =conn. prepareStatement(que);
		ps.setInt(1, id);
		int x = ps.executeUpdate();
		if(x==1) {
			f =true;
		}
		
		
	}
	catch(Exception e ) {
		e.printStackTrace();
		
	}
	return f;
}
}
