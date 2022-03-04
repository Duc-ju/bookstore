package model.customer;

public class FullName {

	private int ID;
	private String firstName;
	private String midName;
	private String lastName;
	public FullName(int iD, String firstName, String midName, String lastName) {
		super();
		ID = iD;
		this.firstName = firstName;
		this.midName = midName;
		this.lastName = lastName;
	}
	public FullName(String firstName, String midName, String lastName) {
		super();
		this.firstName = firstName;
		this.midName = midName;
		this.lastName = lastName;
	}
	public FullName() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMidName() {
		return midName;
	}
	public void setMidName(String midName) {
		this.midName = midName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String toString() {
		return firstName+" "+midName+" "+lastName;
	}
}