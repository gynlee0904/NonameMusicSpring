package com.nnm.spring.product.service;

import java.util.List;

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.MyClass;

public interface ProductService {
	
	public Integer insertClass(MyClass myClass);

	public Integer getListCount(String memberEmail);

	public List<MyClass> selectMyClassList(String memberEmail, PageInfo pInfo);

	public Integer getAllClassListCount();

	public List<MyClass> selectAllClassList(PageInfo pInfo);

	public MyClass selectClassByNo(Integer classNo);

	public int modifyClass(MyClass myClass);

	public MemberTch selectTchHistory(String memberEmail);
//////////////////////////////////////////////////////////////////////////
	public List<MemberTch> selectAllTeacherList(PageInfo pInfo);

	
}
