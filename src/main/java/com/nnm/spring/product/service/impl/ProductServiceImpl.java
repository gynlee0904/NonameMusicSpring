package com.nnm.spring.product.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.MyClass;
import com.nnm.spring.product.service.ProductService;
import com.nnm.spring.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductStore pStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public Integer insertClass(MyClass myClass) {
		Integer result = pStore.insertClass(session, myClass);
		return result;
	}
	
	@Override
	public Integer getListCount(String memberEmail) {
		Integer result = pStore.getListCount(session, memberEmail);
		return result;
	}

	@Override
	public List<MyClass> selectMyClassList(String memberEmail, PageInfo pInfo) {
		List<MyClass> mcList = pStore.selectMyClassList(session, memberEmail, pInfo);
		return mcList;
	}

	@Override
	public Integer getAllClassListCount() {
		Integer result = pStore.getAllClassListCount(session);
		return result;
	}

	@Override
	public List<MyClass> selectAllClassList(PageInfo pInfo) {
		List<MyClass> allList = pStore.selectAllClassList(session, pInfo);
		return allList;
	}

	@Override
	public MyClass selectClassByNo(Integer classNo) {
		MyClass classOne = pStore.selectClassByNo(session, classNo);
		return classOne;
	}

	@Override
	public int modifyClass(MyClass myClass) {
		int result = pStore.modifyClass(session, myClass);
		return result;
	}

	@Override
	public MemberTch selectTchHistory(String memberEmail) {
		MemberTch tMember = pStore.selectTchHistory(session, memberEmail);
		return tMember; 
	}

	@Override
	public List<MemberTch> selectAllTeacherList(PageInfo pInfo) {
		List<MemberTch> tList = pStore.selectAllTeacherList(session, pInfo);
		return tList;
	}

	
	
	

}
