package com.sky.books.cart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sky.books.book.domain.Book;
import com.sky.books.book.service.BookService;
import com.sky.books.cart.domain.Cart;
import com.sky.books.cart.domain.CartItem;
import com.sky.books.user.domian.User;
import com.sky.books.user.servlet.BaseServlet;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends BaseServlet{
	//添加购物条目
	public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (user!=null) {
			Cart cart = (Cart)req.getSession().getAttribute("cart");
			String bid = req.getParameter("bid");
			Book book = new BookService().load(bid);
			int count = Integer.parseInt(req.getParameter("count"));
			CartItem cartItem = new CartItem();
			cartItem.setBook(book);
			cartItem.setCount(count);
			cart.add(cartItem);
			
			resp.sendRedirect(req.getContextPath() + "/jsps/shopping.jsp");
		}else {
			resp.sendRedirect(req.getContextPath()+"/jsps/login.jsp");
		}
		
	}
	
	//删除商品
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cart cart = (Cart)req.getSession().getAttribute("cart");
		String bid = req.getParameter("bid");
		cart.delete(bid);
		resp.sendRedirect(req.getContextPath() + "/jsps/shopping.jsp");
	}
	
	//清空购物车
	public void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cart cart = (Cart)req.getSession().getAttribute("cart");
		cart.clear();
		resp.sendRedirect(req.getContextPath() + "/jsps/shopping.jsp");
	}
}
