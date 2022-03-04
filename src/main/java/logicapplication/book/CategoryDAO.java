package logicapplication.book;

import java.util.List;

import model.book.*;

public interface CategoryDAO {

	/**
	 * 
	 * @param c
	 */
	int addCategory(Category c);

	/**
	 * 
	 * @param c
	 */
	void updateCategory(Category c);

	/**
	 * 
	 * @param ID
	 */
	void deleteCategory(int ID);

	/**
	 * 
	 * @param ID
	 */
	Category getCategoryByID(int ID);

	/**
	 * 
	 */
	List<Category> getAllCategories();

}