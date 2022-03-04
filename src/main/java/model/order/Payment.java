package model.order;

public class Payment {

	private int ID;
	private float totalAmount;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Payment(int iD, float totalAmount) {
		super();
		ID = iD;
		this.totalAmount = totalAmount;
	}
	public Payment(float totalAmount) {
		super();
		this.totalAmount = totalAmount;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

}