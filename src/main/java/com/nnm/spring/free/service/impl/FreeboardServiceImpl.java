package com.nnm.spring.free.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.free.domain.Freeboard;
import com.nnm.spring.free.service.FreeboardService;
import com.nnm.spring.free.store.FreeboardStore;
import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

@Service
public class FreeboardServiceImpl implements FreeboardService{
	@Autowired
	private FreeboardStore fStore;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int getListCount() {
		int result = fStore.selectListCount(session);
		return result;
	}

	@Override
	public List<Freeboard> selectFreeList(PageInfo pInfo) {
		List<Freeboard>fList = fStore.selectFreeList(session, pInfo);
		return fList;
	}

	@Override
	public int insertFree(Freeboard freeboard) {
		int result = fStore.insertFree(session, freeboard);
		return result;
	}

	@Override
	public Freeboard selectOneDetailByNo(Integer freeNo) {
		Freeboard freeboard = fStore. selectOneDetailByNo(session, freeNo);
		return freeboard;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = fStore.selectFreeListCount(session, paramMap);
		return result;
	}

	@Override
	public List<Freeboard> searchFreeboardByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<Freeboard>searchList = fStore.searchFreeboardByKeyword(session, pInfo, paramMap);
		return searchList;
	}
	
	
	
	
	
	

}
