package logicapplication.book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import model.book.*;

public class BookDAOImpl implements BookDAO {

	/**
	 * 
	 * @param b
	 */
	public int addBook(Book b) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("INSERT INTO `book`(`CategoryID`, `PublisherID`, `AuthorID`, `ISBN`, `Title`, `Language`, `PublicationDate`, `NumberOfPage`) VALUES (?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, b.getCategory().getID());
			preparedStatement.setInt(2, b.getPublisher().getID());
			preparedStatement.setInt(3, b.getAuthor().getID());
			preparedStatement.setString(4, b.getISBN());
			preparedStatement.setString(5, b.getTitle());
			preparedStatement.setString(6, b.getLanguage());
			preparedStatement.setDate(7, b.getPublicationDate());
			preparedStatement.setInt(8, b.getNumberOfPage());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("SELECT MAX(ID) FROM book");
			ResultSet rSet = preparedStatement1.executeQuery();
			if(rSet.next()) {
				return rSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 
	 * @param b
	 */
	public void updateBook(Book b) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE `book` SET `CategoryID`=?,`PublisherID`=?,`AuthorID`=?,`ISBN`=?,`Title`=?,`Language`=?,`PublicationDate`=?,`NumberOfPage`=? WHERE ID=?");
			preparedStatement.setInt(1, b.getCategory().getID());
			preparedStatement.setInt(2, b.getPublisher().getID());
			preparedStatement.setInt(3, b.getAuthor().getID());
			preparedStatement.setString(4, b.getISBN());
			preparedStatement.setString(5, b.getTitle());
			preparedStatement.setString(6, b.getLanguage());
			preparedStatement.setDate(7, b.getPublicationDate());
			preparedStatement.setInt(8, b.getNumberOfPage());
			preparedStatement.setInt(9, b.getID());
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
	public void deleteBook(int ID) {
		// TODO - implement BookDAOImpl.deleteBook
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param ID
	 */
	public Book getBookByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM book WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				Book book = new Book();
				book.setID(rs.getInt(1));

				int categoryID = rs.getInt(2);
				book.setCategory(new CategoryDAOImpl().getCategoryByID(categoryID));

				int publisherID = rs.getInt(3);
				book.setPublisher(new PublisherDAOImpl().getPublisherByID(publisherID));

				int authorID = rs.getInt(4);
				book.setAuthor(new AuthorDAOImpl().getAuthorByID(authorID));

				book.setISBN(rs.getString(5));
				book.setTitle(rs.getString(6));
				book.setLanguage(rs.getString(7));
				book.setPublicationDate(rs.getDate(8));
				book.setNumberOfPage(rs.getInt(9));

				return book;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Book> getBookNotOnWeb() {
		List<Book> books = new ArrayList<Book>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT ID FROM book where ID NOT IN (\r\n"
					+ "	SELECT BookID from bookitem\r\n"
					+ ") order by ID");
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				books.add(new BookDAOImpl().getBookByID(rs.getInt("ID")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return books;
	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<Book>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT ID FROM book ORDER BY ID DESC");
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				books.add(new BookDAOImpl().getBookByID(rs.getInt("ID")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return books;
	}

}