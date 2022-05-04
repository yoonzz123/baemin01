package com.spring.baemin.service;

import com.spring.baemin.domain.Company;

public interface ComService {
	
	public abstract String comPassCheck(String comId);
	
	public abstract void insertCom(Company company);

	public abstract void updateCompany(Company company);

	public abstract void deleteCompany(String comId);
}
