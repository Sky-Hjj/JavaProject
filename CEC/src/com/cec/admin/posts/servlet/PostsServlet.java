package com.cec.admin.posts.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cec.admin.posts.service.PostsService;
import com.cec.admin.user.service.UserService;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;

import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class PostsServlet
 */
@WebServlet("/AdminPostsServlet")
public class PostsServlet extends BaseServlet {
	PostsService postsService = new PostsService();
	UserService userService = new UserService();

	/**
	 * 查询全部的帖子（未删除）
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
		int pc = getPc(req);//得到pc
		int ps = 5;//给定ps的值，第页5行记录
		int id = 1;
		PageBean<Cec_posts> findAllPosts = postsService.findAllPosts(id,ps,pc);
		req.setAttribute("findAllPosts", findAllPosts);
		return "/adminjsps/admin/postsManage/all.jsp";
		}else{
			req.setAttribute("Error", "请登录后再操作");
			req.getRequestDispatcher("/adminjsps/admin/body.jsp").forward(req, resp);
		}
		return null;
	}
	
	/**
	 * 获取pc
	 * @param request
	 * @return
	 */
	private int getPc(HttpServletRequest request) {
		/*
		 * 1. 得到pc
		 *   如果pc参数不存在，说明pc=1
		 *   如果pc参数存在，需要转换成int类型即可
		 */
		String value = request.getParameter("pc");
		if(value == null || value.trim().isEmpty()) {
			return 1;
		}
		return Integer.parseInt(value);
	}
	
	/**
	 * 加载帖子详情信息
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String detailPosts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String posts_id = req.getParameter("posts_id");
		int id = Integer.parseInt(posts_id);
		Cec_posts detailPosts = postsService.detailPosts(id);
		req.setAttribute("detailPosts", detailPosts);
		req.setAttribute("findAllUser", userService.AllUser());
		return "/adminjsps/admin/postsManage/Detail.jsp";
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
		String posts_id = req.getParameter("posts_id");
		int id = Integer.parseInt(posts_id);
		postsService.deletePosts(id);
		req.getRequestDispatcher("/AdminPostsServlet?method=findAllPosts").forward(req, resp);
	}

	/**
	 * 查询已经删除的帖子
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAlldeletePosts(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
		int id = 0;
		int pc = getPc(req);//得到pc
		int ps = 5;//给定ps的值，第页5行记录
		PageBean<Cec_posts> findAllPosts = postsService.findAllPosts(id,ps,pc);
		req.setAttribute("findAllPosts", findAllPosts);
		return "/adminjsps/admin/postsManage/delete.jsp";
		}else{
			req.setAttribute("Error", "请登录后再操作");
			req.getRequestDispatcher("/adminjsps/admin/body.jsp").forward(req, resp);
		}
		return null;
	}
}
