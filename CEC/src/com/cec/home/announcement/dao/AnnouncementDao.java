package com.cec.home.announcement.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;



public class AnnouncementDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 查询全部的公告
	 * @param pc
	 * @param ps
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Cec_announcement> findAllAnnouncement(int pc, int ps) throws SQLException {
		PageBean<Cec_announcement> pb = new PageBean<Cec_announcement>();
		pb.setPc(pc);
		pb.setPs(ps);
		String sql = "select count(*) from cec_announcement";
		Number num = (Number)runner.query(sql,new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		//得到beanList
		sql = "select * from cec_announcement ORDER  by announcement_time desc limit ?,?";
		List<Cec_announcement> beanList = runner.query(sql, new BeanListHandler<Cec_announcement>(Cec_announcement.class),(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
	}
	/**
	 * 查询最新的公告
	 * @return
	 * @throws SQLException
	 */
	public List<Cec_announcement> findNewAnnouncement() throws SQLException {
		String sql = "select * from cec_announcement  ORDER  by announcement_time desc limit ?,?";
		return runner.query(sql, new BeanListHandler<Cec_announcement>(Cec_announcement.class),0,10);
	}
	
	/**
	 * 加载公告详情信息
	 * @param announcement_id
	 * @return
	 * @throws SQLException
	 */
	public Cec_announcement loadUser(String announcement_id) throws SQLException {
		String sql = "select * from cec_announcement where announcement_id=?";
		return runner.query(sql, new BeanHandler<Cec_announcement>(Cec_announcement.class),announcement_id);
	}

}
