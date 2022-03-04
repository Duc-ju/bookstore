package logicapplication.order;

import java.util.List;

import model.book.BookItem;
import model.customer.Customer;
import model.order.*;

public interface CartDAO {

	/**
	 * 
	 * @param CartID
	 * @param BookItemID
	 */
	void addBookItem(Cart c);

	/**
	 * 
	 * @param CartID
	 * @param BookItemID
	 */
	void deleteBookItem(Cart c);

	/**
	 * 
	 * @param c
	 */
	int addCart(Cart c);

	/**
	 * 
	 * @param ID
	 */
	Cart getCartByID(int ID);

	/**
	 * 
	 * @param c
	 */
	void updateCart(Cart c);

	/**
	 * 
	 * @param ID
	 */
	void deleteCart(int ID);

	/**
	 * 
	 * @param c
	 */
	List<BookItem> getBookItems(Cart c);
	
	/**
	 * 
	 * @param c
	 */
	Payment getPayment(Payment p);
	
}