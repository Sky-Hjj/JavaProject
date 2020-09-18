package com.sky.books.user.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sky.books.Util.DataSourceUtils;
import com.sky.books.user.domian.Admin;
import com.sky.books.user.domian.User;

public class UserDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	//注册用户
	public int register(User user) throws SQLException {
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
		int update = runner.update(sql, user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode());
		return update;
		
	}
	//激活用户
	public void active(String activeCode) throws SQLException {
		String sql = "update user set state=? where code=?";
		runner.update(sql,1,activeCode);
	}
	//查询用户名
	public Long checkUsername(String username) throws SQLException {
		String sql = "select count(*) from user where username=?";
		Long query = (Long) runner.query(sql,new ScalarHandler(),username);
		return query;
	}
	//登录
	public User login(String username, String password) throws SQLException {
		String sql = "select * from user where username=? and password=?";
		return runner.query(sql, new BeanHandler<User>(User.class),username,password);
	
	}
	//管理员登录
	public Admin adminLogin(String adminid, String adminpsw) throws SQLException {
		String sql = "select * from admin where adminid=? and adminpsw=?";
		return runner.query(sql, new BeanHandler<Admin>(Admin.class),adminid,adminpsw);
	}

}
