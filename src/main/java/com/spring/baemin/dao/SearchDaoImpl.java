package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Store;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	private final String NAME_SPACE = "com.spring.baemin.mapper.SearchMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Store> storeSearch(String searchKey) {
		return sqlSession.selectList(NAME_SPACE + ".storeSearch", searchKey);
	}

	@Override
	public void insertSearchKey(String user_id, String searchKey) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("searchKey", searchKey);
		sqlSession.insert(NAME_SPACE + ".insertSearchKey", map);
	}

	@Override
	public List<String> recentSearches(String user_id) {
		return sqlSession.selectList(NAME_SPACE + ".recentSearches", user_id);
	}

	@Override
	public List<Object> popularSearch() {
		return sqlSession.selectList(NAME_SPACE + ".popularSearch");
	}

}
