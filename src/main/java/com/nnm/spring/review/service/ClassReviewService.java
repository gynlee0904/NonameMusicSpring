package com.nnm.spring.review.service;

import java.util.List;

import com.nnm.spring.review.domain.ClassReview;

public interface ClassReviewService {

	public int insertClassReview(ClassReview cReview);
	
	public List<ClassReview> selectClassReviewList(Integer classNo);
	
	public int getReviewCount(int refClassNo);

	public double getReviewAvg(int classNo);

}
