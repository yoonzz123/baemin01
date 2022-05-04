package com.spring.baemin.dao;

import com.spring.baemin.domain.Company;

public interface ComDao {
	public abstract String comPassCheck(String comId);
	
	public abstract void insertCompany(Company company);

	public abstract void updateCompany(Company company);

	public abstract void deleteCompany(String comId);

}
