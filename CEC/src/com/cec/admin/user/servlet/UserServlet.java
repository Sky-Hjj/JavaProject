package com.cec.admin.user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cec.admin.user.service.UserService;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/AdminUserServlet")
public class UserServlet extends BaseServlet {
	UserService userService = new UserService();
	/**
	 * 查询全部的用户信息
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException 
	 */
	public String findAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
		/*
		 * 1. 获取页面传递的pc
		 * 2. 给定ps的值
		 * 3. 使用pc和ps调用service方法，得到PageBean，保存到request域
		 * 4. 转发到list.jsp
		 */
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
			int pc = getPc(req);//得到pc
			int ps = 5;//给定ps的值，第页5行记录
			PageBean<Cec_user> pb = userService.findAllUser(pc, ps);//传递pc, ps给Service，得到PageBean
			// 设置url
			//pb.setUrl(getUrl(req));
			req.setAttribute("pb", pb);//保存到request域中
			System.out.println("全部"+pb);
			return "/adminjsps/admin/userManage/all.jsp";
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
	 * 加载用户详情信息
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		int id = Integer.parseInt(user_id);
		System.out.println(id);
		req.setAttribute("loadUser", userService.loadUser(id));
		return "/adminjsps/admin/userManage/updateuser.jsp";
	}
	
	/**
	 * 修改用户信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user cec_user = CommonUtils.toBean(req.getParameterMap(), Cec_user.class);
		System.out.println(cec_user);
		userService.updateUser(cec_user);
		req.getRequestDispatcher("/AdminUserServlet?method=findAllUser").forward(req, resp);
	}
	
	/**
	 * 删除用户信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		int id = Integer.parseInt(user_id);
		userService.deleteUser(id);
		req.getRequestDispatcher("/AdminUserServlet?method=findAllUser").forward(req, resp);
	}
	/**
	 * 查询已删除的用户
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String resignationUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
			int pc = getPc(req);//得到pc
			int ps = 5;//给定ps的值，第页5行记录
			PageBean<Cec_user> resignationUser =userService.resignationUser(pc, ps);
			req.setAttribute("resignationUser", resignationUser);
			System.out.println("已删除"+resignationUser);
			return "/adminjsps/admin/userManage/resignation.jsp";
		}else{
			req.setAttribute("Error", "请登录后再操作");
			req.getRequestDispatcher("/adminjsps/admin/body.jsp").forward(req, resp);
		}
		return null;
		
	}
	
}
