package com.sky.books.user.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import com.sky.books.Util.CommonsUtils;
import com.sky.books.Util.MailUtils;
import com.sky.books.cart.domain.Cart;
import com.sky.books.user.domian.User;
import com.sky.books.user.service.UserService;


import javafx.scene.chart.PieChart.Data;



public class UserServlet extends BaseServlet {
	UserService service = new UserService();
	//注册用户
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//获取表单数据
		Map<String , String[]> properties = req.getParameterMap();
		User user = new User();
		try {
			//自己指定一个类型装换器（将string装换成Date）
			ConvertUtils.register(new Converter() {
				@Override
				public Object convert(Class clazz, Object value) {
					//将string转成date
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date parse = null;
					try {
						parse = format.parse(value.toString());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					return parse;
				}
			}, Data.class);
			
			//映射封装
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException| InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//设置id，UUID
		user.setUid(CommonsUtils.getUUID());
		//设置状态初始化为0
		user.setState(0);
		//设置激活码，UUID
		String activeCode = CommonsUtils.getUUID();
		user.setCode(activeCode);
		
		//将user传递给service
		boolean isRegisterSuccess = service.register(user);
		
		//是否注册成功
		if (isRegisterSuccess) {
			//发送激活邮件内容
			String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
					+ "<a href='http://localhost:8080/Books/UserServlet?method=active&activeCode="+activeCode+"'>"
					+ "http://localhost:8080/Books/UserServlet?method=active&activeCode="+activeCode+"</a>";
			try {
				//获取用户填入的邮箱，向用户填入的邮箱发送邮件
				MailUtils.sendMail(user.getEmail(), emailMsg);
			}catch (MessagingException e) {
				e.printStackTrace();
			}
			
			//跳转成功页面
			resp.sendRedirect(req.getContextPath()+"/jsps/registerSuccess.jsp");
		}else {
			//跳转失败页面
			resp.sendRedirect(req.getContextPath()+"/jsps/registerFail.jsp");
		}
	}
	//激活用户
	public void active(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取用户的激活码
		String activeCode = req.getParameter("activeCode");
		//调用service激活账号
		service.active(activeCode);
		//重定向到登录界面
		resp.sendRedirect(req.getContextPath()+"/jsps/login.jsp");
	}
	
	
	//查询用户名是否存在
	public void checkUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取输入的用户名
		String username = req.getParameter("username");
		//查询用户名是否存在
		boolean isExist = service.checkUsername(username);
		//利用json
		String json = "{\"isExist\":"+isExist+"}";
		resp.getWriter().write(json);
	}

	
	//登录
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		// 获得输入的用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// 将用户名和密码传递给service层
		UserService service = new UserService();
		//定义user接收登录信息
		User user = null;
		try {
			//调用service执行登录
			user = service.login(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	try{
		//如果user不为空并且状态不为1的话，表示未激活
		if (user != null&&user.getState()!=1) {
			//保存错误信息
			request.setAttribute("loginError", "未激活");
			//重定向到激活页面
			response.sendRedirect(request.getContextPath()+"/jsps/registerSuccess.jsp");
			//request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		// 判断用户是否登录成功 user是否是null
		if (user != null&&user.getState()==1) {
			// 登录成功
			// ***************判断用户是否勾选了自动登录*****************
			String autoLogin = request.getParameter("autoLogin");
			if ("autoLogin".equals(autoLogin)) {
				// 要自动登录
				// 创建存储用户名的cookie
				Cookie cookie_username = new Cookie("cookie_username", user.getUsername());
				//cookies的保存时间
				cookie_username.setMaxAge(60 * 60 *24);
				cookie_username.setPath(request.getContextPath());
				// 创建存储密码的cookie
				Cookie cookie_password = new Cookie("cookie_password", user.getPassword());
				cookie_password.setMaxAge(60 * 60 *24);
				cookie_password.setPath(request.getContextPath());
				//增加到cookies
				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
			}
			// 判断用户是否勾选了记住用户名
			String remName = request.getParameter("remName");
			if ("remName".equals(remName)) {
				Cookie cookie_name = new Cookie("cookie_name", user.getUsername());
				cookie_name.setMaxAge(60 * 60 *24);//一天
				cookie_name.setPath(request.getContextPath());
				response.addCookie(cookie_name);

				Cookie cookie_psw = new Cookie("cookie_psw", user.getPassword());
				cookie_psw.setMaxAge(60 * 60 *24);
				cookie_psw.setPath(request.getContextPath());
				response.addCookie(cookie_psw);
			} else {
				Cookie cookie_name = new Cookie("cookie_name", "");
				cookie_name.setMaxAge(0);
				Cookie cookie_psw = new Cookie("cookie_psw", "");
				cookie_psw.setMaxAge(0);
				response.addCookie(cookie_name);
				response.addCookie(cookie_psw);
			}
			// ***************************************************
			// 将user对象存到session中
			session.setAttribute("user", user);
			session.setAttribute("cart", new Cart());
			// 重定向到首页
			response.sendRedirect(request.getContextPath() + "/jsps/main.jsp");
		
		} else {
			request.setAttribute("loginError", "用户名或密码错误");
			request.getRequestDispatcher("/jsps/login.jsp").forward(request, response);
		}
		}catch (Exception e) {
			
		}
	}
	
	// 用户注销
		public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
			HttpSession session = request.getSession();
			// 从session中将user删除
			session.removeAttribute("user");

			// 将存储在客户端的自动登录的cookie删除掉
			Cookie cookie_username = new Cookie("cookie_username", "");
			cookie_username.setMaxAge(0);
			
			Cookie cookie_password = new Cookie("cookie_password", "");
			cookie_password.setMaxAge(0);

			response.addCookie(cookie_username);
			response.addCookie(cookie_password);

			response.sendRedirect(request.getContextPath() + "/jsps/main.jsp");

		}
}


