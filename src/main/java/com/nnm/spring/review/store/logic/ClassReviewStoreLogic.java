package com.nnm.spring.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.review.domain.ClassReview;
import com.nnm.spring.review.store.ClassReviewStore;

@Repository
public class ClassReviewStoreLogic implements ClassReviewStore{

	//리뷰등록
	@Override
	public int insertClassReview(SqlSession session, ClassReview cReview) {
		int result = session.insert("ReviewMapper.insertClassReview",cReview);
		return result;
	}

	//리뷰목록
	@Override
	public List<ClassReview> selectClassReviewList(SqlSession session, Integer refClassNo) {
		List<ClassReview> cReviewList = session.selectList("ReviewMapper.selectClassReviewList",refClassNo);
		return cReviewList;
	}
	
	//리뷰 총개수
	@Override
	public int getReviewCount(SqlSession session, int refClassNo) {
		int result = session.selectOne("ReviewMapper.getReviewCount", refClassNo);
		return result;
	}

	@Override
	public double getReviewAvg(SqlSession session, int refClassNo) {
		double result = session.selectOne("ReviewMapper.getReviewAvg", refClassNo);
		return result;
	}

}
