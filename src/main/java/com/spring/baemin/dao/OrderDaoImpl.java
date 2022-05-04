package com.spring.baemin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Cart;
import com.spring.baemin.domain.Order;
import com.spring.baemin.domain.Product;

@Repository
public class OrderDaoImpl implements OrderDao{
	private final String NAME_SPACE = "com.spring.baemin.mapper.OrderMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int odrInsert(Order odr) {
		// odr insert
		sqlSession.insert(NAME_SPACE + ".odrInsert", odr);
		// odr insert 후 odrNo 반환 
		return sqlSession.selectOne(NAME_SPACE + ".getOdrNo");
	}

	@Override
	public List<Order> getOrderList(String user_id) {		
		return sqlSession.selectList(NAME_SPACE + ".odrList", user_id);
	}

	@Override
	public List<Product> getProductList(int odrNo) {
		return sqlSession.selectList(NAME_SPACE + ".getProductList", odrNo);
	}
	
	@Override 
	public List<Cart> getCartList(int odrNo) {
		return sqlSession.selectList(NAME_SPACE + ".getCartList", odrNo);
	}
}
