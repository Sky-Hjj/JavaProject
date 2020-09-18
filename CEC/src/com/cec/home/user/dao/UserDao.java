package com.cec.home.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;




public class UserDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 登录
	 * @param name
	 * @param psw
	 * @return
	 * @throws SQLException
	 */
	public Cec_user login(String name, String psw) throws SQLException {
		String sql = "select * from cec_user where user_id=? and user_password=? and user_status=1";
		return runner.query(sql, new BeanHandler<Cec_user>(Cec_user.class),name,psw);
	}
	/**
	 * 加载个人主页
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<Cec_posts> findmyposts(String id) throws SQLException {
		String sql = "select * from cec_posts where posts_status=1 and user_id=?";
		List<Cec_posts> myposst = runner.query(sql, new BeanListHandler<Cec_posts>(Cec_posts.class),id);
		return myposst;
	}
	/**
	 * 加载个人用户信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Cec_user loadUser(int id) throws SQLException {
		String sql = "select * from cec_user where user_id=?";
		return runner.query(sql, new BeanHandler<Cec_user>(Cec_user.class),id);
	}
	/**
	 * 修改个人信息
	 * @param user
	 * @throws SQLException
	 */
	public void updateUser(Cec_user user) throws SQLException {
		String sql = "update cec_user set user_name=?, user_sex=?,user_age=?,user_idcard=?,user_phone=?,user_email=?,user_address=? where user_id=?";
		Object[] params ={user.getUser_name(),user.getUser_sex(),user.getUser_age(),user.getUser_idcard(),user.getUser_phone(),
				user.getUser_email(),user.getUser_address(),user.getUser_id()};
		runner.update(sql, params);
	}
}
