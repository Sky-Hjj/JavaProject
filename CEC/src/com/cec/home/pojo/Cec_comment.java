package com.cec.home.pojo;

import java.util.Date;

public class Cec_comment {
	private int comment_id;
	private String comment_content;
	private Date comment_time;
	private Cec_posts cec_posts;
	private Cec_user cec_user;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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
	public Cec_posts getCec_posts() {
		return cec_posts;
	}
	public void setCec_posts(Cec_posts cec_posts) {
		this.cec_posts = cec_posts;
	}
	public Cec_user getCec_user() {
		return cec_user;
	}
	public void setCec_user(Cec_user cec_user) {
		this.cec_user = cec_user;
	}
	@Override
	public String toString() {
		return "Cec_comment [comment_id=" + comment_id + ", comment_content=" + comment_content + ", comment_time="
				+ comment_time + ", cec_posts=" + cec_posts + ", cec_user=" + cec_user + "]";
	}
	
}
