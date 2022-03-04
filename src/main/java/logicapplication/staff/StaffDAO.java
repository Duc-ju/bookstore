package logicapplication.staff;

import java.util.List;

import model.staff.*;

public interface StaffDAO {

	/**
	 * 
	 * @param s
	 */
	int addStaff(Staff s);

	/**
	 * 
	 * @param s
	 */
	void updateStaff(Staff s);
	
	/**
	 * 
	 * @param s
	 */
	Staff getStaff(Staff s);

	/**
	 * 
	 * @param s
	 */
	void deleteStaff(Staff s);

	/**
	 * 
	 */
	List<Staff> getAllStaff();

}