package com.cec.home.pojo;

import java.util.Date;

public class Cec_comment_User {
	private String user_name;
	private String comment_content;
	private Date comment_time;
	private String user_head;
	public String getUser_head() {
		return user_head;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	@Override
	public String toString() {
		return "Cec_comment_User [user_name=" + user_name + ", comment_content=" + comment_content + ", comment_time="
				+ comment_time + ", user_head=" + user_head + "]";
	}
	
	
}
