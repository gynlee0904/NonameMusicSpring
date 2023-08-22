package com.nnm.spring.memberTch.domain;

import java.sql.Timestamp;

public class MemberTch {
	private String position;
	private String memberName;
	private String memberGender;
	private String memberPhone;
	private String memberEmail;
	private String memberPw;
	private String proPicFilename;
	private String proPicFilepath;
	private long proPicFilelength;
	private String lessonFee;
	private String payment;
	private String contactTime;
	private String place;
	private String lesson;
	private String lessonType;
	private String history;
	private String target;
	private String freeWords;
	private Timestamp memberDate;
	private Timestamp updateDate;
	private String memberYn;
	
	
	public MemberTch() {}

	

	public MemberTch(String position, String memberEmail, String memberPw) {
		super();
		this.position = position;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
	}



	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberGender() {
		return memberGender;
	}


	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberPw() {
		return memberPw;
	}


	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	public String getProPicFilename() {
		return proPicFilename;
	}


	public void setProPicFilename(String proPicFilename) {
		this.proPicFilename = proPicFilename;
	}


	public String getProPicFilepath() {
		return proPicFilepath;
	}


	public void setProPicFilepath(String proPicFilepath) {
		this.proPicFilepath = proPicFilepath;
	}


	public long getProPicFilelength() {
		return proPicFilelength;
	}


	public void setProPicFilelength(long proPicFilelength) {
		this.proPicFilelength = proPicFilelength;
	}


	public String getLessonFee() {
		return lessonFee;
	}


	public void setLessonFee(String lessonFee) {
		this.lessonFee = lessonFee;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getContactTime() {
		return contactTime;
	}


	public void setContactTime(String contactTime) {
		this.contactTime = contactTime;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public String getLesson() {
		return lesson;
	}


	public void setLesson(String lesson) {
		this.lesson = lesson;
	}


	public String getLessonType() {
		return lessonType;
	}


	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}


	public String getHistory() {
		return history;
	}


	public void setHistory(String history) {
		this.history = history;
	}


	public String getTarget() {
		return target;
	}


	public void setTarget(String target) {
		this.target = target;
	}


	public String getFreeWords() {
		return freeWords;
	}


	public void setFreeWords(String freeWords) {
		this.freeWords = freeWords;
	}


	public Timestamp getMemberDate() {
		return memberDate;
	}


	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}


	public Timestamp getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}


	public String getMemberYn() {
		return memberYn;
	}


	public void setMemberYn(String memberYn) {
		this.memberYn = memberYn;
	}


	@Override
	public String toString() {
		return "MemeberTch [position=" + position + ", memberName=" + memberName + ", memberGender=" + memberGender
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberPw=" + memberPw
				+ ", proPicFilename=" + proPicFilename + ", proPicFilepath=" + proPicFilepath + ", proPicFilelength="
				+ proPicFilelength + ", lessonFee=" + lessonFee + ", payment=" + payment + ", contactTime="
				+ contactTime + ", place=" + place + ", lesson=" + lesson + ", lessonType=" + lessonType + ", history="
				+ history + ", target=" + target + ", freeWords=" + freeWords + ", memberDate=" + memberDate
				+ ", updateDate=" + updateDate + ", memberYn=" + memberYn + "]";
	}
	
	
	
}
