package com.nnm.spring.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.review.domain.ClassReview;
import com.nnm.spring.review.service.ClassReviewService;
import com.nnm.spring.review.store.ClassReviewStore;

@Service
public class ClassReviewServiceImpl implements ClassReviewService{
	@Autowired
	private SqlSession session;
	@Autowired
	private ClassReviewStore cReviewStore;
	
	@Override
	public int insertClassReview(ClassReview cReview) {
		int result = cReviewStore.insertClassReview(session, cReview);
		return result;
	}

	@Override
	public List<ClassReview> selectClassReviewList(Integer refClassNo) {
		List<ClassReview> cReviewList = cReviewStore.selectClassReviewList(session, refClassNo);
		return cReviewList;
	}

	@Override
	public int getReviewCount(int refClassNo) {
		int result = cReviewStore.getReviewCount(session, refClassNo);
		return result;
	}

	@Override
	public double getReviewAvg(int refClassNo) {
		double result = cReviewStore.getReviewAvg(session, refClassNo);
		return result;
	}

}
