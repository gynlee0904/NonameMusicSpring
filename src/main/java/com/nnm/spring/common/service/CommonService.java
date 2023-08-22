package com.nnm.spring.common.service;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;

public interface CommonService {

	public MemberStd SMemberLoginCheck(MemberStd sMember);

	public MemberTch TMemberLoginCheck(MemberTch tMember);

}
