package com.cec.admin.adminlogin.service;

import java.sql.SQLException;

import com.cec.admin.adminlogin.dao.LoginDao;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_user;

public class LoginService {
	LoginDao loginDao = new LoginDao();
	/**
	 * 管理员登录
	 * @param name
	 * @param psw
	 * @return
	 * @throws SQLException
	 */
	public Cec_admin login(String name, String psw) throws SQLException {
		return loginDao.login(name,psw);
	}

}
