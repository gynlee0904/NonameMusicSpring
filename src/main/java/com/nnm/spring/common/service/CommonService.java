package com.nnm.spring.common.service;

import java.util.List;

import com.nnm.spring.common.domain.Board;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;

public interface CommonService {

	public MemberStd SMemberLoginCheck(MemberStd sMember);

	public MemberTch TMemberLoginCheck(MemberTch tMember);

	public int getListCount();

	public List<Board> selectAllBoardList(PageInfo pInfo);



}
