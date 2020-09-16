package member;

public class MemberVO {
	private String id;		
	private String pass;
	private String gender;
	private String reason;
	private String regdate;
	
	
	public MemberVO() {}


	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", gender=" + gender + ", reason=" + reason + ", regdate="
				+ regdate + "]";
	}


	public MemberVO(String id, String pass, String gender, String reason, String regdate) {
		super();
		this.id = id;
		this.pass = pass;
		this.gender = gender;
		this.reason = reason;
		this.regdate = regdate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
}
