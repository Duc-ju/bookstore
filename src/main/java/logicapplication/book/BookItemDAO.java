package logicapplication.book;

import java.util.List;

import model.book.*;

public interface BookItemDAO {

	/**
	 * 
	 * @param b
	 */
	int addBookItem(BookItem b);

	/**
	 * 
	 * @param b
	 */
	void updateBookItem(BookItem b);

	/**
	 * 
	 * @param ID
	 */
	void deleteBookItem(int ID);

	/**
	 * 
	 * @param ID
	 */
	BookItem getBookItemByID(int ID);

	/**
	 * 
	 * @param key
	 */
	List<BookItem> searchBookItem(BookItem bookItem);
	
	/**
	 * 
	 */
	List<BookItem> getAllBookItems();


}