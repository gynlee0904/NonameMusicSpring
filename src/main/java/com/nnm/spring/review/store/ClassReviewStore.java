package com.nnm.spring.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.product.domain.ClassReview;

public interface ClassReviewStore {

	public int insertClassReview(SqlSession session, ClassReview cReview);

	public List<ClassReview> selectClassReviewList(SqlSession session, Integer refClassNo);

	public int getReviewListCount(SqlSession session, int refClassNo);
	
	

}
