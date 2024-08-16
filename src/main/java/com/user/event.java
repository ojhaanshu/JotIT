package com.user;

import java.sql.Date;

public class event {
	private int id;
	private String event;
	private String date;
	private userDetails user;
	public event() {
		super();
		// TODO Auto-generated constructor stub
	}
	public event(int id, String event, String date, userDetails user) {
		super();
		this.id = id;
		this.event = event;
		this.date = date;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public userDetails getUser() {
		return user;
	}
	public void setUser(userDetails user) {
		this.user = user;
	}
	
}
