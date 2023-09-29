package com.nnm.spring.review.service;

import java.util.List;

import com.nnm.spring.product.domain.ClassReview;

public interface ClassReviewService {

	public int insertClassReview(ClassReview cReview);
	
	public List<ClassReview> selectClassReviewList(Integer classNo);
	
	public int getReviewListCount(int refClassNo);

}
