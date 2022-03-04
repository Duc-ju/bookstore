package model.customer;

public class Address {

	private int ID;
	private String street;
	private String city;
	private String district;
	private String detail;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Address(int iD, String street, String city, String district, String detail) {
		super();
		ID = iD;
		this.street = street;
		this.city = city;
		this.district = district;
		this.detail = detail;
	}
	
	public Address(String street, String city, String district, String detail) {
		super();
		this.street = street;
		this.city = city;
		this.district = district;
		this.detail = detail;
	}
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

}