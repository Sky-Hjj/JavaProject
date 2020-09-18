package com.sky.books.category.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sky.books.category.domain.Category;
import com.sky.books.category.service.CategoryService;
import com.sky.books.user.servlet.BaseServlet;


@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
	CategoryService service = new CategoryService();
	//查询所有图书分类
	public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> categoryList = service.findAll();
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/jsps/left.jsp").forward(request, response);
		
	}
}
