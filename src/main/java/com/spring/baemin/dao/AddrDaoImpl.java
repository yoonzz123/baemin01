package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Address;

@Repository
public class AddrDaoImpl implements AddrDao {
	
	private final String NAME_SPACE = "com.spring.baemin.mapper.AddrMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void addrInsert(String user_id, Address addr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("addr1", addr.getAddr1());
		map.put("addr2", addr.getAddr2());
		map.put("addr3", addr.getAddr3());
		sqlSession.insert(NAME_SPACE + ".addrInsert", map);
	}

}
