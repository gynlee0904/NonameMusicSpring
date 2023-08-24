package com.nnm.spring.notice.service;

import java.util.List;
import java.util.Map;

import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

public interface NoticeService {

	
	/**
	 * 공지사항 전체 갯수조회(페이징)
	 * @return
	 */
	public int getListCount();

	
	/**
	 * 공지사항 목록조회
	 * @param pInfo
	 * @return
	 */
	public List<Notice> selectNoticeList(PageInfo pInfo);

	
	/**
	 * 글쓰기+파일첨부 
	 * @param notice
	 * @return
	 */
	public int insertNotice(Notice notice);

	
	/**
	 * 공지 검색 게시물 전체갯수(페이징)
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, String> paramMap);

	
	/**
	 * 공지사항 조건에 따라 키워드로 검색 
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, Map<String, String> paramMap);


	/**
	 * 공지사항 글 상세보기 (디테일)
	 */
	public Notice selectOneDetailByNo(Integer noticeNo);

	
	/**
	 * 공지 글삭제
	 */
	public int deleteNoticeByNo(Integer noticeNo);


	/**
	 * 공지 글수정
	 */
	public int modifyNoticeByNo(Notice notice);
	

}
