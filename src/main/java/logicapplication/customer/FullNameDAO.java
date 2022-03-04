package logicapplication.customer;

import model.customer.*;

public interface FullNameDAO {

	/**
	 * 
	 * @param f
	 */
	int addFullName(FullName f);

	/**
	 * 
	 * @param f
	 */
	void updateFullName(FullName f);

	/**
	 * 
	 * @param ID
	 */
	FullName getFullNameByID(int ID);

	/**
	 * 
	 * @param ID
	 */
	void deleteFullName(int ID);

}