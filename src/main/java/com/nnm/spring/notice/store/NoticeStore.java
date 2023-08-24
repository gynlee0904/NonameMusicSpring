package com.nnm.spring.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

public interface NoticeStore {

	
	public int selectListCount(SqlSession session);

	public List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo);
	
	public int selectListCount(SqlSession session, Map<String, String> paramMap);
	
	public List<Notice> searchNoticeByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);

	public int insertNotice(SqlSession session, Notice notice);

	public Notice selectOneDetailByNo(SqlSession session, Integer noticeNo);

	public int deleteNoticeByNo(SqlSession session, Integer noticeNo);

	public int modifyNoticeByNo(SqlSession session, Notice notice);

	

	

}
