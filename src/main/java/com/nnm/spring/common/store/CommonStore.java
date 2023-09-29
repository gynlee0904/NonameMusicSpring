package com.nnm.spring.common.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.common.domain.Board;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;

public interface CommonStore {

	public MemberStd selectStdMemberLogin(SqlSession session, MemberStd sMember);

	public MemberTch selectTchMemberLogin(SqlSession session, MemberTch tMember);

	public int selectListCount(SqlSession session);

	public List<Board> selectAllBoardList(SqlSession session, PageInfo pInfo);


}
