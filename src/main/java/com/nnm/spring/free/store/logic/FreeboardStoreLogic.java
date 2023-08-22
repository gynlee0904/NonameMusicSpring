package com.nnm.spring.free.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.free.domain.Freeboard;
import com.nnm.spring.free.store.FreeboardStore;
import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

@Repository
public class FreeboardStoreLogic implements FreeboardStore {

	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("FreeboardMapper.selectListCount");
		return result;
	}

	@Override
	public List<Freeboard> selectFreeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Freeboard>fList = session.selectList("FreeboardMapper.selectFreeList",null,rowbounds);
		return fList;
	}

	@Override
	public int insertFree(SqlSession session, Freeboard freeboard) {
		int result = session.insert("FreeboardMapper.insertFreeboard",freeboard);
		return result;
	}

	@Override
	public Freeboard selectOneDetailByNo(SqlSession session, Integer freeNo) {
		Freeboard freeboard = session.selectOne("FreeboardMapper.selectOneDetailByNo", freeNo);
		return freeboard;
	}

	@Override
	public int selectFreeListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("FreeboardMapper.selectFreeListByKeywordCount",paramMap);
		return result;
	}

	@Override
	public List<Freeboard> searchFreeboardByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage(); //한페이지에 보이는 글 수(가져오는 행의 갯수) 
		int offset = (pInfo.getCurrentPage()-1)*limit; //	
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Freeboard>searchList = session.selectList("FreeboardMapper.searchFreeboardByKeyword", paramMap, rowBounds);
		return searchList;
	}

	
	
}
