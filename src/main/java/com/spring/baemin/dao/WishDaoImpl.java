package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Store;

@Repository
public class WishDaoImpl implements WishDao {

	private final String NAME_SPACE = "com.spring.baemin.mapper.WishMapper";

	private Map<String, Object> createMap(Long store_no, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store_no", store_no);
		map.put("user_id", user_id);
		return map;
	}

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void wishInsert(Long store_no, String user_id) {
		sqlSession.insert(NAME_SPACE + ".wishInsert", createMap(store_no, user_id));
	}

	@Override
	public int wishCheck(Long store_no, String user_id) {
		return sqlSession.selectOne(NAME_SPACE + ".wishCheck", createMap(store_no, user_id));
	}

	@Override
	public void wishDelete(Long store_no, String user_id) {
		sqlSession.delete(NAME_SPACE + ".wishDelete", createMap(store_no, user_id));
	}

	@Override
	public int wishCount(Long store_no) {
		return sqlSession.selectOne(NAME_SPACE + ".wishCount", store_no);
	}

	@Override
	public List<Store> wishList(String user_id) {
		return sqlSession.selectList(NAME_SPACE + ".wishList", user_id);
	}

	@Override
	public List<Object> wishPopularList(int catNo) {		
		return sqlSession.selectList(NAME_SPACE + ".wishPopularList", catNo);
	}

}
