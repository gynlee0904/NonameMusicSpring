package com.nnm.spring.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.product.domain.ClassReview;
import com.nnm.spring.review.store.ClassReviewStore;

@Repository
public class ClassReviewStoreLogic implements ClassReviewStore{

	@Override
	public int insertClassReview(SqlSession session, ClassReview cReview) {
		int result = session.insert("ReviewMapper.insertClassReview",cReview);
		return result;
	}

	@Override
	public List<ClassReview> selectClassReviewList(SqlSession session, Integer refClassNo) {
		List<ClassReview> cReviewList = session.selectList("ReviewMapper.selectClassReviewList",refClassNo);
		return cReviewList;
	}
	
	@Override
	public int getReviewListCount(SqlSession session, int refClassNo) {
		int result = session.selectOne("ReviewMapper.getReviewListCount", refClassNo);
		return result;
	}

}
