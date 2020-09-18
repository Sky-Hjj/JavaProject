package com.sky.books.user.service;

import java.sql.SQLException;

import com.sky.books.user.dao.UserDao;
import com.sky.books.user.domian.Admin;
import com.sky.books.user.domian.User;

public class UserService {
	UserDao dao = new UserDao();
	//注册用户
	public boolean register(User user) {
		int row = 0;
		try {
			row = dao.register(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row>0;
	}
	//激活用户
	public void active(String activeCode) {
		try {
			dao.active(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//查询用户名
	public boolean checkUsername(String username) {
		Long isExist = 0L;
		try {
			isExist = dao.checkUsername(username);
			System.out.println(isExist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isExist>0?true:false;
	}
	//用户登录
	public User login(String username, String password) throws SQLException {
		return dao.login(username,password);
	}
	//管理员登录
	public Admin adminLogin(String adminid, String adminpsw) throws SQLException {
		return dao.adminLogin(adminid,adminpsw);
		
	}
	
}
