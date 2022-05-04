package com.spring.baemin.domain;


public class Product {
	private int productNo, storeNo, productIsPopular, productSalNum, productPrice;
	private String productName, productImg, productContent;
	
	
	public Product() {}
	public Product(int productNo, int storeNo, int productIsPopular, int productSalNum,
					int productPrice, String productName, String productImg, String productContent
					) {
		this.productNo = productNo;
		this.storeNo = storeNo;
		this.productName = productName;
		this.productIsPopular = productIsPopular;
		this.productSalNum = productSalNum;
		this.productPrice = productPrice;
		this.productImg = productImg;
		this.productContent = productContent;
		
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductIsPopular() {
		return productIsPopular;
	}
	public void setProductIsPopular(int productIsPopular) {
		this.productIsPopular = productIsPopular;
	}
	public int getProductSalNum() {
		return productSalNum;
	}
	public void setProductSalNum(int productSalNum) {
		this.productSalNum = productSalNum;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}	
}
