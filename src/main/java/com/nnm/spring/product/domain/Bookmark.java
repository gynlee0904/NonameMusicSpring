package com.nnm.spring.product.domain;

public class Bookmark {
	private int bookmarkNo;
	private int refClassNo;
	private String memberEmail;
	
	
	public Bookmark() {}
	
	public Bookmark(int refClassNo, String memberEmail) {
		super();
		this.refClassNo = refClassNo;
		this.memberEmail = memberEmail;
	}
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public int getRefClassNo() {
		return refClassNo;
	}
	public void setRefClassNo(int refClassNo) {
		this.refClassNo = refClassNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	@Override
	public String toString() {
		return "북마크 [북마크번호=" + bookmarkNo + ", 클래스번호=" + refClassNo + ", 아이디=" + memberEmail
				+ "]";
	}
	
	
	
	
	
	
	
}
