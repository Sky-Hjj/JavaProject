package com.cec.admin.user.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cec.Util.MailUtils;
import com.cec.Util.Uid;
import com.cec.admin.user.service.UserService;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_user;

import cn.itcast.commons.CommonUtils;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	UserService userService = new UserService();
	/**
	 * 新增用户
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Cec_admin adminuser = (Cec_admin) request.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
		// 创建工厂
				DiskFileItemFactory factory = new DiskFileItemFactory();
				// 得到解析器
				ServletFileUpload sfu = new ServletFileUpload(factory);
		// 使用解析器去解析request对象，得到List<FileItem>
		try {
			List<FileItem> fileItemList = sfu.parseRequest(request);
			/*
			 * * 把fileItemList中的数据封装到cec_user对象中 , 把所有的普通表单字段数据先封装到Map中 >
			 * 先把所有的普通数据封装到map中
			 */
			Map<String, String> map = new HashMap<String, String>();
			for (FileItem fileItem : fileItemList) {
				if (fileItem.isFormField()) {
					map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
				}
			}
			Cec_user cec_user = CommonUtils.toBean(map, Cec_user.class);
			/*
			 * 2. 保存上传的文件 * 保存的目录 * 保存的文件名称
			 */
			// 得到保存的目录
						String savepath = this.getServletContext().getRealPath("/images");
						// 得到文件名称：给原来文件名称添加uuid前缀！避免文件名冲突
						String filename = CommonUtils.uuid() + "_" + fileItemList.get(1).getName();
			if (!filename.toLowerCase().endsWith("jpg")) {
				request.setAttribute("msg", "您上传的图片不是JPG扩展名！");
				request.getRequestDispatcher("adminjsps/admin/userManage/add.jsp").forward(request, response);
				return;
				}
			// 使用目录和文件名称创建目标文件
			File destFile = new File(savepath, filename);
			// 保存上传文件到目标文件位置
			fileItemList.get(1).write(destFile);
			cec_user.setUser_head("" + filename);
			String id = Uid.generateUID();
			int user_id = Integer.valueOf(id);
			cec_user.setUser_id(user_id);
			String psw = "cec"+user_id;
			cec_user.setUser_password(psw);
			cec_user.setUser_status(1);
			cec_user.setUser_time(new Date());
			boolean insertuser = userService.addUser(cec_user);
			System.out.println(insertuser);
			if (insertuser) {
				//发送激活邮件内容
				String emailMsg = "<h3>欢迎你加入本公司，你的公司论坛账号是:</h3><h1 style=color:red;>"+user_id+"</h1><h3>密码是:</h3><h1 style=color:red;>"+psw+"</h1><h3>";
				try {
					//获取用户填入的邮箱，向用户填入的邮箱发送邮件
					MailUtils.sendMail(cec_user.getUser_email(), emailMsg);
				}catch (MessagingException e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/AdminUserServlet?method=findAllUser").forward(request, response);
				System.out.println("成功");
			}else{
				System.out.println("失败");
			}		
			
		} catch (Exception e) {

		}
	}
		else{
			request.setAttribute("Error", "操作失败！请登录后再操作");
			request.getRequestDispatcher("/adminjsps/admin/body.jsp").forward(request, response);
		}
}
}