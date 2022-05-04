package com.spring.baemin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.ComDao;
import com.spring.baemin.domain.Company;

@Service
public class ComServiceImpl implements ComService {
	@Autowired
	private ComDao comDao;

	@Override
	public String comPassCheck(String comId) {
		return comDao.comPassCheck(comId);
	}
	@Override
	public void insertCom(Company company) {
		comDao.insertCompany(company);
	}
	@Override
	public void updateCompany(Company company) {
		comDao.updateCompany(company);
	}
	@Override
	public void deleteCompany(String comId) {
		comDao.deleteCompany(comId);
	}
}
