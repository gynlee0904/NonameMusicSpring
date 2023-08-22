package com.nnm.spring.memberStd.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberStd.service.MemberStdService;
import com.nnm.spring.memberStd.store.MemberStdStore;

@Service
public class MemberStdServiceImpl implements MemberStdService {
	@Autowired
	private MemberStdStore sStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertStdMember(MemberStd sMember) {
		int result = sStore.insertStdMember(session, sMember);
		return result;
	}

	@Override
	public MemberStd showOneStdById(String memberEmail) {
		MemberStd sMember = sStore.showOneStdById(session, memberEmail);
		return sMember;
	}

	@Override
	public int modifyStdMember(MemberStd sMember) {
		int result = sStore.modifyStdMember(session, sMember);
		return result;
	}

	@Override
	public int outServiceStdMember(String memberEmail) {
		int result = sStore.outServiceStdMember(session, memberEmail);
		return result;
	}

	
}
