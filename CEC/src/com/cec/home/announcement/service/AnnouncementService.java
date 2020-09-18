package com.cec.home.announcement.service;

import java.sql.SQLException;
import java.util.List;

import com.cec.home.announcement.dao.AnnouncementDao;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.PageBean;

public class AnnouncementService {
	AnnouncementDao announcementDao = new AnnouncementDao();
	
	
	/**
	 * 查询全部的公告
	 * @param pc
	 * @param ps
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
	 * 查询最新的公告
	 * @return
	 */
	public List<Cec_announcement> findNewAnnouncement() {
		List<Cec_announcement> findNewAnnouncement = null;
		try {
			findNewAnnouncement = announcementDao.findNewAnnouncement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findNewAnnouncement;
	}


	/**
	 * 加载公告详情信息
	 * @param announcement_id
	 * @return
	 */
	public Cec_announcement detailsAnnouncement(String announcement_id) {
		try {
			return announcementDao.loadUser(announcement_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
