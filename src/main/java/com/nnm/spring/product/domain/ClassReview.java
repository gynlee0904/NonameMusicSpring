package com.nnm.spring.product.domain;

import java.sql.Timestamp;

public class ClassReview {
	private int classReviewNo;
	private int refClassNo;
	private String classReviewContent;
	private String classReviewWriter;
	private String classReviewFilename;
	private String classReviewFileRename;
	private String classReviewFilepath;
	private long classReviewFilelength;
	private Timestamp cReviewCreateDate;
	private Timestamp cReviewUpdateDate;
	private char cReviewStatus;
	
	
	public int getClassReviewNo() {
		return classReviewNo;
	}
	public void setClassReviewNo(int classReviewNo) {
		this.classReviewNo = classReviewNo;
	}
	public int getRefClassNo() {
		return refClassNo;
	}
	public void setRefClassNo(int refClassNo) {
		this.refClassNo = refClassNo;
	}
	public String getClassReviewContent() {
		return classReviewContent;
	}
	public void setClassReviewContent(String classReviewContent) {
		this.classReviewContent = classReviewContent;
	}
	public String getClassReviewWriter() {
		return classReviewWriter;
	}
	public void setClassReviewWriter(String classReviewWriter) {
		this.classReviewWriter = classReviewWriter;
	}
	public String getClassReviewFilename() {
		return classReviewFilename;
	}
	public void setClassReviewFilename(String classReviewFilename) {
		this.classReviewFilename = classReviewFilename;
	}
	public String getClassReviewFileRename() {
		return classReviewFileRename;
	}
	public void setClassReviewFileRename(String classReviewFileRename) {
		this.classReviewFileRename = classReviewFileRename;
	}
	public String getClassReviewFilepath() {
		return classReviewFilepath;
	}
	public void setClassReviewFilepath(String classReviewFilepath) {
		this.classReviewFilepath = classReviewFilepath;
	}
	public long getClassReviewFilelength() {
		return classReviewFilelength;
	}
	public void setClassReviewFilelength(long classReviewFilelength) {
		this.classReviewFilelength = classReviewFilelength;
	}
	public Timestamp getcReviewCreateDate() {
		return cReviewCreateDate;
	}
	public void setcReviewCreateDate(Timestamp cReviewCreateDate) {
		this.cReviewCreateDate = cReviewCreateDate;
	}
	public Timestamp getcReviewUpdateDate() {
		return cReviewUpdateDate;
	}
	public void setcReviewUpdateDate(Timestamp cReviewUpdateDate) {
		this.cReviewUpdateDate = cReviewUpdateDate;
	}
	public char getcReviewStatus() {
		return cReviewStatus;
	}
	public void setcReviewStatus(char cReviewStatus) {
		this.cReviewStatus = cReviewStatus;
	}
	@Override
	public String toString() {
		return "리뷰 [리뷰번호=" + classReviewNo + ", 클래스번호=" + refClassNo + ", 리뷰내용="
				+ classReviewContent + ", 리뷰작성자=" + classReviewWriter + ", 첨부파일명="
				+ classReviewFilename + ", 첨부파일리네임=" + classReviewFileRename + ", 파일경로="
				+ classReviewFilepath + ", 파일크기=" + classReviewFilelength + ", 리뷰작성일="
				+ cReviewCreateDate + ", 리뷰수정일=" + cReviewUpdateDate + ", 리뷰상태=" + cReviewStatus
				+ "]";
	}
	
	
	
	
}
