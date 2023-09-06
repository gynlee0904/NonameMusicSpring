package com.nnm.spring.product.domain;

import java.sql.Timestamp;

public class MyClass {
    private String classTitle;
	private int classNo;
	private Timestamp cCreateDate;
	private String memberEmail;
	private String classWriter;
	private String classTime;
	private String classDay;
	private String classPrice;
	private String maxPeople;
	private String classTarget;
	private String classProgress;
	private Timestamp cUpdateDate;
	private char UpdateYN;
	private char cStatus;
	private String classFilename;
	private String classFileRename;
	private String classFilepath;
	private long classFilelength;
	
	public MyClass() {}
	
	
	public MyClass(int classNo) {
		super();
		this.classNo = classNo;
	}
	
	
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public Timestamp getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Timestamp cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	
	public String getClassWriter() {
		return classWriter;
	}
	public void setClassWriter(String classWriter) {
		this.classWriter = classWriter;
	}
	
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getClassDay() {
		return classDay;
	}
	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}
	public String getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(String classPrice) {
		this.classPrice = classPrice;
	}
	public String getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(String maxPeople) {
		this.maxPeople = maxPeople;
	}
	
	public String getClassTarget() {
		return classTarget;
	}
	public void setClassTarget(String classTarget) {
		this.classTarget = classTarget;
	}
	public String getClassProgress() {
		return classProgress;
	}
	public void setClassProgress(String classProgress) {
		this.classProgress = classProgress;
	}
	public Timestamp getcUpdateDate() {
		return cUpdateDate;
	}
	public void setcUpdateDate(Timestamp cUpdateDate) {
		this.cUpdateDate = cUpdateDate;
	}
	public char getUpdateYN() {
		return UpdateYN;
	}
	public void setUpdateYN(char updateYN) {
		UpdateYN = updateYN;
	}
	public char getcStatus() {
		return cStatus;
	}
	public void setcStatus(char cStatus) {
		this.cStatus = cStatus;
	}
	public String getClassFilename() {
		return classFilename;
	}
	public void setClassFilename(String classFilename) {
		this.classFilename = classFilename;
	}
	public String getClassFileRename() {
		return classFileRename;
	}
	public void setClassFileRename(String classFileRename) {
		this.classFileRename = classFileRename;
	}
	public String getClassFilepath() {
		return classFilepath;
	}
	public void setClassFilepath(String classFilepath) {
		this.classFilepath = classFilepath;
	}
	public long getClassFilelength() {
		return classFilelength;
	}
	public void setClassFilelength(long classFilelength) {
		this.classFilelength = classFilelength;
	}
	
	@Override
	public String toString() {
		return "MyClass [classTitle=" + classTitle + ", classNo=" + classNo + ", cCreateDate=" + cCreateDate
				+ ", classWriter=" + classWriter + ", memberEmail=" + memberEmail + ", classTime=" + classTime
				+ ", classDay=" + classDay + ", classPrice=" + classPrice + ", maxPeople=" + maxPeople
				+ ", cUpdateDate=" + cUpdateDate + ", UpdateYN=" + UpdateYN + ", cStatus=" + cStatus
				+ ", classFilename=" + classFilename + ", classFileRename=" + classFileRename + ", classFilepath="
				+ classFilepath + ", classFilelength=" + classFilelength + "]";
	}
	
	

	
	
	
}
