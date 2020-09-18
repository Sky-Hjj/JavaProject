package com.cec.admin.posts.service;

import java.util.List;

import com.cec.admin.posts.dao.PostsDao;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.PageBean;

public class PostsService {
	PostsDao postsDao = new PostsDao();

	/**
	 * 根据帖子状态查询帖子
	 * 
	 * @param id
	 * @param pc 
	 * @param ps 
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
	 * 加载帖子详情信息
	 * 
	 * @param id
	 * @return
	 */
	public Cec_posts detailPosts(int id) {
		try {
			return postsDao.detailPosts(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 删除帖子
	 * 
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
