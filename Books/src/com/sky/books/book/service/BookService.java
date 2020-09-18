package com.sky.books.book.service;

import java.sql.SQLException;
import java.util.List;

import com.sky.books.book.dao.BookDao;
import com.sky.books.book.domain.Book;
import com.sky.books.category.domain.Category;

public class BookService {
	BookDao dao = new BookDao();
	//查询热门商品
	public List<Book> findHot() {
		List<Book> hotBookList = null;
		try {
			hotBookList = dao.findHot();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hotBookList;
	}
	//查询最新商品
	public List<Book> findNew() {
		List<Book> newBookList = null;
		try {
			newBookList = dao.findNew();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newBookList;
	}
	//查询分类，显示在导航栏上
	public List<Category> findCategory(String cid) {
		List<Category> categoryFind = null;
		try {
			categoryFind = dao.findCategory(cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryFind;
	}

	//按照分类查询商品
	public List<Book> findAllCategory(String cid) {
		List<Book> CategorybooskList = null;
		try {
			CategorybooskList = dao.findAllCategory(cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return CategorybooskList;
	}
	
	//加载商品详情信息
	public Book load(String bid) {
		Book book = null;
		try {
			book = dao.load(bid);
			System.out.println(book);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	//管理员查询全部图书
	public Object findAll() {
		List<Book> books = null;
		try {
			books = dao.findAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return books;
	}

	//增加图书
		public void add(Book book) {
			try {
				dao.add(book);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//删除图书
		public void delete(String bid) {
			try {
				dao.delete(bid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		//修改商品信息
		public void edit(Book book) {
			try {
				dao.edit(book);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//搜索图书
		public List<Book> Find(String bname) {
			List<Book> CategorybooskList = null;
			try {
				CategorybooskList = dao.Find(bname);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return CategorybooskList;
		}
}
