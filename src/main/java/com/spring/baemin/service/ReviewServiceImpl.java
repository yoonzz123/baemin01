package com.spring.baemin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.ReviewDao;
import com.spring.baemin.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	private ReviewDao reviewDao;
	
	@Autowired
	public ReviewServiceImpl(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	@Override
	public void insertReview(Review review) {
		reviewDao.insertReview(review);
	}

	@Override
	public List<Review> selectReview(int store_no) {
		return reviewDao.selectReview(store_no);
	}

	
	
}
