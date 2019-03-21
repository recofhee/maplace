package xyz.hees.vo;

import java.sql.Timestamp;

public class MemberVo {
	private String email;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private Timestamp reg;
	private String id;
	private int admin;
	
	public MemberVo() {}

	public MemberVo(String email, String pw, String name, String birth, String gender, Timestamp reg, String id, int admin) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.reg = reg;
		this.id = id;
		this.admin = admin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVo [email=" + email + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", reg=" + reg + ", id=" + id + ", admin=" + admin + "]";
	}

}
