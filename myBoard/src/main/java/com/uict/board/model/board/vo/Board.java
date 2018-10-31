package com.uict.board.model.board.vo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Board implements Serializable{

	private static final long serialVersionUID = 1008373057685980834L;
	private int bno;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private int bCount;
	private Date bDate;
	
	public Board(){}

	public Board(int bno, String bTitle, String bWriter, String bContent, int bCount, Date bDate) {
		this.bno = bno;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bDate = bDate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbDate() {
		return new SimpleDateFormat("yyyy.MM.dd").format(bDate);
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bCount=" + bCount + ", bDate=" + bDate + "]";
	}
			
}
