package com.nnm.spring.memberTch.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.memberTch.service.MemberTchService;
import com.nnm.spring.memberTch.store.MemberTchStore;

@Service
public class MemberTchServiceImpl implements MemberTchService{
	@Autowired
	private MemberTchStore tStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertTchMember(MemberTch tMember) {
		int result = tStore.insertTchMember(session, tMember);
		return result;
	}

	@Override
	public MemberTch showOneTchById(MemberTch tMember) {
		MemberTch tOne = tStore.showOneTchById(session, tMember);
		return tOne;
	}

	@Override
	public int modifyTchMember(MemberTch tMember) {
		int result = tStore.modifyTchMember(session, tMember);
		return result;
	}

	@Override
	public int outServiceTchMember(String memberEmail) {
		int result = tStore.outServiceTchMember(session, memberEmail);
		return result;
	}
	
	



}
