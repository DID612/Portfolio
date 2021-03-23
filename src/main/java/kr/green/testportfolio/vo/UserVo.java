package kr.green.testportfolio.vo;

/**
 * @author Administrator
 *
 */
public class UserVo {
	private int num, age, authPower;
	private String id, name, password, email, sex, authSeller, alarm, snsEmail, pNum;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getAuthPower() {
		return authPower;
	}
	public void setAuthPower(int authPower) {
		this.authPower = authPower;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAuthSeller() {
		return authSeller;
	}
	public void setAuthSeller(String authSeller) {
		this.authSeller = authSeller;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getSnsEmail() {
		return snsEmail;
	}
	public void setSnsEmail(String snsEmail) {
		this.snsEmail = snsEmail;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "UserVo [num=" + num + ", age=" + age + ", authPower=" + authPower + ", id=" + id + ", name=" + name
				+ ", password=" + password + ", email=" + email + ", sex=" + sex + ", authSeller=" + authSeller
				+ ", alarm=" + alarm + ", snsEmail=" + snsEmail + ", pNum=" + pNum + "]";
	}
	public UserVo() {

	}

	
}
