package kr.green.testportfolio.vo;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class BoardVo {
	private int bNum, views;
	private String content, writer, isDel, title;
	private Date registerDate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	public BoardVo() {
	}
	
	@Override
	public String toString() {
		return "BoardVo [bNum=" + bNum + ", views=" + views + ", content=" + content + ", writer=" + writer + ", isDel="
				+ isDel + ", title=" + title + ", registerDate=" + registerDate + "]";
	}

}
