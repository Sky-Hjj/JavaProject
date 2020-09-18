package com.cec.home.posts.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cec.home.pojo.Cec_comment;
import com.cec.home.pojo.Cec_comment_User;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.PageBean;
import com.cec.home.posts.dao.PostsDao;

public class PostsService {
	PostsDao postsDao =new PostsDao();
	/**
	 * 查询最新的帖子
	 * @param id
	 * @return
	 */
	public List<Cec_posts> findNewPosts(int id) {
		List<Cec_posts> cec_posts = null;
		try {
			cec_posts = postsDao.findNewPosts(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cec_posts;
	}
	/**
	 * 查询全部的帖子
	 * @param id
	 * @param ps
	 * @param pc
	 * @return
	 */
	public PageBean<Cec_posts> findAllPosts(int id, int ps, int pc) {
		PageBean<Cec_posts> cec_posts = null;
		try {
			cec_posts = postsDao.findAllPosts(id,ps,pc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cec_posts;
	}
	/**
	 * 发表帖子
	 * @param cec_posts
	 */
	public void insertPosts(Cec_posts cec_posts) {
		try {
			postsDao.AddAnnouncement(cec_posts);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 帖子详情
	 * @param posts_id
	 * @return
	 */
	public Cec_posts detailsPosts(String posts_id) {
		try {
			return postsDao.loadUser(posts_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询评论
	 * @param posts_id
	 * @return
	 */
	public List<Cec_comment_User> allComment(String posts_id) {
		List<Cec_comment_User> cec_comments = null;
		try {
			cec_comments = postsDao.allComment(posts_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cec_comments;
	}
	/**
	 * 新增发表评论
	 * @param pid
	 * @param cec_comment
	 */
	public void insertComment(String pid, Cec_comment cec_comment) {
		try {
			postsDao.insertComment(pid,cec_comment);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除帖子
	 * @param id
	 */
	public void deletePosts(int id) {
		try {
			postsDao.deletePosts(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
