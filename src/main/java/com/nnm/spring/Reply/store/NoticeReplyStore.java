package com.nnm.spring.Reply.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.nnm.spring.Reply.domain.NoticeReply;

public interface NoticeReplyStore {

	/**
	 * 댓글등록
	 * @param session
	 * @param reply
	 * @return
	 */
	public int insertNoticeReply(SqlSession session, NoticeReply nReply);

	/**
	 * 댓글수정
	 * @param session
	 * @param reply
	 * @return
	 */
	public int modifyReply(SqlSession session, NoticeReply nReply);

	/**
	 * 댓글삭제
	 * @param session
	 * @param reply
	 * @return
	 */
	public int deleteReply(SqlSession session, NoticeReply nReply);
	
	/**
	 * 댓글목록
	 * @param session
	 * @param refNoticeNo
	 * @return
	 */
	public List<NoticeReply> selectNoticeReplyList(SqlSession session, Integer refNoticeNo);

	/**
	 * 댓글 총 개수
	 * @param session
	 * @param refNoticeNo
	 * @return
	 */
	public int getReplyListCount(SqlSession session, Integer refNoticeNo);

}
