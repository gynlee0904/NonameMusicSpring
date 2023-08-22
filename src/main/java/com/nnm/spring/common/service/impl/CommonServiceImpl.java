package com.nnm.spring.common.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.common.service.CommonService;
import com.nnm.spring.common.store.CommonStore;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonStore cStore;
	
	@Autowired
	private SqlSession session;

	
	@Override
	public MemberStd SMemberLoginCheck(MemberStd sMember) {
		MemberStd sOne = cStore.selectStdMemberLogin(session, sMember);
		return sOne;
	}


	@Override
	public MemberTch TMemberLoginCheck(MemberTch tMember) {
		MemberTch tOne = cStore.selectTchMemberLogin(session, tMember);
		return tOne;
	}
	

}
