package model.staff;

import model.customer.Account;
import model.customer.Address;
import model.customer.FullName;

public class WarehouseManageStaff extends Staff {

	private int storageNum;

	public WarehouseManageStaff(int iD, float salary, int age, String gender, int expYear, Account account,
			Address address, FullName fullName, int storageNum) {
		super(iD, salary, age, gender, expYear, account, address, fullName);
		this.storageNum = storageNum;
	}

	public WarehouseManageStaff(float salary, int age, String gender, int expYear, Account account,
			Address address, FullName fullName, int storageNum) {
		super(salary, age, gender, expYear, account, address, fullName);
		this.storageNum = storageNum;
	}

	public WarehouseManageStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getStorageNum() {
		return storageNum;
	}

	public void setStorageNum(int storageNum) {
		this.storageNum = storageNum;
	}
	
	

}