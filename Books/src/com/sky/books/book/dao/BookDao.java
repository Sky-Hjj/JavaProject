package com.sky.books.book.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sky.books.Util.DataSourceUtils;
import com.sky.books.book.domain.Book;
import com.sky.books.category.domain.Category;

import cn.itcast.commons.CommonUtils;




public class BookDao {
	QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	//查询热门商品
	public List<Book> findHot() throws SQLException {
		String sql = "select * from books where is_hot=? and del=false limit ?,?";
		return runner.query(sql, new BeanListHandler<Book>(Book.class), 1,0,12);
	}
	//查询最新商品
	public List<Book> findNew() throws SQLException {
		String sql = "select * from books where del=false order by bdate desc limit ?,?";
		return runner.query(sql, new BeanListHandler<Book>(Book.class),0,9);
	}
	//按分类查询书籍
	public List<Book> findAllCategory(String cid) throws SQLException {
		String sql =  "select * from books where cid=? and del=false";
		return runner.query(sql, new BeanListHandler<Book>(Book.class),cid);
		}
	//查询分类显示在导航栏上
	public List<Category> findCategory(String cid) throws SQLException {
		String sql =  "select * from category where cid=?";
		return runner.query(sql, new BeanListHandler<Category>(Category.class),cid);
	}
	//加载图书详情
	public Book load(String bid) throws SQLException {
		String sql = "select * from books where bid=?";
		Map<String , Object> map = runner.query(sql, new MapHandler(),bid);
		Category category = CommonUtils.toBean(map, Category.class);
		Book book = CommonUtils.toBean(map, Book.class);
		book.setCategory(category);
		return book;
	}
	
	
	//后台管理查询分类下是否有书籍
	public int getCountByCid(String cid) {
		try {
			String sql =  "select count(*) from books where cid=?";
			Number cnt = (Number) runner.query(sql, new ScalarHandler(),cid);
			return cnt.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//查询全部图书
	public List<Book> findAll() throws SQLException {
		String sql =  "select * from books where del=false";
		return runner.query(sql, new BeanListHandler<Book>(Book.class));
	}

	//增加图书
	public void add(Book book) throws SQLException {
		String sql = "insert into books values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {book.getBid(),book.getBname(),book.getAuthor(),
			book.getPrice(),book.getImage(),book.getBdate(),book.getIs_hot(),
			book.getBdesc(),book.isDel(),book.getCategory().getCid()};
		runner.update(sql, params);
		}
	//删除商品，修改商品状态
	public void delete(String bid) throws SQLException {
		String sql = "update books set del=true where bid=?";
		runner.update(sql,bid);
		}
	//更新图书信息
	public void edit(Book book) throws SQLException {
		String sql = "update books set bname=?, author=?, price=?, image=?, is_hot=?, bdesc=?, cid=? where bid=?";
		Object[] params = {book.getBname(), book.getAuthor(),book.getPrice(),book.getImage(), 
				book.getIs_hot(),book.getBdesc(),book.getCategory().getCid(), book.getBid()};
		runner.update(sql, params);
	}
	//搜索商品
	public List<Book> Find(String bname) throws SQLException {
		String sql="select * from books where bname like '%"+bname+"%' or author like '%"+bname+"%'";
		return runner.query(sql, new BeanListHandler<Book>(Book.class));
	}
}


