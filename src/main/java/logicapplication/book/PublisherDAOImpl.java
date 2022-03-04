package logicapplication.book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import model.book.*;

public class PublisherDAOImpl implements PublisherDAO {

	/**
	 * 
	 * @param p
	 */
	public int addPublisher(Publisher p) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect
					.prepareStatement("INSERT INTO `publisher`" + "  (Name, Address) VALUES " + " (?, ?);");
			preparedStatement.setString(1, p.getName());
			preparedStatement.setString(2, p.getAddress());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			try {
				PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("SELECT MAX(ID) FROM `author`;");
				System.out.println(preparedStatement1);
				ResultSet rs1 = preparedStatement1.executeQuery();
				if (rs1.next()) {
					return rs1.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 
	 * @param p
	 */
	public void updatePublisher(Publisher p) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE `publisher` SET `Name`=?,`Address`=? WHERE ID=?");
			preparedStatement.setString(1, p.getName());
			preparedStatement.setString(2, p.getAddress());
			preparedStatement.setInt(3, p.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param ID
	 */
	public void deletePublisher(int ID) {
		// TODO - implement PublisherDAOImpl.deletePublisher
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Publisher getPublisherByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM publisher WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Publisher publisher = new Publisher();
				publisher.setID(rs.getInt(1));
				publisher.setName(rs.getString(2));
				publisher.setAddress(rs.getString(3));
				return publisher;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Publisher> getAllPublishers() {
		List<Publisher> publishers = new ArrayList<>();
      	try {
             	PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM publisher;");
             	System.out.println(preparedStatement);
             	ResultSet rs = preparedStatement.executeQuery();

             	while (rs.next()) {
                   	int id = rs.getInt("ID");
                   	String name = rs.getString("Name");
                   	String address = rs.getString("address");
                   	publishers.add(new Publisher(id, name, address));
             	}
      	} catch (SQLException e) {
             	// TODO Auto-generated catch block
             	e.printStackTrace();
      	}
      	return publishers;
	}

}