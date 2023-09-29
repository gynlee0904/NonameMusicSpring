package com.nnm.spring.common.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.common.domain.Board;
import com.nnm.spring.common.store.CommonStore;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;

@Repository
public class CommonStoreLogic implements CommonStore {

	@Override
	public MemberStd selectStdMemberLogin(SqlSession session, MemberStd sMember) {
		MemberStd sOne = session.selectOne("CommonMapper.selectStdMemberLogin",sMember);
		return sOne;
	}

	@Override
	public MemberTch selectTchMemberLogin(SqlSession session, MemberTch tMember) {
		MemberTch tOne = session.selectOne("CommonMapper.selectTchMemberLogin",tMember);
		return tOne;
	}

	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("CommonMapper.selectBoardListCount");
		return result;
	}

	@Override
	public List<Board> selectAllBoardList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage(); //한페이지에 보이는 글 수 
		int offset = (pInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board>bList = session.selectList("CommonMapper.selectAllBoardList", null, rowBounds);
		return bList;
	}


	
	

}
