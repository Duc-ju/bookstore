package model.order;

import java.sql.Date;

public class Credit extends Payment {

	private String number;
	private String type;
	private Date exDate;
	public Credit(float totalAmount) {
		super(totalAmount);
		// TODO Auto-generated constructor stub
	}
	public Credit(int iD, float totalAmount) {
		super(iD, totalAmount);
		// TODO Auto-generated constructor stub
	}
	public Credit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getExDate() {
		return exDate;
	}
	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	
	
	

}