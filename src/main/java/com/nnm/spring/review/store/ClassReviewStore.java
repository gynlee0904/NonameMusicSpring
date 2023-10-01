package com.nnm.spring.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.review.domain.ClassReview;

public interface ClassReviewStore {

	public int insertClassReview(SqlSession session, ClassReview cReview);

	public List<ClassReview> selectClassReviewList(SqlSession session, Integer refClassNo);

	public int getReviewCount(SqlSession session, int refClassNo);

	public double getReviewAvg(SqlSession session, int refClassNo);
	
	

}
