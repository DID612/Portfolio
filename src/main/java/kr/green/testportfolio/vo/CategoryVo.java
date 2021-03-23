package kr.green.testportfolio.vo;

public class CategoryVo {
	private String cateCode, cateName, cateCodeRef;
	private int level;
	
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	CategoryVo(){};
	
	public CategoryVo(String cateCode, String cateName, String cateCodeRef, int level) {
		super();
		this.cateCode = cateCode;
		this.cateName = cateName;
		this.cateCodeRef = cateCodeRef;
		this.level = level;
	}
	
	
}
