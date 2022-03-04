package model.customer;

public class Account {

	private int ID;
	private String username;
	private String password;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Account(int iD, String username, String password) {
		super();
		ID = iD;
		this.username = username;
		this.password = password;
	}
	public Account(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}