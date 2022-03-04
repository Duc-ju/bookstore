package model.order;

public class Shipment {

	private int ID;
	private String type;
	private float cost;
	private String address;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Shipment(int iD, String type, float cost, String address) {
		super();
		ID = iD;
		this.type = type;
		this.cost = cost;
		this.address = address;
	}
	public Shipment(String type, float cost, String address) {
		super();
		this.type = type;
		this.cost = cost;
		this.address = address;
	}

	
}