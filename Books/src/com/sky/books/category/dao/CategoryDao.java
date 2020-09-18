package com.sky.books.category.dao;

import java.sql.SQLException;
import java.util.List;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sky.books.Util.DataSourceUtils;
import com.sky.books.category.domain.Category;

public class CategoryDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	//查询全部分类
	public List<Category> findAll() throws SQLException {
		String sql = "select * from category";
		return runner.query(sql, new BeanListHandler<Category>(Category.class));
	}

	//增加分类
	public void add(Category category) throws SQLException {
		String sql = "insert into category value(?,?)";
		runner.update(sql, category.getCid(),category.getCname());
			
	}

	//删除分类
	public void delete(String cid) throws SQLException {
		String sql = "delete from category where cid=?";
		runner.update(sql,cid);
		
	}
	//加载分类信息
	public Category load(String cid) throws SQLException {
		String sql = "select * from category where cid=?";
		return runner.query(sql, new BeanHandler<Category>(Category.class),cid);
	}
	//修改分类
	public void edit(Category category) throws SQLException {
		String sql = "update category set cname=? where cid=?";
		runner.update(sql,category.getCname(),category.getCid());
	}
	
	
}

	


