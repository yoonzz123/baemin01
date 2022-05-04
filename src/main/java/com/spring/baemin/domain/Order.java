package com.spring.baemin.domain;

import java.sql.Timestamp;
import java.util.List;

public class Order {
	private int odrNo, odrIsDis, odrTotalAmt, odrStatus, odrPay;
	private String user_id, odrCp, odrAddr1, odrAddr2,odrAddr3, odrPhone, odrCeoMsg, odrRiderMsg;
	private Timestamp odrRegDate;
	
	private List<Product> pList;
	private List<Cart> cList;
	
	public Order() {}
	public Order(int odrIsDis, int odrTotalAmt, int odrPay, String odrPhone, Timestamp odrRegDate,
			String odrAddr1, String odrAddr2, String odrAddr3, String odrCeoMsg, String odrRiderMsg ) {
		this.odrIsDis = odrIsDis;
		this.odrTotalAmt = odrTotalAmt;
		this.odrPay = odrPay;
		this.odrPhone = odrPhone;
		this.odrRegDate = odrRegDate;
		this.odrAddr1 = odrAddr1;
		this.odrAddr2 = odrAddr2;
		this.odrAddr3 = odrAddr3;
		this.odrCeoMsg = odrCeoMsg;
		this.odrRiderMsg =  odrRiderMsg;
	} 
	public Order( int odrNo, String user_id, int odrTotalAmt, int odrStatus) {
		this.odrNo = odrNo;
		this.user_id = user_id;
		this.odrTotalAmt = odrTotalAmt;
		this.odrStatus = odrStatus;
	}
	
	
	public String getOdrCp() {
		return odrCp;
	}
	public void setOdrCp(String odrCp) {
		this.odrCp = odrCp;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOdrPay() {
		return odrPay;
	}
	public void setOdrPay(int odrPay) {
		this.odrPay = odrPay;
	}
	public Timestamp getOdrRegDate() {
		return odrRegDate;
	}
	public void setOdrRegDate(Timestamp odrRegDate) {
		this.odrRegDate = odrRegDate;
	}
	public int getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(int odrNo) {
		this.odrNo = odrNo;
	}
	
	public int getOdrIsDis() {
		return odrIsDis;
	}
	public void setOdrIsDis(int odrIsDis) {
		this.odrIsDis = odrIsDis;
	}
	public int getOdrTotalAmt() {
		return odrTotalAmt;
	}
	public void setOdrTotalAmt(int odrTotalAmt) {
		this.odrTotalAmt = odrTotalAmt;
	}
	public int getOdrStatus() {
		return odrStatus;
	}
	public void setOdrStatus(int odrStatus) {
		this.odrStatus = odrStatus;
	}
	public String getOdrAddr1() {
		return odrAddr1;
	}
	public void setOdrAddr1(String odrAddr1) {
		this.odrAddr1 = odrAddr1;
	}
	public String getOdrAddr2() {
		return odrAddr2;
	}
	public void setOdrAddr2(String odrAddr2) {
		this.odrAddr2 = odrAddr2;
	}
	public String getOdrAddr3() {
		return odrAddr3;
	}
	public void setOdrAddr3(String odrAddr3) {
		this.odrAddr3 = odrAddr3;
	}
	public String getOdrPhone() {
		return odrPhone;
	}
	public void setOdrPhone(String odrPhone) {
		this.odrPhone = odrPhone;
	}
	public String getOdrCeoMsg() {
		return odrCeoMsg;
	}
	public void setOdrCeoMsg(String odrCeoMsg) {
		this.odrCeoMsg = odrCeoMsg;
	}
	public String getOdrRiderMsg() {
		return odrRiderMsg;
	}
	public void setOdrRiderMsg(String odrRiderMsg) {
		this.odrRiderMsg = odrRiderMsg;
	}
	public List<Product> getpList() {
		return pList;
	}
	public void setpList(List<Product> pList) {
		this.pList = pList;
	}
	public List<Cart> getcList() {
		return cList;
	}
	public void setcList(List<Cart> cList) {
		this.cList = cList;
	}
	
	@Override
	public String toString() {
		return "odrNo : " + odrNo + ", odrIsDis : " + odrIsDis + ", odrTotalAmt : " + odrTotalAmt + 
				", odrStatus : " + odrStatus + ", odrPhone : " + odrPhone + ", odrPay : " + odrIsDis + 
				", odrAddr2 : " + odrAddr2 + ", pList : " + pList + ", cList : " + cList;
	}
	
}
