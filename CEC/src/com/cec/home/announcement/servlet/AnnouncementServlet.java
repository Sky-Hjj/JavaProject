package com.cec.home.announcement.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cec.home.announcement.service.AnnouncementService;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.Cec_user;
import com.cec.home.pojo.PageBean;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class AnnouncementServlet
 */
@WebServlet("/AnnouncementServlet")
public class AnnouncementServlet extends BaseServlet {
	AnnouncementService announcementService = new AnnouncementService();
	/**
	 * 查询全部公告
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllAnnouncement(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
		int pc = getPc(req);// 得到pc
		int ps = 10;// 给定ps的值，第页5行记录
		PageBean<Cec_announcement> findAllAnnouncement = announcementService.findAllAnnouncement(pc, ps);
		req.setAttribute("findAllAnnouncement", findAllAnnouncement);
		return "/jsps/CompanyNews.jsp";
		}else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
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
	 * 查询公告详情
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void detailsAnnouncement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cec_user user = (Cec_user) req.getSession().getAttribute("user");
		if (user != null) {
		String announcement_id = req.getParameter("announcement_id");
		Cec_announcement cec_announcement = announcementService.detailsAnnouncement(announcement_id);
		req.setAttribute("cec_announcement", cec_announcement);
		req.getRequestDispatcher("/jsps/NewsZone.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/jsps/UserLogin.jsp").forward(req, resp);
		}
	}
}
