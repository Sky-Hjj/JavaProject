package com.sky.books.user.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sky.books.user.domian.Admin;
import com.sky.books.user.domian.User;
import com.sky.books.user.service.UserService;
import com.sky.books.user.servlet.BaseServlet;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	UserService service = new UserService();
	Admin admin = new Admin();
	public void adminlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 获得输入的用户名和密码
		String adminid = request.getParameter("adminid");
		String adminpsw = request.getParameter("adminpsw");
		//定义管理员admin接收service的返回，调用serice
		Admin admin = null;			
		admin = service.adminLogin(adminid,adminpsw);
		//判断如果管理员不为空
		if (admin!=null) {
			//保存到会话中
			session.setAttribute("admin", admin);
			//重定向到首页面
			response.sendRedirect(request.getContextPath() + "/adminjsps/admin/main.jsp");
		}
		//判断如果为空，保存错误消息，转发到登录界面
		request.setAttribute("msg", "账号密码错误！");
		request.getRequestDispatcher("/adminjsps/login.jsp").forward(request, response);
	}

}
