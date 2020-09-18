package com.cec.admin.announcement.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cec.admin.announcement.service.AnnouncementService;
import com.cec.home.pojo.Cec_admin;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.PageBean;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class AnnouncementServlet
 */
@WebServlet("/AdminAnnouncementServlet")
public class AnnouncementServlet extends BaseServlet {
	AnnouncementService announcementService = new AnnouncementService();

	/**
	 * 新增公告
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addAnnouncement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");//获取登录的会话
		if (adminuser!=null) {//如果不为空，则运行
		Cec_announcement cec_announcement = CommonUtils.toBean(req.getParameterMap(), Cec_announcement.class);
		cec_announcement.setAnnouncement_time(new Date());
		announcementService.addAnnouncement(cec_announcement);
		req.getRequestDispatcher("/AdminAnnouncementServlet?method=findAllAnnouncement").forward(req, resp);
	}else{
		//否则保存错误信息转发到页面
		req.setAttribute("Error", "操作失败！请登录后再操作");
		req.getRequestDispatcher("/adminjsps/admin/body.jsp").forward(req, resp);
	}
	}

	/**
	 * 查询全部的公告
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllAnnouncement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Cec_admin adminuser = (Cec_admin) req.getSession().getAttribute("adminuser");
		if (adminuser!=null) {
		int pc = getPc(req);//得到pc
		int ps = 5;//给定ps的值，第页5行记录
		PageBean<Cec_announcement> findAllAnnouncement = announcementService.findAllAnnouncement(pc,ps);
		req.setAttribute("findAllAnnouncement", findAllAnnouncement);
		return "/adminjsps/admin/announcementManage/all.jsp";
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
	 * 删除公告
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteAnnouncement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String announcement_id = req.getParameter("announcement_id");
		int id = Integer.parseInt(announcement_id);
		announcementService.deleteAnnouncement(id);
		req.getRequestDispatcher("/AdminAnnouncementServlet?method=findAllAnnouncement").forward(req, resp);
	}

	/**
	 * 加载公告详情信息
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadAnnouncement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String announcement_id = req.getParameter("announcement_id");
		int id = Integer.parseInt(announcement_id);
		req.setAttribute("loadAnnouncement", announcementService.loadAnnouncement(id));
		return "/adminjsps/admin/announcementManage/Detail.jsp";
	}

	/**
	 * 修改公告内容
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateAnnouncement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Cec_announcement cec_announcement = CommonUtils.toBean(req.getParameterMap(), Cec_announcement.class);
		announcementService.updateAnnouncement(cec_announcement);
		req.getRequestDispatcher("/AdminAnnouncementServlet?method=findAllAnnouncement").forward(req, resp);
	}
}
