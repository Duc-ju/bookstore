package model.customer;

public class Customer {

	private int ID;
	private String phoneNumber;
	private String email;
	private String avatar;
	private String gender;
	private Account account;
	private Address address;
	private FullName fullName;
	public Customer(int iD, String phoneNumber, String email, String avatar, String gender, Account account,
			Address address, FullName fullName) {
		super();
		ID = iD;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.avatar = avatar;
		this.gender = gender;
		this.account = account;
		this.address = address;
		this.fullName = fullName;
	}
	
	public Customer(String phoneNumber, String email, String avatar, String gender, Account account, Address address,
			FullName fullName) {
		super();
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.avatar = avatar;
		this.gender = gender;
		this.account = account;
		this.address = address;
		this.fullName = fullName;
	}

	public Customer(String phoneNumber, String email, Account account) {
		super();
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.account = account;
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public FullName getFullName() {
		return fullName;
	}

	public void setFullName(FullName fullName) {
		this.fullName = fullName;
	}

	
}