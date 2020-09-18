package com.sky.books.category.service;

import java.sql.SQLException;
import java.util.List;

import com.sky.books.book.dao.BookDao;
import com.sky.books.category.dao.CategoryDao;
import com.sky.books.category.domain.Category;
import com.sky.books.category.servlet.admin.CategoryException;

public class CategoryService {
	CategoryDao dao = new CategoryDao();
	BookDao bookDao = new BookDao();
	//查询分类
	public List<Category> findAll() {
		List<Category> categoryList = null;
		try {
			categoryList = dao.findAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryList;
		
	}
	//增加分类
	public void add(Category category) {
		try {
			dao.add(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//删除分类
	public void delete(String cid) throws CategoryException {
		int count = bookDao.getCountByCid(cid);
		if (count>0) throw new CategoryException("该分类下还有图书，不能删除");
		try {
			dao.delete(cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//加载分类详细信息
	public Category load(String cid) {
		try {
			return dao.load(cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//	修改分类
	public void edit(Category category) {
		try {
			dao.edit(category);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
