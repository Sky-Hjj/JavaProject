package com.cec.home.pojo;

import java.util.Date;

public class Cec_announcement {
	private int announcement_id;
	private String announcement_title;
	private String announcement_content;
	private Date announcement_time;
	public int getAnnouncement_id() {
		return announcement_id;
	}
	public void setAnnouncement_id(int announcement_id) {
		this.announcement_id = announcement_id;
	}
	public String getAnnouncement_title() {
		return announcement_title;
	}
	public void setAnnouncement_title(String announcement_title) {
		this.announcement_title = announcement_title;
	}
	public String getAnnouncement_content() {
		return announcement_content;
	}
	public void setAnnouncement_content(String announcement_content) {
		this.announcement_content = announcement_content;
	}
	public Date getAnnouncement_time() {
		return announcement_time;
	}
	public void setAnnouncement_time(Date announcement_time) {
		this.announcement_time = announcement_time;
	}
	@Override
	public String toString() {
		return "Cec_announcement [announcement_id=" + announcement_id + ", announcement_title=" + announcement_title
				+ ", announcement_content=" + announcement_content + ", announcement_time=" + announcement_time + "]";
	}
}
