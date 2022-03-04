package logicapplication.order;

import java.util.List;

import model.customer.Customer;
import model.order.*;

public interface OrderDAO {

	/**
	 * 
	 * @param o
	 */
	int addOrder(Order o);

	/**
	 * 
	 * @param o
	 */
	void checkOutOrder(Order o);

	/**
	 * 
	 * @param o
	 */
	void updateStatus(Order o);
	
	/**
	 * 
	 * @param c
	 */
	Order getLastOrder(Customer c);
	
	/**
	 * 
	 * @param o
	 */
	Order getOrderByID(int ID);
	
	/**
	 * 
	 * @param c
	 */
	List<Order> getAllOrders(Customer c);

}