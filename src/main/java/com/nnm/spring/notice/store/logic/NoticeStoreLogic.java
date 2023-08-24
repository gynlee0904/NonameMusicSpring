package com.nnm.spring.notice.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int selectListCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.selectListCount");
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage(); //한페이지에 보이는 글 수 
		int offset = (pInfo.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice>nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}
	
	@Override
	public int selectListCount(SqlSession session, Map<String, String> paramMap) {
		int result = session.selectOne("NoticeMapper.selectListByKeywordCount",paramMap);
		return result;
	}
	
	@Override
	public List<Notice> searchNoticeByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage(); //한페이지에 보이는 글 수(가져오는 행의 갯수) 
		int offset = (pInfo.getCurrentPage()-1)*limit; //	
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Notice>searchList = session.selectList("NoticeMapper.searchNoticeByKeyword", paramMap, rowBounds);
		return searchList;
	}
	
	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	
	@Override
	public Notice selectOneDetailByNo(SqlSession session, Integer noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneDetailByNo",noticeNo);
		return notice;
	}

	@Override
	public int deleteNoticeByNo(SqlSession session, Integer noticeNo) {
		int result = session.delete("NoticeMapper.deleteNoticeByNo",noticeNo);
		return result;
	}

	@Override
	public int modifyNoticeByNo(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.modifyNoticeByNo", notice);
		return result;
	}

	

	
	
	

	
}
