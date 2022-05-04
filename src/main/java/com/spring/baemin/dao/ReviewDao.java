package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Review;

public interface ReviewDao {

	void insertReview(Review review);

	List<Review> selectReview(int store_no);

}
