package com.nnm.spring.memberStd.service;

import com.nnm.spring.memberStd.domain.MemberStd;

public interface MemberStdService {

	public int insertStdMember(MemberStd sMember);

	public MemberStd showOneStdById(String memberEmail);

	public int modifyStdMember(MemberStd sMember);

	public int outServiceStdMember(String memberEmail);

}