package model.book;

import java.util.List;

public class BookItem {

	private int ID;
	private String barcode;
	private float prices;
	private String description;
	private List<String> images;
	private String header;
	private float discount;
	private Book book;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public float getPrices() {
		return prices;
	}
	public void setPrices(float prices) {
		this.prices = prices;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public BookItem(int iD, String barcode, float prices, String description, List<String> images, String header,
			float discount, Book book) {
		super();
		ID = iD;
		this.barcode = barcode;
		this.prices = prices;
		this.description = description;
		this.images = images;
		this.header = header;
		this.discount = discount;
		this.book = book;
	}
	public BookItem(String barcode, float prices, String description, List<String> images, String header,
			float discount, Book book) {
		super();
		this.barcode = barcode;
		this.prices = prices;
		this.description = description;
		this.images = images;
		this.header = header;
		this.discount = discount;
		this.book = book;
	}
	public BookItem() {
		super();
		// TODO Auto-generated constructor stub
	}

}