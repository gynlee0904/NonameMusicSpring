package com.nnm.spring.Reply.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.Reply.domain.NoticeReply;

public interface NoticeReplyStore {

	public int insertNoticeReply(SqlSession session, NoticeReply reply);

	public List<NoticeReply> selectNoticeReplyList(SqlSession session, Integer refNoticeNo);

	public int modifyReply(SqlSession session, NoticeReply reply);

	public int deleteReply(SqlSession session, NoticeReply reply);

}
