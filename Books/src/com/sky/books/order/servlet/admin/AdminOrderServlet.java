package com.sky.books.order.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sky.books.order.domain.Order;
import com.sky.books.order.service.Orderservice;
import com.sky.books.user.servlet.BaseServlet;

/**
 * Servlet implementation class AdminOrderServlet
 */
@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends BaseServlet {
	Orderservice orderservice = new Orderservice();
	//查询全部订单
	public void all(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> list = orderservice.all();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/adminjsps/admin/order/list.jsp").forward(request, response);
	}
	//按照状态查询订单
	public void findByState(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int state = Integer.parseInt(request.getParameter("state"));
		List<Order> list = orderservice.findByState(state);
		request.setAttribute("list", list);
		//System.out.println(list);
		request.getRequestDispatcher("/adminjsps/admin/order/list.jsp").forward(request, response);
	}
	//商家发货
	public void deliver(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oid = request.getParameter("oid");
		orderservice.deliver(oid);
		request.setAttribute("msg", "发货成功！");
		request.getRequestDispatcher("/adminjsps/admin/order/list.jsp").forward(request, response);
	}
	
}
