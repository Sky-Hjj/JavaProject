package com.cec.home.user.service;

import java.sql.SQLException;
import java.util.List;

import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
import com.cec.home.user.dao.UserDao;

public class UserService {
	UserDao userDao = new UserDao();
	public Cec_user login(String name, String psw) throws SQLException {
		return userDao.login(name,psw);
	}
	/**
	 * 加载个人主页的帖子
	 * @param id
	 * @return
	 */
	public List<Cec_posts> findmyposts(String id) {
		List<Cec_posts> myposts = null;
		try {
			myposts = userDao.findmyposts(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myposts;
	}
	/**
	 * 加载用户详情信息
	 * @param id
	 * @return
	 */
	public Cec_user loadUser(int id) {
		try {
			return userDao.loadUser(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 修改个人信息
	 * @param cec_user
	 */
	public void updateUser(Cec_user cec_user) {
		try {
			userDao.updateUser(cec_user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
