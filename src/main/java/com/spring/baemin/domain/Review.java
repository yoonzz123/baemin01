package com.spring.baemin.domain;

import java.sql.Timestamp;

public class Review {
	private int r_no;
	private String user_id;
	private int product_no;
	private float r_scope;
	private Timestamp r_reg_date;
	private String r_img;
	private String r_content;
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public float getR_scope() {
		return r_scope;
	}
	public void setR_scope(float r_scope) {
		this.r_scope = r_scope;
	}
	public Timestamp getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(Timestamp r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	public String getR_img() {
		return r_img;
	}
	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

}
