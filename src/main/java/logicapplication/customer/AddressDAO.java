package logicapplication.customer;

import model.customer.*;

public interface AddressDAO {

	/**
	 * 
	 * @param a
	 */
	int addAddress(Address a);

	/**
	 * 
	 * @param a
	 */
	void updateAddress(Address a);

	/**
	 * 
	 * @param ID
	 */
	Address getAddressByID(int ID);

	/**
	 * 
	 * @param ID
	 */
	void deleteAddress(int ID);

}