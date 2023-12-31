package com.nnm.spring.memberStd.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberStd.store.MemberStdStore;

@Repository
public class MemberStdStoreLogic implements MemberStdStore {

	@Override
	public int insertStdMember(SqlSession session, MemberStd sMember) {
		int result = session.insert("SMemberMapper.insertMemberStd",sMember);
		return result;
	}

	@Override
	public MemberStd showOneStdById(SqlSession session, MemberStd sMember) {
		MemberStd sOne = session.selectOne("SMemberMapper.showOneStdById",sMember);
		return sOne;
	}

	@Override
	public int modifyStdMember(SqlSession session, MemberStd sMember) {
		int result = session.update("SMemberMapper.modifyStdMember", sMember);
		return result;
	}

	@Override
	public int outServiceStdMember(SqlSession session, String memberEmail) {
		int result = session.update("SMemberMapper.outServiceStdMember", memberEmail);
		return result;
	}

	@Override
	public int stdEmailCheck(SqlSession session, String memberEmail) {
		int result = session.selectOne("SMemberMapper.stdEmailCheck", memberEmail);
		return result;
	}

//	@Override
//	public MemberStd showOneByEmail(SqlSession session, String memberEmail) {
//		MemberStd sOne = session.selectOne("SMemberMapper.showOneByEmail", memberEmail);
//		return sOne;
//	}

	
}
