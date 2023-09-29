package com.nnm.spring.common.domain;

import java.sql.Timestamp;

public class Board {
	private int boardNo;
	private String boardSubject;
	private String boardContent;
	private String boardWriter;
	private Timestamp bCreateDate;
	private Timestamp bUpdateDate;
	private String boardFilename;
	private String boardFilepath;
	private long boardFilelength;
	
	public Board() {}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public Timestamp getbCreateDate() {
		return bCreateDate;
	}
	public void setbCreateDate(Timestamp bCreateDate) {
		this.bCreateDate = bCreateDate;
	}
	public Timestamp getbUpdateDate() {
		return bUpdateDate;
	}
	public void setbUpdateDate(Timestamp bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}
	public String getBoardFilename() {
		return boardFilename;
	}
	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}
	public String getBoardFilepath() {
		return boardFilepath;
	}
	public void setBoardFilepath(String boardFilepath) {
		this.boardFilepath = boardFilepath;
	}
	public long getBoardFilelength() {
		return boardFilelength;
	}
	public void setBoardFilelength(long boardFilelength) {
		this.boardFilelength = boardFilelength;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardSubject=" + boardSubject + ", boardContent=" + boardContent
				+ ", boardWriter=" + boardWriter + ", bCreateDate=" + bCreateDate + ", bUpdateDate=" + bUpdateDate
				+ ", boardFilename=" + boardFilename + ", boardFilepath=" + boardFilepath + ", boardFilelength="
				+ boardFilelength + "]";
	}

	
	
	
}
