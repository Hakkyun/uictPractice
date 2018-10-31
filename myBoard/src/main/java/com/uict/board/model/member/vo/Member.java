package com.uict.board.model.member.vo;

import java.io.Serializable;

public class Member implements Serializable {

	private static final long serialVersionUID = 1L;
	private int mNo;
	private String mId;
	private String pwd;
	private String mName;

	public Member(){}
	
	public Member(int mNo, String mId, String pwd, String mName) {
		this.mNo = mNo;
		this.mId = mId;
		this.pwd = pwd;
		this.mName = mName;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", pwd=" + pwd + ", mName=" + mName + "]";
	}
	
	
}
