package com.cec.home.posts.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.cec.Util.DataSourceUtils;
import com.cec.home.pojo.Cec_comment;
import com.cec.home.pojo.Cec_comment_User;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;


import cn.itcast.commons.CommonUtils;

public class PostsDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 查询最新的帖子
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<Cec_posts> findNewPosts(int id) throws SQLException {
		String sql = "SELECT * FROM cec_user,cec_posts WHERE cec_posts.user_id=cec_user.user_id and posts_status=? order by posts_time desc limit ?,?";
		List<Cec_posts> postsNewList = runner.query(sql, new BeanListHandler<Cec_posts>(Cec_posts.class), id,0,14);
		return postsNewList;
	}
	/**
	 * 查询全部的帖子
	 * @param id
	 * @param ps
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Cec_posts> findAllPosts(int id, int ps, int pc) throws SQLException {
		PageBean<Cec_posts> pb = new PageBean<Cec_posts>();
		pb.setPc(pc);
		pb.setPs(ps);
		String sql = "select count(*) from cec_posts";
		Number num = (Number)runner.query(sql,new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		sql = "SELECT * FROM cec_user,cec_posts WHERE cec_posts.user_id=cec_user.user_id and posts_status=? order by posts_time desc limit ?,?";
		List<Cec_posts> beanList = runner.query(sql, new BeanListHandler<Cec_posts>(Cec_posts.class),id,(pc-1)*ps,ps);
		pb.setBeanList(beanList);
		return pb;
		}
	/**
	 * 发布帖子
	 * @param cec_posts
	 * @throws SQLException
	 */
	public void AddAnnouncement(Cec_posts cec_posts) throws SQLException {
		String sql = "insert into cec_posts value(?,?,?,?,?,?)";
		runner.update(sql,cec_posts.getPosts_id(),cec_posts.getPosts_title(),cec_posts.getPosts_content(),
				cec_posts.getPosts_time(),cec_posts.getPosts_status(),cec_posts.getCec_user().getUser_id());
	}
	/**
	 * 加载个人主页
	 * @param posts_id
	 * @return
	 * @throws SQLException
	 */
	public Cec_posts loadUser(String posts_id) throws SQLException {
		String sql = "select * from cec_posts where posts_status=1 and posts_id=?";
		Map<String , Object> map = runner.query(sql, new MapHandler(),posts_id);
		Cec_user cec_user = CommonUtils.toBean(map, Cec_user.class);
		Cec_posts cec_posts = CommonUtils.toBean(map, Cec_posts.class);
		cec_posts.setCec_user(cec_user);;
		return cec_posts;
	}
	
	/**
	 * 加载帖子详情以及评论
	 * @param posts_id
	 * @return
	 * @throws SQLException
	 */
	public List<Cec_comment_User> allComment(String posts_id) throws SQLException {
		String sql = "SELECT cec_user.user_name,cec_user.user_head,cec_comment.comment_time,cec_comment.comment_content FROM cec_user,cec_comment WHERE cec_comment.user_id=cec_user.user_id and posts_id=?";
		List<Cec_comment_User> allComment = runner.query(sql, new BeanListHandler<Cec_comment_User>(Cec_comment_User.class), posts_id);
		return allComment;
	}
	
	/**
	 * 新增帖子评论
	 * @param pid
	 * @param cec_comment
	 * @throws SQLException
	 */
	public void insertComment(String pid, Cec_comment cec_comment) throws SQLException {
		String sql = "insert into cec_comment value(?,?,?,?,?)";
		runner.update(sql,cec_comment.getComment_id(),cec_comment.getComment_content(),cec_comment.getComment_time(),
				pid,cec_comment.getCec_user().getUser_id());
	}
	/**
	 * 删除帖子
	 * @param id
	 * @throws SQLException
	 */
	public void deletePosts(int id) throws SQLException {
		String sql = "update cec_posts set posts_status=0 where posts_id=?";
		runner.update(sql, id);
	}
	
}
