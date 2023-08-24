package com.nnm.spring.memberTch.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.memberTch.store.MemberTchStore;

@Repository
public class MemberTchStoreLogic implements MemberTchStore{

	@Override
	public int insertTchMember(SqlSession session, MemberTch tMember) {
		int result = session.insert("TMemberMapper.insertTchMember", tMember);
		return result;
	}


	
	@Override
	public MemberTch showOneTchById(SqlSession session, MemberTch tMember) {
		MemberTch tOne = session.selectOne("TMemberMapper.showOneTchById",tMember);
		return tOne;
	}



	@Override
	public int modifyTchMember(SqlSession session, MemberTch tMember) {
		int result = session.update("TMemberMapper.modifyTchMember",tMember);
		return result;
	}



	@Override
	public int outServiceTchMember(SqlSession session, String memberEmail) {
		int result = session.update("TMemberMapper.outServiceTchMember",memberEmail);
		return result;
	}
	
	

	
}
