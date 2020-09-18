package com.cec.home.user.servlet;

import static org.hamcrest.CoreMatchers.nullValue;

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

import com.cec.home.pojo.Cec_posts;
import com.cec.home.pojo.Cec_user;
/**
 * Servlet implementation class UserServlet
 */
import com.cec.home.user.service.UserService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    UserService userService = new UserService();  
    /**
     * 登录
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
	public void login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException {
		HttpSession session = req.getSession();
		String name = req.getParameter("txtID");
		int id = Integer.parseInt(name);
		String psw = req.getParameter("txtPwd");
		Cec_user user = null;
		user = userService.login(name, psw);
		if (user != null) {
			int remid1 = user.getUser_id();
			String remid = String.valueOf(remid1);
			// 登录成功
			// ***************判断用户是否勾选了自动登录*****************
			String autoLogin = req.getParameter("rememberID");
			if ("rememberID".equals(autoLogin)) {
				
				// 要自动登录
				// 创建存储用户名的cookie
				Cookie cookie_username = new Cookie("cookie_username",remid);
				// cookies的保存时间
				cookie_username.setMaxAge(60 * 60 * 24);
				cookie_username.setPath(req.getContextPath());
				// 创建存储密码的cookie
				Cookie cookie_password = new Cookie("cookie_password", user.getUser_password());
				cookie_password.setMaxAge(60 * 60 * 24);
				cookie_password.setPath(req.getContextPath());
				// 增加到cookies
				resp.addCookie(cookie_username);
				resp.addCookie(cookie_password);
			}else {
				Cookie cookie_username = new Cookie("cookie_username", "");
				cookie_username.setMaxAge(0);
				Cookie cookie_password = new Cookie("cookie_password", "");
				cookie_password.setMaxAge(0);
				resp.addCookie(cookie_username);
				resp.addCookie(cookie_password);
			}
			String remName = req.getParameter("rememberPwd");
			if ("rememberPwd".equals(remName)) {
				Cookie cookie_name = new Cookie("cookie_name", remid);
				cookie_name.setMaxAge(60 * 60 * 24);// 一天
				cookie_name.setPath(req.getContextPath());
				resp.addCookie(cookie_name);

				Cookie cookie_psw = new Cookie("cookie_psw", user.getUser_password());
				cookie_psw.setMaxAge(60 * 60 * 24);
				cookie_psw.setPath(req.getContextPath());
				resp.addCookie(cookie_psw);
			} else {
				Cookie cookie_name = new Cookie("cookie_name", "");
				cookie_name.setMaxAge(0);
				Cookie cookie_psw = new Cookie("cookie_psw", "");
				cookie_psw.setMaxAge(0);
				resp.addCookie(cookie_name);
				resp.addCookie(cookie_psw);
			}
			session.setAttribute("user", user);
			resp.sendRedirect(req.getContextPath() + "/PostsServlet?method=findNewPosts");
		}else{
			req.setAttribute("loginError", "用户名或密码错误");
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}
	/**
	 * 注销用户
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// 从session中将user删除
		session.removeAttribute("user");
		Cookie cookie_username = new Cookie("cookie_username", "");
		cookie_username.setMaxAge(0);
		Cookie cookie_password = new Cookie("cookie_password", "");
		cookie_password.setMaxAge(0);
		resp.addCookie(cookie_username);
		resp.addCookie(cookie_password);
		resp.sendRedirect(req.getContextPath() + "/jsps/UserLogin.jsp");
	}
	
	/**
	 * 我的主页
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void myhome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user!=null) {
			String id = req.getParameter("user_id");
			List<Cec_posts> myposts = userService.findmyposts(id);
			req.setAttribute("myposts", myposts);
			req.getRequestDispatcher("/jsps/pzone.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}
	
	/**
	 * 加载个人信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user!=null) {
		String user_id = req.getParameter("user_id");
		int id = Integer.parseInt(user_id);
		req.setAttribute("loadUser", userService.loadUser(id));
		req.getRequestDispatcher("/jsps/userSet.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}
	/**
	 * 更新个人信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user!=null) {
		HttpSession session = req.getSession();
		Cec_user cec_user = CommonUtils.toBean(req.getParameterMap(), Cec_user.class);
		System.out.println(cec_user);
		userService.updateUser(cec_user);
		session.setAttribute("user", cec_user);
		req.getRequestDispatcher("/UserServlet?method=myhome").forward(req, resp);
	}else {
		req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
	}
	}
}
