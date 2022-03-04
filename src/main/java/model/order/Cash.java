package model.order;

public class Cash extends Payment {

	private String cashier;
	public Cash(float totalAmount) {
		super(totalAmount);
		// TODO Auto-generated constructor stub
	}
	public Cash(int iD, float totalAmount) {
		super(iD, totalAmount);
		// TODO Auto-generated constructor stub
	}
	public String getCashier() {
		return cashier;
	}
	public void setCashier(String cashier) {
		this.cashier = cashier;
	}
	public Cash(int iD, float totalAmount, String cashier) {
		super(iD, totalAmount);
		this.cashier = cashier;
	}
	public Cash() {
		
	}
	
	
	

}