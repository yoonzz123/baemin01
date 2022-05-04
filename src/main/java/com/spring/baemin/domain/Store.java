package com.spring.baemin.domain;

import java.sql.Timestamp;

public class Store {
	private int storeNo, mainCat;
	private String comId, storeName, storeAddr1, storeAddr2, storeAddr3, storePhone,
				storeImg, storeDeliTimeMin, storeDeliTimeMax;
	private Timestamp storeRegDate, storeOpenTime, storeCloseTime;
	private double storeScope;
	
	public Store() {}
	public Store(int storeNo, int mainCat, String comId, String storeName, String storePhone, String storeAddr1,
			String storeAddr2, String storeAddr3, String storeImg, String storeDeliTimeMin, String storeDeliTimeMax,
			Timestamp storeRegDate, Timestamp storeOpenTime, Timestamp storeCloseTime, double storeScope ) {
		this.storeNo = storeNo;
		this.mainCat = mainCat;
		this.comId = comId;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddr1 = storeAddr1;
		this.storeAddr2 = storeAddr2;
		this.storeAddr3 = storeAddr3;
		this.storeImg = storeImg;
		this.storeDeliTimeMin = storeDeliTimeMin;
		this.storeDeliTimeMax = storeDeliTimeMax;
		this.storeRegDate = storeRegDate;
		this.storeOpenTime = storeOpenTime;
		this.storeCloseTime = storeCloseTime;
		this.storeScope = storeScope;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getMainCat() {
		return mainCat;
	}
	public void setMainCat(int mainCat) {
		this.mainCat = mainCat;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddr1() {
		return storeAddr1;
	}
	public void setStoreAddr1(String storeAddr1) {
		this.storeAddr1 = storeAddr1;
	}
	public String getStoreAddr2() {
		return storeAddr2;
	}
	public void setStoreAddr2(String storeAddr2) {
		this.storeAddr2 = storeAddr2;
	}
	public String getStoreAddr3() {
		return storeAddr3;
	}
	public void setStoreAddr3(String storeAddr3) {
		this.storeAddr3 = storeAddr3;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public String getStoreImg() {
		return storeImg;
	}
	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}
	public String getStoreDeliTimeMin() {
		return storeDeliTimeMin;
	}
	public void setStoreDeliTimeMin(String storeDeliTimeMin) {
		this.storeDeliTimeMin = storeDeliTimeMin;
	}
	public String getStoreDeliTimeMax() {
		return storeDeliTimeMax;
	}
	public void setStoreDeliTimeMax(String storeDeliTimeMax) {
		this.storeDeliTimeMax = storeDeliTimeMax;
	}
	public Timestamp getStoreRegDate() {
		return storeRegDate;
	}
	public void setStoreRegDate(Timestamp storeRegDate) {
		this.storeRegDate = storeRegDate;
	}
	public Timestamp getStoreOpenTime() {
		return storeOpenTime;
	}
	public void setStoreOpenTime(Timestamp storeOpenTime) {
		this.storeOpenTime = storeOpenTime;
	}
	public Timestamp getStoreCloseTime() {
		return storeCloseTime;
	}
	public void setStoreCloseTime(Timestamp storeCloseTime) {
		this.storeCloseTime = storeCloseTime;
	}
	public double getStoreScope() {
		return storeScope;
	}
	public void setStoreScope(double storeScope) {
		this.storeScope = storeScope;
	}
}
