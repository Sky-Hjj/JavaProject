package com.cec.admin.user.servlet;

import java.util.List;


import com.cec.admin.user.service.UserService;
import com.cec.home.pojo.Cec_user;


public class Test1 {
	public static void main(String[] args) {
//		Cec_user cec_user = new Cec_user();
		UserService userService = new UserService();
//		List<Cec_user> users = userService.findAllUser();
//		System.out.println(users);
		int id = 1001;
//		userService.deleteUser(id);
//		cec_user.setUser_name("1002");
//		cec_user.setUser_sex("1");
//		cec_user.setUser_age(10);
//		cec_user.setUser_idcard("22222");
//		cec_user.setUser_phone(22222);
//		cec_user.setUser_email("2222");
//		cec_user.setUser_address("2222");
//		cec_user.setUser_id(1001);
//		userService.updateUser(cec_user);
		
		Cec_user cec_user = userService.loadUser(id);
		System.out.println(cec_user);
	}
}
