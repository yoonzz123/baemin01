package com.spring.baemin.service;

import java.util.List;

import com.spring.baemin.domain.Review;

public interface ReviewService {
	void insertReview(Review review);

	List<Review> selectReview(int store_no);
}
