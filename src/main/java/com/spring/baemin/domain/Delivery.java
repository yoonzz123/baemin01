package com.spring.baemin.domain;

public class Delivery {
	int deliNo,storeNo,deliPrice;
	String deliArea;
	
	public Delivery() {}
	public Delivery(int deliNo, int storeNo, int deliPrice,String deliArea) {
		this.deliNo = deliNo;
		this.storeNo = storeNo;
		this.deliPrice = deliPrice;
		this.deliArea = deliArea;
	}
	
	public int getDeliNo() {
		return deliNo;
	}
	public void setDeliNo(int deliNo) {
		this.deliNo = deliNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getDeliPrice() {
		return deliPrice;
	}
	public void setDeliPrice(int deliPrice) {
		this.deliPrice = deliPrice;
	}
	public String getDeliArea() {
		return deliArea;
	}
	public void setDeliArea(String deliArea) {
		this.deliArea = deliArea;
	}
}
