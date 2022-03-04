package logicapplication.customer;

import model.customer.*;

public interface CustomerDAO {

	/**
	 * 
	 * @param c
	 */
	int addCustomer(Customer c);

	/**
	 * 
	 * @param c
	 */
	void updateCustomer(Customer c);
	
	/**
	 * 
	 * @param c
	 */
	Customer getCustomer(Customer c);

	/**
	 * 
	 * @param id
	 */
	Customer getCustomerByID(int id);

}