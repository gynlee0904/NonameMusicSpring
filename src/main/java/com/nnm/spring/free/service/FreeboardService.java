package com.nnm.spring.free.service;

import java.util.List;
import java.util.Map;

import com.nnm.spring.free.domain.Freeboard;
import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

public interface FreeboardService {

	public int getListCount();

	public List<Freeboard> selectFreeList(PageInfo pInfo);

	public int insertFree(Freeboard freeboard);

	public Freeboard selectOneDetailByNo(Integer freeNo);

	public int getListCount(Map<String, String> paramMap);

	public List<Freeboard> searchFreeboardByKeyword(PageInfo pInfo, Map<String, String> paramMap);

}
