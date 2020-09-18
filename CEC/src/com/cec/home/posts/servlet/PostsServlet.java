package com.cec.home.posts.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.cec.admin.user.service.UserService;
import com.cec.home.announcement.service.AnnouncementService;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.Cec_comment;
import com.cec.home.pojo.Cec_comment_User;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;
import com.cec.home.posts.service.PostsService;
import com.sun.xml.internal.bind.v2.model.core.ID;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class PostsServlet
 */
@WebServlet("/PostsServlet")
public class PostsServlet extends BaseServlet {
	PostsService postsService = new PostsService();
	AnnouncementService announcementService = new AnnouncementService();
	UserService adminuserService = new UserService();

	/**
	 * 查询最新的帖子
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findNewPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = 1;
		List<Cec_posts> findNewPosts = postsService.findNewPosts(id);
		List<Cec_announcement> findNewAnnouncement = announcementService.findNewAnnouncement();
		req.setAttribute("findNewPosts", findNewPosts);
		req.setAttribute("findNewAnnouncement", findNewAnnouncement);
		return "/jsps/index.jsp";
	}

	/**
	 * 查询全部的帖子
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
		int pc = getPc(req);// 得到pc
		int ps = 10;// 给定ps的值，第页5行记录
		int id = 1;
		PageBean<Cec_posts> findAllPosts = postsService.findAllPosts(id, ps, pc);
		req.setAttribute("findAllPosts", findAllPosts);
		System.out.println(findAllPosts);
		return "/jsps/bbs.jsp";
		} else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
		return null;
	}

	/**
	 * 获取pc
	 * 
	 * @param request
	 * @return
	 */
	private int getPc(HttpServletRequest request) {
		/*
		 * 1. 得到pc 如果pc参数不存在，说明pc=1 如果pc参数存在，需要转换成int类型即可
		 */
		String value = request.getParameter("pc");
		if (value == null || value.trim().isEmpty()) {
			return 1;
		}
		return Integer.parseInt(value);
	}

	/**
	 * 发布帖子
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void insertPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_posts cec_posts = CommonUtils.toBean(req.getParameterMap(), Cec_posts.class);
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
			cec_posts.setCec_user(user);
			cec_posts.setPosts_status(1);
			cec_posts.setPosts_time(new Date());
			postsService.insertPosts(cec_posts);
			req.getRequestDispatcher("/PostsServlet?method=findAllPosts").forward(req, resp);
		} else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}

	/**
	 * 帖子详情信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void detailsPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
			String posts_id = req.getParameter("posts_id");
			Cec_posts detailsPosts = postsService.detailsPosts(posts_id);
			req.setAttribute("detailsPosts", detailsPosts);
			List<Cec_comment_User> allComment = postsService.allComment(posts_id);
			req.setAttribute("allComment", allComment);
			List<Cec_user> findAllUser = adminuserService.AllUser();
			req.setAttribute("findAllUser", findAllUser);
			System.out.println(detailsPosts);
			System.out.println(findAllUser);
			System.out.println("评论" + allComment);
			req.getRequestDispatcher("/jsps/Detail.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}

	/**
	 * 对帖子发表评论
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void insertComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
			Cec_comment cec_comment = CommonUtils.toBean(req.getParameterMap(), Cec_comment.class);
			String pid = req.getParameter("posts_id");
			cec_comment.setComment_time(new Date());
			cec_comment.setCec_user(user);
			postsService.insertComment(pid, cec_comment);
			req.getRequestDispatcher("/PostsServlet?method=detailsPosts").forward(req, resp);
		} else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}

	/**
	 * 删除帖子
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deletePosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
			String uid = req.getParameter("user_id");
			String posts_id = req.getParameter("posts_id");
			int id = Integer.parseInt(posts_id);
			postsService.deletePosts(id);
			req.getRequestDispatcher("/UserServlet?method=myhome&user_id=" + uid).forward(req, resp);
		} else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}
	//
}
