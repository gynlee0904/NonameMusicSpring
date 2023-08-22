package com.nnm.spring.free.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.free.domain.Freeboard;
import com.nnm.spring.notice.domain.PageInfo;

public interface FreeboardStore {

	public int selectListCount(SqlSession session);

	public List<Freeboard> selectFreeList(SqlSession session, PageInfo pInfo);

	public int insertFree(SqlSession session, Freeboard freeboard);

	public Freeboard selectOneDetailByNo(SqlSession session, Integer freeNo);

	public int selectFreeListCount(SqlSession session, Map<String, String> paramMap);

	public List<Freeboard> searchFreeboardByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);

}
