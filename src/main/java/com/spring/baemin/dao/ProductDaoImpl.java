package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	private final String NAME_SPACE = "com.spring.baemin.mapper.ProductMapper";
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public void productInsert(Product product) {		
		sqlSession.selectOne(NAME_SPACE + ".productInsert", product);
	}

	@Override
	public List<Product> getProductList(int storeNo) {
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel.put("storeNo", storeNo);
		return sqlSession.selectList(NAME_SPACE + ".getProductList", storeNo);
	}

	@Override
	public Product getProduct(int productNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getProduct", productNo);
	}

	
	
	
	
	
	
	
	// ----------- CartList ----------
	@Override
	public List<Product> getCartList(String user_id) {
		
		return sqlSession.selectList(NAME_SPACE + ".getCartList", user_id);
	}

}
