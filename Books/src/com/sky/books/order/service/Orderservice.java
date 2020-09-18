package com.sky.books.order.service;

import java.sql.SQLException;
import java.util.List;

import com.sky.books.order.dao.OrderDao;
import com.sky.books.order.domain.Order;

import cn.itcast.jdbc.JdbcUtils;



public class Orderservice {
	 private OrderDao dao = new OrderDao();
	 /**
		 * 添加订单
		 * 需要处理事务
		 * @param order
		 */
		public void add(Order order) {
			try {
				// 开启事务
				JdbcUtils.beginTransaction();
				
				dao.addOrder(order);//插入订单
				dao.addOrderItemList(order.getOrderItemList());//插入订单中的所有条目
				
				// 提交事务
				JdbcUtils.commitTransaction();
			} catch(Exception e) {
				// 回滚事务
				try {
					JdbcUtils.rollbackTransaction();
				} catch (SQLException e1) {
				}
				throw new RuntimeException(e);
			}
		}
		//查询我的订单
		public List<Order> myOrders(String uid) {
			// TODO Auto-generated method stub
			return dao.findByUid(uid);
		}
		//加载订单详情
		public Order load(String oid) {
			return dao.load(oid);
		}
		
		/**
		 * 确认收货
		 * @param oid
		 * @throws OrderException
		 */
		public void confirm(String oid) throws OrderException {
			/*
			 * 1. 校验订单状态，如果不是3，抛出异常
			 */
			int state = dao.getStateByOid(oid);//获取订单状态
			if(state != 3) throw new OrderException("订单确认失败，您不是什么好东西！");
			
			/*
			 * 2. 修改订单状态为4，表示交易成功
			 */
			dao.updateState(oid, 4);
		}
		
		//支付方法
		public void pay(String oid) {
			/*
			 * 1. 获取订单的状态
			 *   * 如果状态为1，那么执行下面代码
			 *   * 如果状态不为1，那么本方法什么都不做
			 */
			int state = dao.getStateByOid(oid);
			if(state == 1) {
				// 修改订单状态为2
				dao.updateState(oid, 2);
			
			}
		}
		
		//查询全部订单
		public List<Order> all() {
			return dao.all();
		}
		//按状态查询订单
		public List<Order> findByState(int state) {
			return dao.findByState(state);
		}
		//商家发货
		public void deliver(String oid) {
			dao.updateState(oid, 3);
		}
}
