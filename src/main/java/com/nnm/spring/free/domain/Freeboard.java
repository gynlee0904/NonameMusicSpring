package com.nnm.spring.free.domain;

import java.sql.Timestamp;

public class Freeboard {
	private int freeNo;
	private String freeSubject;
	private String freeContent;
	private String freeWriter;
	private Timestamp uploadDate;
	private Timestamp updateDate;
	private String freeFilename;
	private String freeFilepath;
	private long freeFilelength;
	
	public Freeboard() {}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeSubject() {
		return freeSubject;
	}

	public void setFreeSubject(String freeSubject) {
		this.freeSubject = freeSubject;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public String getFreeWriter() {
		return freeWriter;
	}

	public void setFreeWriter(String freeWriter) {
		this.freeWriter = freeWriter;
	}

	public Timestamp getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getFreeFilename() {
		return freeFilename;
	}

	public void setFreeFilename(String freeFilename) {
		this.freeFilename = freeFilename;
	}

	public String getFreeFilepath() {
		return freeFilepath;
	}

	public void setFreeFilepath(String freeFilepath) {
		this.freeFilepath = freeFilepath;
	}

	public long getFreeFilelength() {
		return freeFilelength;
	}

	public void setFreeFilelength(long freeFilelength) {
		this.freeFilelength = freeFilelength;
	}

	@Override
	public String toString() {
		return "Freeboard [freeNo=" + freeNo + ", freeSubject=" + freeSubject + ", freeContent=" + freeContent
				+ ", freeWriter=" + freeWriter + ", uploadDate=" + uploadDate + ", updateDate=" + updateDate
				+ ", freeFilename=" + freeFilename + ", freeFilepath=" + freeFilepath + ", freeFilelength="
				+ freeFilelength + "]";
	}
	
	
	
	
}
