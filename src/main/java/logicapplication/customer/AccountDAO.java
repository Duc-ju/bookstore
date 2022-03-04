package logicapplication.customer;

import model.customer.*;

public interface AccountDAO {

	/**
	 * 
	 * @param a
	 */
	int addAccount(Account a);

	/**
	 * 
	 * @param a
	 */
	void updateAccount(Account a);

	/**
	 * 
	 * @param a
	 */
	Account getAccountByID(int ID);
	
	/**
	 * 
	 * @param a
	 */
	Account checkAccount(Account a);

	/**
	 * 
	 * @param username
	 */
	boolean checkDupplicatedUsername(String username);
	
	/**
	 * 
	 * @param ID
	 */
	void deleteAccount(int ID);

}