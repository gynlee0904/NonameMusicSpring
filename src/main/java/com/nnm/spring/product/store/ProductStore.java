package com.nnm.spring.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.Bookmark;
import com.nnm.spring.product.domain.ClassReview;
import com.nnm.spring.product.domain.MyClass;

public interface ProductStore {
	
	public Integer insertClass(SqlSession session, MyClass myClass);

	public Integer getListCount(SqlSession session, String memberEmail);

	public List<MyClass> selectMyClassList(SqlSession session, String memberEmail, PageInfo pInfo);	

	public Integer getAllClassListCount(SqlSession session);

	public List<MyClass> selectAllClassList(SqlSession session, PageInfo pInfo);

	public MyClass selectClassByNo(SqlSession session, Integer classNo);

	public int modifyClass(SqlSession session, MyClass myClass);
	
	public int insertBmk(SqlSession session, Bookmark bookmark);
	
	public int deleteBmk(SqlSession session, Bookmark bookmark);
	
	public int selectBmkYn(SqlSession session, Bookmark bookmark);
	


//////////////////////////////////////////////////////////////////////

	public MemberTch selectTchHistory(SqlSession session, String memberEmail);
	

	
	public List<MemberTch> selectAllTeacherList(SqlSession session, PageInfo pInfo);

	

	



	






	



	

}
