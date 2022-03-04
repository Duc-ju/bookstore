package logicapplication.book;

import java.util.List;

import model.book.*;

public interface AuthorDAO {

	/**
	 * 
	 * @param a
	 */
	int addAuthor(Author a);

	/**
	 * 
	 * @param a
	 */
	void updateAuthor(Author a);

	/**
	 * 
	 * @param ID
	 */
	void deleteAuthor(int ID);

	/**
	 * 
	 * @param ID
	 */
	Author getAuthorByID(int ID);

	/**
	 * 
	 */
	List<Author> getAllAuthors();

}