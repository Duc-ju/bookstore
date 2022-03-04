package logicapplication.book;

import java.util.List;

import model.book.*;

public interface PublisherDAO {

	/**
	 * 
	 * @param p
	 */
	int addPublisher(Publisher p);

	/**
	 * 
	 * @param p
	 */
	void updatePublisher(Publisher p);

	/**
	 * 
	 * @param ID
	 */
	void deletePublisher(int ID);

	/**
	 * 
	 * @param ID
	 */
	Publisher getPublisherByID(int ID);

	/**
	 * 
	 */
	List<Publisher> getAllPublishers();

}