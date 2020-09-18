package com.sky.books.book.servlet.admin;

import java.io.IOException;
import java.text.Bidi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sky.books.book.domain.Book;
import com.sky.books.book.service.BookService;
import com.sky.books.category.domain.Category;
import com.sky.books.category.service.CategoryService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class AdminBookServet
 */
@WebServlet("/AdminBookServlet")
public class AdminBookServlet extends BaseServlet {
	private BookService bookService = new BookService();
	private CategoryService categoryService = new CategoryService();
	
	//查询全部图书
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("books", bookService.findAll());
		return"/adminjsps/admin/book/list.jsp";
	}
	//查询图书详情
	public String load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book = bookService.load(request.getParameter("bid"));
		request.setAttribute("book", book);
		System.out.println(book);
		request.setAttribute("categoryList", categoryService.findAll());
		return"/adminjsps/admin/book/desc.jsp";
	}
	
	//增加商品页面
	public String addPre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//加载分类信息
		request.setAttribute("categoryList", categoryService.findAll());
		return"/adminjsps/admin/book/add.jsp";
	}
	//下架商品
	public String  delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid = req.getParameter("bid");
		bookService.delete(bid);
		return findAll(req, resp);
	}
	
	//修改商品信息
	public String edit(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//获取图书信息
		Book book = CommonUtils.toBean(request.getParameterMap(), Book.class);
		//查询图书所属分类
		Category category = CommonUtils.toBean(request.getParameterMap(), Category.class);
		book.setCategory(category);
		bookService.edit(book);
		//System.out.println(book);
		return findAll(request, response);
	}
}
