package model.book;

public class Publisher {

	private int ID;
	private String name;
	private String address;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Publisher(int iD, String name, String address) {
		super();
		ID = iD;
		this.name = name;
		this.address = address;
	}
	public Publisher(String name, String address) {
		super();
		this.name = name;
		this.address = address;
	}
	public Publisher() {
		super();
		// TODO Auto-generated constructor stub
	}

}