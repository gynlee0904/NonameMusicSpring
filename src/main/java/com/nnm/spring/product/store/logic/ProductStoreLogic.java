package com.nnm.spring.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.Reply.domain.NoticeReply;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.Bookmark;
import com.nnm.spring.product.domain.MyClass;
import com.nnm.spring.product.store.ProductStore;
import com.nnm.spring.review.domain.ClassReview;

@Repository
public class ProductStoreLogic implements ProductStore {
	
	@Override
	public Integer insertClass(SqlSession session, MyClass myClass) {
		Integer result = session.insert("ProductMapper.insertClass", myClass);
		return result;
	}

	@Override
	public Integer getListCount(SqlSession session, String memberEmail) {
		Integer result = session.selectOne("ProductMapper.getListCount", memberEmail);
		return result;
	}

	@Override
	public List<MyClass> selectMyClassList(SqlSession session, String memberEmail, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MyClass>mcList = session.selectList("ProductMapper.selectMyClassList",memberEmail,rowBounds);
		return mcList;
	}

	@Override
	public Integer getAllClassListCount(SqlSession session) {
		Integer result = session.selectOne("ProductMapper.getAllClassListCount");
		return result;
	}

	@Override
	public List<MyClass> selectAllClassList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MyClass>allList = session.selectList("ProductMapper.selectAllClassList",null,rowBounds);
		return allList;
	}

	@Override
	public MyClass selectClassByNo(SqlSession session, Integer classNo) {
		MyClass classOne = session.selectOne("ProductMapper.selectClassByNo", classNo);
		return classOne;
	}

	@Override
	public int modifyClass(SqlSession session, MyClass myClass) {
		int result = session.update("ProductMapper.modifyClass", myClass);
		return result;
	}
	
	@Override
	public int insertBmk(SqlSession session, Bookmark bookmark) {
		int result = session.insert("ProductMapper.insertBmk", bookmark);
		return result;
	}
	
	@Override
	public int deleteBmk(SqlSession session, Bookmark bookmark) {
		int result = session.delete("ProductMapper.deleteBmk", bookmark);
		return result;
	}
	
	@Override
	public int selectBmkYn(SqlSession session, Bookmark bookmark) {
		int result = session.selectOne("ProductMapper.selectBmkYn", bookmark);
		return result;
	}
	
	

/////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public MemberTch selectTchHistory(SqlSession session, String memberEmail) {
		MemberTch tMember = session.selectOne("ProductMapper.selectTchHistory", memberEmail);
		return tMember;
	}
	

	@Override
	public List<MemberTch> selectAllTeacherList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberTch>tList = session.selectList("ProductMapper.selectAllTeacherList",null,rowBounds);
		return tList;
	}

	

	



	







	
	
}
