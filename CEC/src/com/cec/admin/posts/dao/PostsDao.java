package com.cec.admin.posts.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;

import cn.itcast.commons.CommonUtils;

public class PostsDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

	/**
	 * 根据帖子状态查询帖子
	 * 
	 * @param id
	 * @param pc 
	 * @param ps 
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Cec_posts> findAllPosts(int id, int ps, int pc) throws SQLException {
		PageBean<Cec_posts> pb = new PageBean<Cec_posts>();
		pb.setPc(pc);
		pb.setPs(ps);
		String sql = "select count(*) from cec_posts where posts_status=?";
		Number num = (Number)runner.query(sql,new ScalarHandler(),id);
		int tr = num.intValue();
		pb.setTr(tr);
		sql = "select * from cec_posts where posts_status=? limit ?,?";
		List<Cec_posts> beanList = runner.query(sql, new BeanListHandler<Cec_posts>(Cec_posts.class),id,(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
		}

	/**
	 * 帖子详情信息
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Cec_posts detailPosts(int id) throws SQLException {
		String sql = "select * from cec_posts where posts_id=?";
		Map<String, Object> map = runner.query(sql, new MapHandler(), id);
		Cec_user cec_user = CommonUtils.toBean(map, Cec_user.class);
		Cec_posts cec_posts = CommonUtils.toBean(map, Cec_posts.class);
		cec_posts.setCec_user(cec_user);
		return cec_posts;
	}

	/**
	 * 删除帖子
	 * 
	 * @param id
	 * @throws SQLException
	 */
	public void deletePosts(int id) throws SQLException {
		String sql = "update cec_posts set posts_status=0 where posts_id=?";
		runner.update(sql, id);
	}

}
