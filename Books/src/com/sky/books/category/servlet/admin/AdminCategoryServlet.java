package com.sky.books.category.servlet.admin;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sky.books.category.domain.Category;
import com.sky.books.category.service.CategoryService;



@WebServlet("/AdminCategoryServlet")
public class AdminCategoryServlet extends BaseServlet {
	private CategoryService categoryService = new CategoryService();

	//查询所有分类
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 调用service方法，得到所有分类
		 * 2. 保存到request域，转发到/adminjsps/admin/category/list.jsp
		 */
		request.setAttribute("categoryList", categoryService.findAll());
		return "f:/adminjsps/admin/category/list.jsp";
	}
	
	
	//增加分类
	public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category category = CommonUtils.toBean(request.getParameterMap(), Category.class);
		category.setCid(CommonUtils.uuid());
		categoryService.add(category);
		return findAll(request, response);
				
	}
	
	//删除分类
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		try{
			categoryService.delete(cid);
			return findAll(request, response);
		}catch (CategoryException e) {
			request.setAttribute("msg", e.getMessage());
			return "/adminjsps/msg.jsp";
		}
		
	}
	
	
	//修改分类加载分类信息
	public String editPre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		request.setAttribute("category", categoryService.load(cid));
		return"/adminjsps/admin/category/mod.jsp";
	}
	
	//修改分类
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据
		 * 2. 调用service方法完成修改工作
		 * 3. 调用findAll
		 */
		Category category = CommonUtils.toBean(request.getParameterMap(), Category.class);
		categoryService.edit(category);
		return findAll(request, response);
	}
}
