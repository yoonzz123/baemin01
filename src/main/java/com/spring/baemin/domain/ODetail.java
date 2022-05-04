package com.spring.baemin.domain;

public class ODetail {
	private int oDtlNo, cartNo, odrNo;
	
	public ODetail () {}
	public ODetail (int oDtlNo, int cartNo, int odrNo) {
		this.oDtlNo = oDtlNo;
		this.cartNo = cartNo;
		this.odrNo = odrNo;
	}
	public int getoDtlNo() {
		return oDtlNo;
	}
	public void setoDtlNo(int oDtlNo) {
		this.oDtlNo = oDtlNo;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(int odrNo) {
		this.odrNo = odrNo;
	}
}
