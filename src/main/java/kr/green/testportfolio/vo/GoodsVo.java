package kr.green.testportfolio.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GoodsVo {
	private int gNum, gPrice, gStock, file_size, views, gReceptionDay;
	private String gName, cateCode, gMaker, org_file_name, save_file_name, 
	isDel, content, writer, title, gPhone, thumb_img;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date registerDate;
	
//
//	SimpleDateFormat format = new SimpleDateFormat("yyyyy-MM-dd");
//	
	public int getgNum() {
		return gNum;
	}



	public void setgNum(int gNum) {
		this.gNum = gNum;
	}



	public int getgPrice() {
		return gPrice;
	}



	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}



	public int getgStock() {
		return gStock;
	}



	public void setgStock(int gStock) {
		this.gStock = gStock;
	}



	public int getFile_size() {
		return file_size;
	}



	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	public int getgReceptionDay() {
		return gReceptionDay;
	}



	public void setgReceptionDay(int gReceptionDay) {
		this.gReceptionDay = gReceptionDay;
	}



	public String getgName() {
		return gName;
	}



	public void setgName(String gName) {
		this.gName = gName;
	}



	public String getCateCode() {
		return cateCode;
	}



	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}



	public String getgMaker() {
		return gMaker;
	}



	public void setgMaker(String gMaker) {
		this.gMaker = gMaker;
	}



	public String getOrg_file_name() {
		return org_file_name;
	}



	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}



	public String getSave_file_name() {
		return save_file_name;
	}



	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}



	public String getIsDel() {
		return isDel;
	}



	public void setIsDel(String isDel) {
		this.isDel = isDel;
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



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}
	


	public String getgPhone() {
		return gPhone;
	}



	public void setgPhone(String gPhone) {
		this.gPhone = gPhone;
	}



	public Date getRegisterDate() {
		return new Date();
	}



	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	

	public String getThumb_img() {
		return thumb_img;
	}



	public void setThumb_img(String thumb_img) {
		this.thumb_img = thumb_img;
	}



	public GoodsVo() {}
}

