package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Cart;

@Repository
public class ODetailDaoImpl implements ODetailDao {
	private final String NAME_SPACE = "com.spring.baemin.mapper.ODetailMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public void oDetailInsert(int odrNo, List<Cart> cartList) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("odrNo", odrNo);
		params.put("cartList", cartList);
		
		sqlSession.insert(NAME_SPACE + ".insertODetail", params);
	}

}
