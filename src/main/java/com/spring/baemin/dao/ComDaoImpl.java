package com.spring.baemin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Company;

@Repository
public class ComDaoImpl implements ComDao {
	
	private final String NAME_SPACE = "com.spring.baemin.mapper.ComMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String comPassCheck(String comId) {
		
		
		String pass = sqlSession.selectOne(NAME_SPACE + ".comPassCheck", comId);

		return pass;
	}
	@Override
	public void insertCompany(Company company) {
		sqlSession.selectOne(NAME_SPACE + ".insertCompany", company);
	}
	@Override
	public void updateCompany(Company company) {
		sqlSession.update(NAME_SPACE + ".updateCompany", company);
	}
	@Override
	public void deleteCompany(String comId) {
		sqlSession.delete(NAME_SPACE + ".deleteCompany", comId);
	}
}
