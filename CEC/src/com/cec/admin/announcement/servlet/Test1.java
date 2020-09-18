package com.cec.admin.announcement.servlet;



import java.util.Date;
import java.util.List;

import com.cec.admin.announcement.service.AnnouncementService;
import com.cec.admin.user.service.UserService;
import com.cec.home.pojo.Cec_announcement;
import com.cec.home.pojo.Cec_user;


public class Test1 {
	public static void main(String[] args) {
		Cec_announcement cec_announcement = new Cec_announcement();
		AnnouncementService announcementService = new AnnouncementService();
		cec_announcement.setAnnouncement_title("111111");
		cec_announcement.setAnnouncement_content("11231232");
		cec_announcement.setAnnouncement_time(new Date());
		announcementService.addAnnouncement(cec_announcement);
	}
}
