package com.nnm.spring.Reply.service;

import java.util.List;

import com.nnm.spring.Reply.domain.NoticeReply;

public interface NoticeReplyService {

	/**
	 * 댓글등록
	 * @param reply
	 * @return
	 */
	public int insertNoticeReply(NoticeReply nReply);

	/**
	 * 댓글수정
	 * @param reply
	 * @return
	 */
	public int modifyReply(NoticeReply nReply);

	/**
	 * 댓글삭제
	 * @param reply
	 * @return
	 */
	public int deleteReply(NoticeReply nReply);
	
	/**
	 * 댓글목록
	 * @param refNoticeNo
	 * @return
	 */
	public List<NoticeReply> selectNoticeReplyList(Integer refNoticeNo);

	
	/**
	 * 댓글 총 개수
	 * @param noticeNo
	 * @return
	 */
	public int getReplyListCount(Integer refNoticeNo);

}
