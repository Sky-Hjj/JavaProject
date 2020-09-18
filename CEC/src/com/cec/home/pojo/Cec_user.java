package com.cec.home.pojo;

import java.util.Date;
import java.util.List;

public class Cec_user {
	private int user_id;
	private String user_name;
	private String user_password;
	private String user_head;
	private String user_sex;
	private int user_age;
	private String user_idcard;
	private String user_phone;
	private String user_email;
	private String user_address;
	private int user_status;
	private Date user_time;
	
	
	public int getUser_id() {
		return user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public String getUser_head() {
		return user_head;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public int getUser_age() {
		return user_age;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public String getUser_address() {
		return user_address;
	}
	public int getUser_status() {
		return user_status;
	}
	public Date getUser_time() {
		return user_time;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public void setUser_time(Date user_time) {
		this.user_time = user_time;
	}
	@Override
	public String toString() {
		return "Cec_user [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_head=" + user_head + ", user_sex=" + user_sex + ", user_age=" + user_age + ", user_idcard="
				+ user_idcard + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_address="
				+ user_address + ", user_status=" + user_status + ", user_time=" + user_time +  "]";
	}
	
}
