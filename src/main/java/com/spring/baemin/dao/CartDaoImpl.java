package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Cart;

@Repository
public class CartDaoImpl implements CartDao {
	private final String NAME_SPACE = "com.spring.baemin.mapper.CartMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int isProductCheck(Cart cart) {
		return sqlSession.selectOne(NAME_SPACE + ".isProductCheck", cart);
	}
	
	@Override
	public void cartAdd(Cart cart, int result) {
		
		System.out.println("result : " + result);
		if(result == 0) {
			sqlSession.insert(NAME_SPACE + ".cartInsert", cart);
		} else {
			sqlSession.update(NAME_SPACE + ".cartUpdate", cart);
		}
	}
	
	@Override
	public List<Cart> getCartList(String user_id) {
		return sqlSession.selectList(NAME_SPACE + ".getCartList", user_id);
	}

	@Override
	public void cartDelete(int cartNo, String user_id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartNo", cartNo);
		map.put("user_id", user_id);
		sqlSession.delete(NAME_SPACE + ".cartDelete", map);
	}

	@Override
	public int cartCnt(String user_id) {
		return sqlSession.selectOne(NAME_SPACE + ".cartCnt", user_id);
	}

	@Override
	public void cartUpdate(String user_id) {
		sqlSession.update(NAME_SPACE + ".cartIsPayCheck", user_id);
	}


}
