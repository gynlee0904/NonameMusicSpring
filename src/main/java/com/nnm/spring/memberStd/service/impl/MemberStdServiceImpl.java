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
	public MemberStd showOneStdById(MemberStd sMember) {
		MemberStd sOne = sStore.showOneStdById(session, sMember);
		return sOne;
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

	@Override
	public int stdEmailCheck(String memberEmail) {
		int result = sStore.stdEmailCheck(session, memberEmail);
		return result;
	}

//	@Override
//	public MemberStd showOneByEmail(String memberEmail) {
//		MemberStd sOne = sStore.showOneByEmail(session, memberEmail);
//		return sOne;
//	}

	
}
