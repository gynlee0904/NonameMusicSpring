package com.nnm.spring.Reply.service;

import java.util.List;

import com.nnm.spring.Reply.domain.NoticeReply;

public interface NoticeReplyService {

	public int insertNoticeReply(NoticeReply reply);

	public List<NoticeReply> selectNoticeReplyList(Integer refNoticeNo);

	public int modifyReply(NoticeReply reply);

	public int deleteReply(NoticeReply reply);

}
