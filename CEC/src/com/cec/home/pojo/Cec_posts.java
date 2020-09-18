package com.cec.home.pojo;

import java.util.Date;
import java.util.List;

public class Cec_posts {
	private int posts_id;
	private String posts_title;
	private String posts_content;
	private Date posts_time;
	private int posts_status;
	private Cec_user cec_user;
	
	

	public int getPosts_id() {
		return posts_id;
	}

	public void setPosts_id(int posts_id) {
		this.posts_id = posts_id;
	}

	public String getPosts_title() {
		return posts_title;
	}

	public void setPosts_title(String posts_title) {
		this.posts_title = posts_title;
	}

	public String getPosts_content() {
		return posts_content;
	}

	public void setPosts_content(String posts_content) {
		this.posts_content = posts_content;
	}

	public Date getPosts_time() {
		return posts_time;
	}

	public void setPosts_time(Date posts_time) {
		this.posts_time = posts_time;
	}

	public int getPosts_status() {
		return posts_status;
	}

	public void setPosts_status(int posts_status) {
		this.posts_status = posts_status;
	}

	public Cec_user getCec_user() {
		return cec_user;
	}

	public void setCec_user(Cec_user cec_user) {
		this.cec_user = cec_user;
	}

	@Override
	public String toString() {
		return "Cec_posts [posts_id=" + posts_id + ", posts_title=" + posts_title + ", posts_content=" + posts_content
				+ ", posts_time=" + posts_time + ", posts_status=" + posts_status + ", cec_user=" + cec_user
				+ "]";
	}


}
