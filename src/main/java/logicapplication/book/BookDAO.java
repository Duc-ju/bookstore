package logicapplication.book;

import java.util.List;

import model.book.*;

public interface BookDAO {

	/**
	 * 
	 * @param b
	 */
	int addBook(Book b);

	/**
	 * 
	 * @param b
	 */
	void updateBook(Book b);

	/**
	 * 
	 * @param ID
	 */
	void deleteBook(int ID);

	/**
	 * 
	 * @param ID
	 */
	Book getBookByID(int ID);

	/**
	 * 
	 */
	List<Book> getBookNotOnWeb();
	
	/**
	 * 
	 */
	List<Book> getAllBooks();

}