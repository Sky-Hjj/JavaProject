package com.cec.admin.announcement.service;

import java.sql.SQLException;
import java.util.List;

import com.cec.admin.announcement.dao.AnnouncementDao;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.PageBean;

public class AnnouncementService {
	AnnouncementDao announcementDao = new AnnouncementDao();

	/**
	 * 新增公告
	 * 
	 * @param cec_announcement
	 */
	public void addAnnouncement(Cec_announcement cec_announcement) {
		try {
			announcementDao.AddAnnouncement(cec_announcement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询全部的公告
	 * @param ps 
	 * @param pc 
	 * 
	 * @return
	 */
	public PageBean<Cec_announcement> findAllAnnouncement(int pc, int ps) {
		PageBean<Cec_announcement> cec_announcements = null;
		try {
			cec_announcements = announcementDao.findAllAnnouncement(pc,ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cec_announcements;
	}

	/**
	 * 删除公告
	 * 
	 * @param id
	 */
	public void deleteAnnouncement(int id) {
		try {
			announcementDao.deleteAnnouncement(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 加载公告详情
	 * 
	 * @param id
	 * @return
	 */
	public Cec_announcement loadAnnouncement(int id) {
		try {
			return announcementDao.loadAnnouncement(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 修改公告内容
	 * 
	 * @param cec_announcement
	 */
	public void updateAnnouncement(Cec_announcement cec_announcement) {
		try {
			announcementDao.updateAnnouncement(cec_announcement);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
