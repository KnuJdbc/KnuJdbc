package mpackage;

public class Member {
	private String id;
	private String pw_1;
	private String pw_2;
	private String Name;
	private String Address;
	private String Sex;
	private String Phone_Number;
	private String Account_Number;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw_1() {
		return pw_1;
	}
	public void setPw_1(String pw_1) {
		this.pw_1 = pw_1;
	}
	public String getName() {
		return Name;
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	public String getPhoneNumber() {
		return Phone_Number;
	}
	public void setPhoneNumber(String Phone_Number) {
		this.Phone_Number = Phone_Number;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String Address) {
		this.Address = Address;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String Sex) {
		this.Sex = Sex;
	}
	public String getAccountNumber() {
		return Account_Number;
	}
	public void setAccountNumber(String Account_Number) {
		this.Account_Number = Account_Number;
	}
}