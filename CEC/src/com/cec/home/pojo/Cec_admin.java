package com.cec.home.pojo;

public class Cec_admin {
	private String admin_id;
	private String admin_password;
	public String getAdmin_id() {
		return admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	@Override
	public String toString() {
		return "Cec_admin [admin_id=" + admin_id + ", admin_password=" + admin_password + "]";
	}
	
}
