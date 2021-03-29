package kr.green.testportfolio.vo;

import java.util.Date;

public class GoodsVo {
	private int gNum, gPrice, gStock, file_size;
	private String gName, cateCode, gdsImg, gMaker, org_file_name, save_file_name, isDel;
	private Date gReceptionDay;
	
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
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
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
	public Date getgReceptionDay() {
		return gReceptionDay;
	}
	public void setgReceptionDay(Date gReceptionDay) {
		this.gReceptionDay = gReceptionDay;
	}
	
	public GoodsVo() {}
}
