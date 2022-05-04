package com.spring.baemin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	private final String NAME_SPACE = "com.spring.baemin.mapper.ReviewMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public ReviewDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReview(Review review) {
		sqlSession.insert(NAME_SPACE + ".insertReview", review);
	}

	@Override
	public List<Review> selectReview(int store_no) {
		return sqlSession.selectList(NAME_SPACE + ".selectReview", store_no);
	}

}
