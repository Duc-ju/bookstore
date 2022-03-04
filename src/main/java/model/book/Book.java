package model.book;

import java.sql.Date;

public class Book {

	private int ID;
	private String ISBN;
	private String title;
	private String language;
	private Date publicationDate;
	private int numberOfPage;
	private Category category;
	private Publisher publisher;
	private Author author;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public Date getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}
	public int getNumberOfPage() {
		return numberOfPage;
	}
	public void setNumberOfPage(int numberOfPage) {
		this.numberOfPage = numberOfPage;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Publisher getPublisher() {
		return publisher;
	}
	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	public Book(int iD, String iSBN, String title, String language, Date publicationDate, int numberOfPage,
			Category category, Publisher publisher, Author author) {
		super();
		ID = iD;
		ISBN = iSBN;
		this.title = title;
		this.language = language;
		this.publicationDate = publicationDate;
		this.numberOfPage = numberOfPage;
		this.category = category;
		this.publisher = publisher;
		this.author = author;
	}
	public Book(String iSBN, String title, String language, Date publicationDate, int numberOfPage, Category category,
			Publisher publisher, Author author) {
		super();
		ISBN = iSBN;
		this.title = title;
		this.language = language;
		this.publicationDate = publicationDate;
		this.numberOfPage = numberOfPage;
		this.category = category;
		this.publisher = publisher;
		this.author = author;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

}