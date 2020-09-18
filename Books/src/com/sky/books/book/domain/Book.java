package com.sky.books.book.domain;

import java.util.Date;

import com.sky.books.category.domain.Category;

public class Book {
//	bid 编号 string
//	bname 书名 string
//	author 作者 string
//	price 价格 double
//	image 图片 string
//	bdate 上架日期 date
//	is_hot 是否热门 int
//	bdesc 详细描述 string
//	cid 类别 char
//	del 下架 tinyint
	
	private String bid;
	private String bname;
	private String author;
	private double price;
	private String image;
	private Date bdate;
	private int is_hot;
	private String bdesc;
	private Category category;
	private boolean del;
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public String getBdesc() {
		return bdesc;
	}
	public void setBdesc(String bdesc) {
		this.bdesc = bdesc;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", author=" + author + ", price=" + price + ", image=" + image
				+ ", bdate=" + bdate + ", is_hot=" + is_hot + ", bdesc=" + bdesc + ", category=" + category + ", del="
				+ del + "]";
	}
	
	
}
