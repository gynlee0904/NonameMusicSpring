package com.nnm.spring.memberStd.store;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.memberStd.domain.MemberStd;

public interface MemberStdStore {

	public int insertStdMember(SqlSession session, MemberStd sMember);

	public MemberStd showOneStdById(SqlSession session, MemberStd sMember);

	public int modifyStdMember(SqlSession session, MemberStd sMember);

	public int outServiceStdMember(SqlSession session, String memberEmail);

	public int stdEmailCheck(SqlSession session, String memberEmail);

//	public MemberStd showOneByEmail(SqlSession session, String memberEmail);

}
