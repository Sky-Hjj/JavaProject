package com.cec.admin.announcement.dao;

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
	 * 新增公告
	 * 
	 * @param cec_announcement
	 * @throws SQLException
	 */
	public void AddAnnouncement(Cec_announcement cec_announcement) throws SQLException {
		String sql = "insert into cec_announcement value(?,?,?,?)";
		runner.update(sql, cec_announcement.getAnnouncement_id(), cec_announcement.getAnnouncement_title(),
				cec_announcement.getAnnouncement_content(), cec_announcement.getAnnouncement_time());
	}

	/**
	 * 查询全部公告
	 * @param ps 
	 * @param pc 
	 * 
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
		sql = "select * from cec_announcement limit ?,?";
		List<Cec_announcement> beanList = runner.query(sql, new BeanListHandler<Cec_announcement>(Cec_announcement.class),(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
	}

	/**
	 * 删除公告信息
	 * 
	 * @param id
	 * @throws SQLException
	 */
	public void deleteAnnouncement(int id) throws SQLException {
		String sql = "delete from cec_announcement where announcement_id=?";
		runner.update(sql, id);
	}

	/**
	 * 加载公告详情
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Cec_announcement loadAnnouncement(int id) throws SQLException {
		String sql = "select * from cec_announcement where announcement_id=?";
		return runner.query(sql, new BeanHandler<Cec_announcement>(Cec_announcement.class), id);
	}

	/**
	 * 修改公告内容
	 * 
	 * @param cec_announcement
	 * @throws SQLException
	 */
	public void updateAnnouncement(Cec_announcement cec_announcement) throws SQLException {
		String sql = "update cec_announcement set announcement_title=?, announcement_content=? where announcement_id=?";
		Object[] params = { cec_announcement.getAnnouncement_title(), cec_announcement.getAnnouncement_content(),
				cec_announcement.getAnnouncement_id() };
		runner.update(sql, params);
	}

}
