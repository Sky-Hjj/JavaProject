package com.cec.admin.adminlogin.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_user;

public class LoginDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 管理员登录
	 * @param name
	 * @param psw
	 * @return
	 * @throws SQLException
	 */
	public Cec_admin login(String name, String psw) throws SQLException {
		String sql = "select * from cec_admin where admin_id=? and admin_password=?";
		return runner.query(sql, new BeanHandler<Cec_admin>(Cec_admin.class),name,psw);
	}

}
