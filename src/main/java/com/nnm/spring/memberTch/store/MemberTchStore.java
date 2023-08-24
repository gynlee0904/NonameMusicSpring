package com.nnm.spring.memberTch.store;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.memberTch.domain.MemberTch;

public interface MemberTchStore {

	public int insertTchMember(SqlSession session, MemberTch tMember);


	public MemberTch showOneTchById(SqlSession session, MemberTch tMember);


	public int modifyTchMember(SqlSession session, MemberTch tMember);


	public int outServiceTchMember(SqlSession session, String memberEmail);

}
