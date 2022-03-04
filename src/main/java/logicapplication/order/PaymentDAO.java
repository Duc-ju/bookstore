package logicapplication.order;

import model.order.*;

public interface PaymentDAO {

	/**
	 * 
	 * @param o
	 */
	int addPayment(Order o);

	/**
	 * 
	 * @param ID
	 */
	void deletePayment(int ID);

	/**
	 * 
	 * @param p
	 */
	void updatePayment(Payment p);

	/**
	 * 
	 * @param ID
	 */
	Payment getPaymentByID(int ID);

}