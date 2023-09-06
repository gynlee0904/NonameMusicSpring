package com.nnm.spring.Reply.domain;

import java.sql.Timestamp;

public class NoticeReply {
	private int noticeReplyNo;
	private int refNoticeNo;
	private String noticeReplyContent;
	private String noticeReplyWriter;
	private String noticeReplyFilename;
	private String noticeReplyFileRename;
	private String noticeReplyFilepath;
	private long noticeReplyFilelength;
	private Timestamp nrCreateDate;
	private Timestamp nrUpdateDate;
	private char updateYn;
	private char rStatus;
	
	public NoticeReply() {}

	public int getNoticeReplyNo() {
		return noticeReplyNo;
	}

	public void setNoticeReplyNo(int noticeReplyNo) {
		this.noticeReplyNo = noticeReplyNo;
	}

	public int getRefNoticeNo() {
		return refNoticeNo;
	}

	public void setRefNoticeNo(int noticeRefBoardNo) {
		this.refNoticeNo = noticeRefBoardNo;
	}

	public String getNoticeReplyContent() {
		return noticeReplyContent;
	}

	public void setNoticeReplyContent(String noticeReplyContent) {
		this.noticeReplyContent = noticeReplyContent;
	}

	public String getNoticeReplyWriter() {
		return noticeReplyWriter;
	}

	public void setNoticeReplyWriter(String noticeReplyWriter) {
		this.noticeReplyWriter = noticeReplyWriter;
	}

	public String getNoticeReplyFilename() {
		return noticeReplyFilename;
	}

	public void setNoticeReplyFilename(String noticeReplyFilename) {
		this.noticeReplyFilename = noticeReplyFilename;
	}

	public String getNoticeReplyFileRename() {
		return noticeReplyFileRename;
	}

	public void setNoticeReplyFileRename(String noticeReplyFileRename) {
		this.noticeReplyFileRename = noticeReplyFileRename;
	}

	public String getNoticeReplyFilepath() {
		return noticeReplyFilepath;
	}

	public void setNoticeReplyFilepath(String noticeReplyFilepath) {
		this.noticeReplyFilepath = noticeReplyFilepath;
	}

	public long getNoticeReplyFilelength() {
		return noticeReplyFilelength;
	}

	public void setNoticeReplyFilelength(long noticeReplyFilelength) {
		this.noticeReplyFilelength = noticeReplyFilelength;
	}

	public Timestamp getNrCreateDate() {
		return nrCreateDate;
	}

	public void setNrCreateDate(Timestamp nrCreateDate) {
		this.nrCreateDate = nrCreateDate;
	}

	public Timestamp getNrUpdateDate() {
		return nrUpdateDate;
	}

	public void setNrUpdateDate(Timestamp nrUpdateDate) {
		this.nrUpdateDate = nrUpdateDate;
	}

	public char getUpdateYn() {
		return updateYn;
	}

	public void setUpdateYn(char updateYn) {
		this.updateYn = updateYn;
	}

	public char getrStatus() {
		return rStatus;
	}

	public void setrStatus(char rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "공지댓글 [댓글번호=" + noticeReplyNo + ", 공지글번호=" + refNoticeNo
				+ ", 댓글내용=" + noticeReplyContent + ", 댓글작성자=" + noticeReplyWriter
				+ ", 댓글첨부파일이름=" + noticeReplyFilename + ", 댓글첨부파일리네임=" + noticeReplyFileRename
				+ ", 댓글첨부파일경로=" + noticeReplyFilepath + ", 댓글첨부파일크기 =" + noticeReplyFilelength
				+ ", 댓글작성날짜=" + nrCreateDate + ", 댓글수정날짜=" + nrUpdateDate + ", 수정여부=" + updateYn
				+ ", rStatus=" + rStatus + "]";
	}
	
	
	
}
