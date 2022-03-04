package model.staff;

import model.customer.Account;
import model.customer.Address;
import model.customer.FullName;

public class AdminStaff extends Staff {

	private String certificate;

	public AdminStaff(int iD, float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName, String certificate) {
		super(iD, salary, age, gender, expYear, account, address, fullName);
		this.certificate = certificate;
	}

	public AdminStaff(float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName) {
		super(salary, age, gender, expYear, account, address, fullName);
		// TODO Auto-generated constructor stub
	}

	public AdminStaff(int iD, float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName) {
		super(iD, salary, age, gender, expYear, account, address, fullName);
		// TODO Auto-generated constructor stub
	}

	public AdminStaff( float salary, int age, String gender, int expYear, Account account, Address address,
			FullName fullName, String certificate) {
		super(salary, age, gender, expYear, account, address, fullName);
		this.certificate = certificate;
	}

	public AdminStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public static void main(String[] args) {
		System.out.println(new AdminStaff().getClass().getName());
	}
}