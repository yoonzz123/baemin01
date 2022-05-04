package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Delivery;

@Repository
public class DeliveryDaoImpl implements DeliveryDao {

	private final String NAME_SPACE = "com.spring.baemin.mapper.DeliveryMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Delivery> getDeliveryList(int storeNo) {
		Map<String, Object> mapModel = new HashMap<String,Object>();
		
		mapModel.put("storeNo",storeNo);
		
		return sqlSession.selectList(NAME_SPACE+".getDeliveryList", mapModel);
	}
	public void insertDeliveryList(Delivery delivery,List<Delivery> list) {
		sqlSession.insert(NAME_SPACE + ".insertDeliveryList", list);
	}
	
	@Override
	public void deliveryInsert(Delivery delivery) {
		sqlSession.selectOne(NAME_SPACE+".insertDelivery", delivery);
	}
	@Override
	public void deliveryUpdate(Delivery delivery) {
		sqlSession.update(NAME_SPACE+".updateDelivery", delivery);
	}
	@Override
	public void deliveryDelete(int deliNo) {
		sqlSession.delete(NAME_SPACE+".deleteDelivery",deliNo);
	}
}
