package model.staff;

import model.customer.Account;
import model.customer.Address;
import model.customer.FullName;

public class WebsiteManageStaff extends Staff {

	private String seoExp;

	public WebsiteManageStaff(int iD, float salary, int age, String gender, int expYear, Account account,
			Address address, FullName fullName, String seoExp) {
		super(iD, salary, age, gender, expYear, account, address, fullName);
		this.seoExp = seoExp;
	}

	public WebsiteManageStaff(float salary, int age, String gender, int expYear, Account account,
			Address address, FullName fullName, String seoExp) {
		super(salary, age, gender, expYear, account, address, fullName);
		this.seoExp = seoExp;
	}

	public WebsiteManageStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSeoExp() {
		return seoExp;
	}

	public void setSeoExp(String seoExp) {
		this.seoExp = seoExp;
	}

}