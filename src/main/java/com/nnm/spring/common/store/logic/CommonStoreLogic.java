package com.nnm.spring.common.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.common.store.CommonStore;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;

@Repository
public class CommonStoreLogic implements CommonStore {

	@Override
	public MemberStd selectStdMemberLogin(SqlSession session, MemberStd sMember) {
		MemberStd sOne = session.selectOne("CommonMapper.selectStdMemberLogin",sMember);
		return sOne;
	}

	@Override
	public MemberTch selectTchMemberLogin(SqlSession session, MemberTch tMember) {
		MemberTch tOne = session.selectOne("CommonMapper.selectTchMemberLogin",tMember);
		return tOne;
	}
	
	

}
