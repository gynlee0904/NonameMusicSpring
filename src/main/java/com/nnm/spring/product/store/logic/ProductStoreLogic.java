package com.nnm.spring.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.MyClass;
import com.nnm.spring.product.store.ProductStore;

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



	
	
}
