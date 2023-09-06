package com.nnm.spring.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.MyClass;

public interface ProductStore {
	
	public Integer insertClass(SqlSession session, MyClass myClass);

	public Integer getListCount(SqlSession session, String memberEmail);

	public List<MyClass> selectMyClassList(SqlSession session, String memberEmail, PageInfo pInfo);	

	public Integer getAllClassListCount(SqlSession session);

	public List<MyClass> selectAllClassList(SqlSession session, PageInfo pInfo);

	public MyClass selectClassByNo(SqlSession session, Integer classNo);



	

}
