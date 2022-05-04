package com.spring.baemin.domain;

public class Cart {
	private int cartNo, productNo, cartCnt, cartAmt, cartIsCheck;
	private String user_id;
	
	public Cart() {}
	public Cart(int cartNo, int productNo, int cartCnt, int cartAmt, String user_id, int cartIsCheck) {
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.cartCnt = cartCnt;
		this.cartAmt = cartAmt;
		this.cartIsCheck = cartIsCheck;
		this.user_id = user_id;				
	}
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCartCnt() {
		return cartCnt;
	}
	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	public int getCartAmt() {
		return cartAmt;
	}
	public void setCartAmt(int cartAmt) {
		this.cartAmt = cartAmt;
	}
	public int getCartIsCheck() {
		return cartIsCheck;
	}
	public void setCartIsCheck(int cartIsCheck) {
		this.cartIsCheck = cartIsCheck;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
