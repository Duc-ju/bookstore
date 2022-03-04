package model.order;

public class Voucher {

	private int ID;
	private String name;
	private float discountPercent;
	private String description;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(float discountPercent) {
		this.discountPercent = discountPercent;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Voucher(int iD, String name, float discountPercent, String description) {
		super();
		ID = iD;
		this.name = name;
		this.discountPercent = discountPercent;
		this.description = description;
	}
	public Voucher(String name, float discountPercent, String description) {
		super();
		this.name = name;
		this.discountPercent = discountPercent;
		this.description = description;
	}
	public Voucher() {
		super();
		// TODO Auto-generated constructor stub
	}

}