package com.nnm.spring.common.store;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;

public interface CommonStore {

	public MemberStd selectStdMemberLogin(SqlSession session, MemberStd sMember);

	public MemberTch selectTchMemberLogin(SqlSession session, MemberTch tMember);

}
