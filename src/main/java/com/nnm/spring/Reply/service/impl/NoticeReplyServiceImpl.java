package com.nnm.spring.Reply.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnm.spring.Reply.domain.NoticeReply;
import com.nnm.spring.Reply.service.NoticeReplyService;
import com.nnm.spring.Reply.store.NoticeReplyStore;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService{
	@Autowired
	private NoticeReplyStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertNoticeReply(NoticeReply nReply) {
		int result = rStore.insertNoticeReply(session, nReply);
		return result;
	}

	@Override
	public int modifyReply(NoticeReply nReply) {
		int result = rStore.modifyReply(session, nReply);
		return result;
	}

	@Override
	public int deleteReply(NoticeReply nReply) {
		int result = rStore.deleteReply(session, nReply);
		return result;
	}
	
	@Override
	public List<NoticeReply> selectNoticeReplyList(Integer refNoticeNo) {
		List<NoticeReply> nrList = rStore.selectNoticeReplyList(session, refNoticeNo);
		return nrList;
	}

	@Override
	public int getReplyListCount(Integer refNoticeNo) {
		int result = rStore.getReplyListCount(session, refNoticeNo);
		return result;
	}
	

}
