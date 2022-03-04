package model.order;

import java.util.List;

import model.book.*;

public class Cart {

	private int ID;
	private int quantity;
	private float totalPrices;
	private List<BookItem> bookItems;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotalPrices() {
		return totalPrices;
	}
	public void setTotalPrices(float totalPrices) {
		this.totalPrices = totalPrices;
	}
	public List<BookItem> getBookItems() {
		return bookItems;
	}
	public void setBookItems(List<BookItem> bookItems) {
		this.bookItems = bookItems;
	}
	public Cart(int iD, int quantity, float totalPrices, List<BookItem> bookItems) {
		super();
		ID = iD;
		this.quantity = quantity;
		this.totalPrices = totalPrices;
		this.bookItems = bookItems;
	}
	public Cart(int quantity, float totalPrices, List<BookItem> bookItems) {
		super();
		this.quantity = quantity;
		this.totalPrices = totalPrices;
		this.bookItems = bookItems;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

}