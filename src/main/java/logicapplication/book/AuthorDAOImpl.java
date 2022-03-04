package logicapplication.book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import model.book.*;

public class AuthorDAOImpl implements AuthorDAO {

	/**
	 * 
	 * @param a
	 */
	public int addAuthor(Author a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement(
					"INSERT INTO `author`" + "  (Name, Biography, Email, Address) VALUES " + " (?, ?, ?, ?);");
			preparedStatement.setString(1, a.getName());
			preparedStatement.setString(2, a.getBiography());
			preparedStatement.setString(3, a.getEmail());
			preparedStatement.setString(4, a.getAddress());

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
	 * @param a
	 */
	public void updateAuthor(Author a) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE `author` SET `Name`=?,`Biography`=?,`Email`=?,`Address`=? WHERE ID=?");
			preparedStatement.setString(1, a.getName());
			preparedStatement.setString(2, a.getBiography());
			preparedStatement.setString(3, a.getEmail());
			preparedStatement.setString(4, a.getAddress());
			preparedStatement.setInt(5, a.getID());
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
	public void deleteAuthor(int ID) {
		// TODO - implement AuthorDAOImpl.deleteAuthor
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Author getAuthorByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM author WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Author author = new Author();
				author.setID(rs.getInt(1));
				author.setName(rs.getString(2));
				author.setBiography(rs.getString(3));
				author.setEmail(rs.getString(4));
				author.setAddress(rs.getString(5));
				return author;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Author> getAllAuthors() {
		List<Author> authors = new ArrayList<>();
      	try {
             	PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM author;");
             	System.out.println(preparedStatement);
             	ResultSet rs = preparedStatement.executeQuery();

             	while (rs.next()) {
                   	int id = rs.getInt("ID");
                   	String name = rs.getString("Name");
                   	String biography = rs.getString("Biography");
                   	String email = rs.getString("Email");
                   	String address = rs.getString("Address");


                   	authors.add(new Author(id, name, biography, email, address));
             	}
      	} catch (SQLException e) {
             	// TODO Auto-generated catch block
             	e.printStackTrace();
      	}
      	return authors;
	}

}