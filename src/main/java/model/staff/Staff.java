package model.staff;

import model.customer.*;

public class Staff {

	private int ID;
	private float salary;
	private int age;
	private String gender;
	private int expYear;
	private Account account;
	private Address address;
	private FullName fullName;
	public Staff(int iD, float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName) {
		super();
		ID = iD;
		this.salary = salary;
		this.age = age;
		this.gender = gender;
		this.expYear = expYear;
		this.account = account;
		this.address = address;
		this.fullName = fullName;
	}
	public Staff(float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName) {
		super();
		this.salary = salary;
		this.age = age;
		this.gender = gender;
		this.expYear = expYear;
		this.account = account;
		this.address = address;
		this.fullName = fullName;
	}
	public Staff() {
		super();
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getExpYear() {
		return expYear;
	}
	public void setExpYear(int expYear) {
		this.expYear = expYear;
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