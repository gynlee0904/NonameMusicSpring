package com.nnm.spring.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.notice.service.NoticeService;
import com.nnm.spring.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	
	/**
	 *  공지사항 전체 갯수조회(페이징)
	 */
	@Override
	public int getListCount() {
		int result = nStore.selectListCount(session);
		return result;
	}

	
	/**
	 * 공지사항 목록조회
	 */
	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		List<Notice>nList = nStore.selectNoticeList(session, pInfo);
		return nList;
	}
	
	
	/**
	 * 공지 검색 게시물 전체갯수(페이징)
	 */
	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = nStore.selectListCount(session, paramMap);
		return result;
	}
	
	
	/**
	 * 공지사항 조건에 따라 키워드로 검색 
	 */
	@Override
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<Notice>searchList = nStore.searchNoticeByKeyword(session, pInfo, paramMap);
		return searchList;
	}
	

	/**
	 * 글쓰기+파일첨부
	 */
	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}


	@Override
	public Notice selectOneDetailByNo(Integer noticeNo) {
		Notice notice = nStore.selectOneDetailByNo(session, noticeNo);
		return notice;
	}


	@Override
	public int deleteNoticeByNo(Integer noticeNo) {
		int result = nStore. deleteNoticeByNo(session, noticeNo);
		return result;
	}


	@Override
	public int modifyNoticeByNo(Notice notice) {
		int result = nStore.modifyNoticeByNo(session, notice);
		return result;
	}

	
	


	
	
	

}
