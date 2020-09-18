package com.sky.books.book.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.sky.books.book.domain.Book;
import com.sky.books.book.service.BookService;
import com.sky.books.category.domain.Category;
import com.sky.books.user.servlet.BaseServlet;


/**
 * @author Sky
 *
 */
@WebServlet("/BookServlet")
public class BookServlet extends BaseServlet{
	BookService service = new BookService();
	public void indexFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//准备热门商品---List<Book>
		List<Book> hotBookList = service.findHot();
		//准备最新商品---List<Book>
		List<Book> newBookList = service.findNew();
		//保存到域中
		req.setAttribute("hotBookList", hotBookList);
		req.setAttribute("newBookList", newBookList);
		System.out.println(newBookList);
		//转发到页面
		req.getRequestDispatcher("/jsps/body.jsp").forward(req, resp);
	}
	//按分类查询图书
	
	public void findAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从页面获取要查询分类的编号
		String cid = request.getParameter("cid");
		//准备类别下的书籍调用service，
		List<Book> CategorybooskList = service.findAllCategory(cid);
		//准备分类名调用service，显示在导航栏上
		List<Category> categoryFind = service.findCategory(cid);
		//保存到域中
		request.setAttribute("CategorybooskList", CategorybooskList);
		request.setAttribute("categoryFind", categoryFind);
		//转发到页面
		request.getRequestDispatcher("/jsps/list.jsp").forward(request, response);
	}
	
	
	//图书详情
	public void load(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//页面上获取所选择的图书bid
		String bid = req.getParameter("bid");
		//调用service查询图书详情，返回book
		Book book = service.load(bid);
		//保存到域中
		req.setAttribute("book", book);
		System.out.println(book);
		//装发到页面
		req.getRequestDispatcher("/jsps/details.jsp").forward(req, resp);
	}
	
	//搜索图书
	public void Find(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 从页面上获取搜索框的内容
		String bname = req.getParameter("find");
		//调用service.Find方法，把banem传递给service，返回到List集合
		 List<Book> CategorybooskList = service.Find(bname);
		 //保存到域中
		 req.setAttribute("CategorybooskList", CategorybooskList);
		 //转发到页面
		 req.getRequestDispatcher("/jsps/list.jsp").forward(req, resp);
	}
}
