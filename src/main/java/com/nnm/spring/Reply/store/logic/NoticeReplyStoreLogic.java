package com.nnm.spring.Reply.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnm.spring.Reply.domain.NoticeReply;
import com.nnm.spring.Reply.store.NoticeReplyStore;

@Repository
public class NoticeReplyStoreLogic implements NoticeReplyStore {

	@Override
	public int insertNoticeReply(SqlSession session, NoticeReply nReply) {
		int result = session.insert("ReplyMapper.insertNoticeReply",nReply);
		return result;
	}

	@Override
	public int modifyReply(SqlSession session, NoticeReply nReply) {
		int result = session.update("ReplyMapper.modifyReply", nReply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession session, NoticeReply nReply) {
		int result = session.update("ReplyMapper.deleteReply", nReply);
		return result;
	}

	@Override
	public List<NoticeReply> selectNoticeReplyList(SqlSession session, Integer refNoticeNo) {
		List<NoticeReply> nrList = session.selectList("ReplyMapper.selectNoticeReplyList",refNoticeNo);
		return nrList;
	}
	
	@Override
	public int getReplyListCount(SqlSession session, Integer refNoticeNo) {
		int result = session.selectOne("ReplyMapper.getReplyListCount", refNoticeNo);
		return result;
	}
	

}
