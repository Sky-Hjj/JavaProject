package com.cec.admin.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;




public class UserDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 查询全部的用户
	 * @param ps 
	 * @param pc 
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Cec_user> findAllUser(int pc, int ps) throws SQLException {
		//String sql = "select * from cec_user where user_status=1";
		PageBean<Cec_user> pb = new PageBean<Cec_user>();
		pb.setPc(pc);
		pb.setPs(ps);
		//得到tr    select count(*) from cec_user where user_status=1
		String sql = "select count(*) from cec_user where user_status=1";
		Number num = (Number)runner.query(sql,new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		//得到beanList
		sql = "select * from cec_user where user_status=1 limit ?,?";
		List<Cec_user> beanList = runner.query(sql, new BeanListHandler<Cec_user>(Cec_user.class),(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
	}
	/**
	 * 删除用户
	 * @param id
	 * @throws SQLException
	 */
	public void deleteUser(int id) throws SQLException {
		String sql = "update cec_user set user_status=0 where user_id=?";
		runner.update(sql, id);
		
	}
	/**
	 * 修改用户资料
	 * @param user
	 * @throws SQLException
	 */
	public void updateUser(Cec_user user) throws SQLException {
		String sql = "update cec_user set user_name=?,user_password=?,user_sex=?,user_age=?,user_idcard=?,user_phone=?,user_email=?,user_address=? where user_id=?";
		Object[] params ={user.getUser_name(),user.getUser_password(),user.getUser_sex(),user.getUser_age(),user.getUser_idcard(),user.getUser_phone(),
				user.getUser_email(),user.getUser_address(),user.getUser_id()};
		runner.update(sql, params);
	}
	/**
	 * 加载用户详情信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Cec_user loadUser(int id) throws SQLException {
		String sql = "select * from cec_user where user_id=?";
		return runner.query(sql, new BeanHandler<Cec_user>(Cec_user.class),id);
	}
	/**
	 * 新增用户
	 * @param cec_user
	 * @throws SQLException
	 */
	public int InsertUser(Cec_user cec_user) throws SQLException {
		String sql = "insert into cec_user values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int params = runner.update(sql,cec_user.getUser_id(),cec_user.getUser_password(),cec_user.getUser_name(),
				cec_user.getUser_head(),cec_user.getUser_sex(),cec_user.getUser_age(),cec_user.getUser_idcard(),
				cec_user.getUser_phone(),cec_user.getUser_email(),cec_user.getUser_address(),
				cec_user.getUser_status(),cec_user.getUser_time());
		return params;
	}
	/**
	 * 查询已删除的用户
	 * @param ps 
	 * @param pc 
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Cec_user> resignationUser(int pc, int ps) throws SQLException {
		PageBean<Cec_user> pb = new PageBean<Cec_user>();
		pb.setPc(pc);
		pb.setPs(ps);
		String sql = "select count(*) from cec_user where user_status=0";
		Number num = (Number)runner.query(sql,new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		sql = "select * from cec_user where user_status=0 limit ?,?";
		List<Cec_user> beanList = runner.query(sql, new BeanListHandler<Cec_user>(Cec_user.class),(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
	}
	/**
	 * 查询整个表用户
	 * @return
	 * @throws SQLException
	 */
	public List<Cec_user> AllUser() throws SQLException {
		String sql = "select * from cec_user";
		return runner.query(sql, new BeanListHandler<Cec_user>(Cec_user.class));
	}

	
}
