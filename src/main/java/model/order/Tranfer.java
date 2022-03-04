package model.order;

public class Tranfer extends Payment {

	private String name;
	private String bankID;
	public Tranfer(float totalAmount) {
		super(totalAmount);
		// TODO Auto-generated constructor stub
	}
	public Tranfer(int iD, float totalAmount) {
		super(iD, totalAmount);
		// TODO Auto-generated constructor stub
	}
	public Tranfer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBankID() {
		return bankID;
	}
	public void setBankID(String bankID) {
		this.bankID = bankID;
	}

	
}