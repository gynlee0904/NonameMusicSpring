package com.nnm.spring.memberStd.domain;

import java.sql.Timestamp;

public class MemberStd {
	private String position;
	private String memberName;
	private String memberGender;
	private String memberPhone;
	private String memberEmail;
	private String memberPw;
	private String proPicFilename;
	private String proPicFilepath;
	private long proPicFilelength;
	private String place;
	private String lesson;
	private String lessonType;
	private String tGender;
	private String myLevel;
	private String freeWords;
	private Timestamp memberDate;
	private Timestamp updateDate;
	private String memberYn;
	
	public MemberStd() {}
	
	

	public MemberStd(String position, String memberEmail, String memberPw) {
		super();
		this.position = position;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
	}


	public MemberStd(String position, String memberName, String memberGender, String memberPhone, String memberEmail,
			String memberPw, String proPicFilename, String proPicFilepath, long proPicFilelength, String place,
			String lesson, String lessonType, String tGender, String myLevel, String freeWords) {
		super();
		this.position = position;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.proPicFilename = proPicFilename;
		this.proPicFilepath = proPicFilepath;
		this.proPicFilelength = proPicFilelength;
		this.place = place;
		this.lesson = lesson;
		this.lessonType = lessonType;
		this.tGender = tGender;
		this.myLevel = myLevel;
		this.freeWords = freeWords;
	}




	public MemberStd(String memberPhone, String memberEmail, String memberPw,
			String proPicFilename, String proPicFilepath, long proPicFilelength, String place, String lesson,
			String lessonType, String tGender, String myLevel, String freeWords) {
		super();
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.proPicFilename = proPicFilename;
		this.proPicFilepath = proPicFilepath;
		this.proPicFilelength = proPicFilelength;
		this.place = place;
		this.lesson = lesson;
		this.lessonType = lessonType;
		this.tGender = tGender;
		this.myLevel = myLevel;
		this.freeWords = freeWords;
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

	public String gettGender() {
		return tGender;
	}

	public void settGender(String tGender) {
		this.tGender = tGender;
	}

	public String getMyLevel() {
		return myLevel;
	}

	public void setMyLevel(String myLevel) {
		this.myLevel = myLevel;
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
		return "MemberStd [position=" + position + ", memberName=" + memberName + ", memberGender=" + memberGender
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberPw=" + memberPw
				+ ", proPicFilename=" + proPicFilename + ", proPicFilepath=" + proPicFilepath + ", proPicFilelength="
				+ proPicFilelength + ", place=" + place + ", lesson=" + lesson + ", lessonType=" + lessonType
				+ ", tGender=" + tGender + ", myLevel=" + myLevel + ", freeWords=" + freeWords + ", memberDate="
				+ memberDate + ", updateDate=" + updateDate + ", memberYn=" + memberYn + "]";
	}
	
	
	
}
