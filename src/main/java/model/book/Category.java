package model.book;

public class Category {

	private int ID;
	private String name;
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
	public Category(int iD, String name) {
		super();
		ID = iD;
		this.name = name;
	}
	public Category(String name) {
		super();
		this.name = name;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

}