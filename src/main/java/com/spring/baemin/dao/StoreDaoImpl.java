package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Store;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	private final String NAME_SPACE = "com.spring.baemin.mapper.StoreMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void storeInsert(Store store) {
		sqlSession.selectOne(NAME_SPACE + ".storeInsert", store);
	}
	
	@Override
	public Store getStore(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getStore", storeNo);
	}
	
	@Override
	public List<Store> getStoreList(String comId, int mainCat) {	
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel.put("comId", comId);
		mapModel.put("mainCat", mainCat);
		
		return sqlSession.selectList(NAME_SPACE + ".getStoreList", mapModel);
	}

	@Override
	public void storeUpdateProcess(Store store) {
		sqlSession.update(NAME_SPACE + ".storeUpdate", store);
	}

	@Override
	public void storeDelete(int storeNo) {
		sqlSession.delete(NAME_SPACE + ".storeDelete", storeNo);
	}
	
}
