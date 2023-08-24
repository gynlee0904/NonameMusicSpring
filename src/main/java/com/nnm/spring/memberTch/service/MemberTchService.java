package com.nnm.spring.memberTch.service;

import com.nnm.spring.memberTch.domain.MemberTch;

public interface MemberTchService {

	public int insertTchMember(MemberTch tMember);

	public MemberTch showOneTchById(MemberTch tMember);

	public int modifyTchMember(MemberTch tMember);

	public int outServiceTchMember(String memberEmail);



	

}
