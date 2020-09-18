package com.cec.admin.adminlogin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cec.admin.adminlogin.service.LoginService;
import com.cec.home.pojo.Cec_admin;

import cn.itcast.servlet.BaseServlet;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends BaseServlet {
	LoginService loginService = new LoginService();
	/**
	 * 管理员登录
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		String psw = req.getParameter("pwd");
		Cec_admin adminuser = null;
		adminuser = loginService.login(name, psw);
		if (adminuser!=null) {
			session.setAttribute("adminuser", adminuser);
			resp.sendRedirect(req.getContextPath() + "/adminjsps/admin/main.jsp");
		}else{
			req.setAttribute("loginError", "用户名或密码错误");
			req.getRequestDispatcher("/adminjsps/login.jsp").forward(req, resp);
		}
	}
	/**
	 * 注销管理员
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// 从session中将user删除
		session.removeAttribute("adminuser");
		resp.sendRedirect(req.getContextPath() + "/adminjsps/login.jsp");
	}
}
