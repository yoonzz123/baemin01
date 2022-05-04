package com.spring.baemin.domain;

public class Address {
	private String user_id, addr1, addr2, addr3;
	private int addrCheck;
	
	public Address() {}
	public Address(String user_id, String addr1, String addr2, String addr3, int addrCheck) {
		this.user_id = user_id;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.addrCheck = addrCheck;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public int getAddrCheck() {
		return addrCheck;
	}
	public void setAddrCheck(int addrCheck) {
		this.addrCheck = addrCheck;
	}
	
}
