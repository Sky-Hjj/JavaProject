package com.cec.admin.user.service;

import java.sql.SQLException;
import java.util.List;

import com.cec.admin.user.dao.UserDao;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;

public class UserService {
	UserDao userDao = new UserDao();
	/**
	 * 查询全部的用户
	 * @param ps 
	 * @param pc 
	 * @return
	 * @throws SQLException 
	 */
	public PageBean<Cec_user> findAllUser(int pc, int ps) throws SQLException {
		return userDao.findAllUser(pc,ps);
	}
	/**
	 * 删除用户
	 * @param id
	 */
	public void deleteUser(int id) {
		try {
			userDao.deleteUser(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 加载用户详细信息
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
	 * 修改详情信息
	 * @param cec_user
	 */
	public void updateUser(Cec_user cec_user) {
		try {
			userDao.updateUser(cec_user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 新增用户
	 * @param cec_user
	 * @return 
	 */
	public boolean addUser(Cec_user cec_user) {
		int row = 0;
		try {
			row = userDao.InsertUser(cec_user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row>0;
	}
	/**
	 * 查询已删除的用户
	 * @param ps 
	 * @param pc 
	 * @return
	 */
	public PageBean<Cec_user> resignationUser(int pc, int ps) {
		PageBean<Cec_user> resignationUser = null;
		try {
			resignationUser = userDao.resignationUser(pc,ps);
		} catch (Exception e) {
		}
		return resignationUser;
	}
	/**
	 * 查询整个表的用户
	 * @return
	 */
	public List<Cec_user> AllUser() {
		List<Cec_user> AllUser = null;
		try {
			AllUser = userDao.AllUser();
		} catch (Exception e) {
		}
		return AllUser;
	}

}
