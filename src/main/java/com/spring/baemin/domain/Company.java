package com.spring.baemin.domain;

import java.sql.Timestamp;

public class Company {
	private String comId, comPass, comCeoName, comName, comPhone, comAddr1, comAddr2, comAddr3,
				comLicense, comEmail;
	private Timestamp comRegDate;
	
	public Company() {}
	public Company(String comId,String comName, String comPass, String comCeoName, String comPhone,
					String comAddr1, String comAddr2, String comAddr3, String comLicense, String comEmail,Timestamp comRegDate
					) {
		this.comId = comId;
		this.comPass = comPass;
		this.comCeoName = comCeoName;
		this.comName = comName;
		this.comPhone = comPhone;
		this.comAddr1 = comAddr1;
		this.comAddr2 = comAddr2;
		this.comAddr3 = comAddr3;
		this.comLicense = comLicense;
		this.comEmail = comEmail;
		this.comRegDate = comRegDate;
	}
	
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComPass() {
		return comPass;
	}
	public void setComPass(String comPass) {
		this.comPass = comPass;
	}
	public String getComCeoName() {
		return comCeoName;
	}
	public void setComCeoName(String comCeoName) {
		this.comCeoName = comCeoName;
	}
	public String getComPhone() {
		return comPhone;
	}
	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}
	public String getComAddr1() {
		return comAddr1;
	}
	public void setComAddr1(String comAddr1) {
		this.comAddr1 = comAddr1;
	}
	public String getComAddr2() {
		return comAddr2;
	}
	public void setComAddr2(String comAddr2) {
		this.comAddr2 = comAddr2;
	}
	public String getComAddr3() {
		return comAddr3;
	}
	public void setComAddr3(String comAddr3) {
		this.comAddr3 = comAddr3;
	}
	public String getComLicense() {
		return comLicense;
	}
	public void setComLicense(String comLicense) {
		this.comLicense = comLicense;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public Timestamp getComRegDate() {
		return comRegDate;
	}
	public void setComRegDate(Timestamp comRegDate) {
		this.comRegDate = comRegDate;
	}
			
}
