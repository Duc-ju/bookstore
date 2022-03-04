package logicapplication.book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectDB;
import model.book.*;

public class BookItemDAOImpl implements BookItemDAO {

	/**
	 * 
	 * @param b
	 */
	public int addBookItem(BookItem b) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("INSERT INTO `bookitem`(`BookID`, `Barcode`, `Prices`, `Description`, `Header`, `Discount`) VALUES (?,?,?,?,?,?)");
			preparedStatement.setInt(1, b.getBook().getID());
			preparedStatement.setString(2, b.getBarcode());
			preparedStatement.setFloat(3, b.getPrices());
			preparedStatement.setString(4, b.getDescription());
			preparedStatement.setString(5, b.getHeader());
			preparedStatement.setFloat(6, b.getDiscount());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("SELECT MAX(ID) FROM bookitem");
			ResultSet rSet = preparedStatement1.executeQuery();
			if(rSet.next()) {
				int bookItemID = rSet.getInt(1);
				PreparedStatement preparedStatement2 = ConnectDB.connect.prepareStatement("INSERT INTO `bookitem_images`(`BookItemID`, `BookItemIndex`, `Images`) VALUES (?,?,?)");
				preparedStatement2.setInt(1, bookItemID);
				for(int i=0;i<b.getImages().size();i++) {
					preparedStatement2.setInt(2, i);
					preparedStatement2.setString(3, b.getImages().get(i));
					preparedStatement2.executeUpdate();
				}
				return bookItemID;
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
	public void updateBookItem(BookItem b) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("UPDATE `bookitem` SET `Barcode`=?,`Prices`=?,`Description`=?,`Header`=?,`Discount`=? WHERE ID=?");
			preparedStatement.setString(1, b.getBarcode());
			preparedStatement.setFloat(2, b.getPrices());
			preparedStatement.setString(3, b.getDescription());
			preparedStatement.setString(4, b.getHeader());
			preparedStatement.setFloat(5, b.getDiscount());
			preparedStatement.setInt(6, b.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("DELETE FROM `bookitem_images` WHERE BookItemID=?");
			preparedStatement1.setInt(1, b.getID());
			System.out.println(preparedStatement1);
			preparedStatement1.executeUpdate();
			PreparedStatement preparedStatement2 = ConnectDB.connect.prepareStatement("INSERT INTO `bookitem_images`(`BookItemID`, `BookItemIndex`, `Images`) VALUES (?,?,?)");
			preparedStatement2.setInt(1, b.getID());
			for(int i=0;i<b.getImages().size();i++) {
				preparedStatement2.setInt(2, i);
				preparedStatement2.setString(3, b.getImages().get(i));
				System.out.println(preparedStatement2);
				preparedStatement2.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param ID
	 */
	public void deleteBookItem(int ID) {
		// TODO - implement BookItemDAOImpl.deleteBookItem
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("DELETE FROM bookitem where id=?");
			preparedStatement.setInt(1, ID);
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
	public BookItem getBookItemByID(int ID) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM bookitem WHERE ID = ?");
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				BookItem bookItem = new BookItem();

				bookItem.setID(ID);
				int bookID = rs.getInt("BookID");
				Book book = new BookDAOImpl().getBookByID(bookID);
				bookItem.setBook(book);
				bookItem.setBarcode("Barcode");
				bookItem.setPrices(rs.getFloat("Prices"));
				bookItem.setHeader(rs.getString("Header"));
				bookItem.setDiscount(rs.getFloat("Discount"));
				bookItem.setDescription(rs.getString("Description"));

				List<String> image = new ArrayList<>();
				try {
					PreparedStatement preparedStatement1 = ConnectDB.connect
							.prepareStatement("SELECT * FROM bookitem_images WHERE BookItemID = ?");
					System.out.println(preparedStatement1);
					preparedStatement1.setInt(1, ID);

					ResultSet rs1 = preparedStatement1.executeQuery();

					while (rs1.next()) {
						String imageString = rs1.getString(3);
						image.add(imageString);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				bookItem.setImages(image);

				return bookItem;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<BookItem> searchBookItem(BookItem bookItem) {
		List<BookItem> bookItems = new ArrayList<>();
		String key = "1=1";
		if(bookItem.getBook().getAuthor()!=null) {
			key+=" AND AuthorID = "+bookItem.getBook().getAuthor().getID();
		}
		if(bookItem.getBook().getCategory()!=null) {
			key+=" AND CategoryID = "+bookItem.getBook().getCategory().getID();
		}
		if(bookItem.getBook().getPublisher()!=null) {
			key+=" AND PublisherID = "+bookItem.getBook().getPublisher().getID();
		}
		if(bookItem.getHeader()!=null) {
			key+=" AND Header like '%"+bookItem.getHeader()+"%'";
		}
      	try {
             	PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT * FROM bookitem,book WHERE Book.ID = BookItem.BookID AND "+key);
             	System.out.println(preparedStatement);
             	ResultSet rs = preparedStatement.executeQuery();

             	while (rs.next()) {
                   	int id = rs.getInt(1);
                   	PreparedStatement preparedStatement1 = ConnectDB.connect.prepareStatement("SELECT * FROM bookitem_images\n"
                   			+ "WHERE BookItemID = ?");
                   	preparedStatement1.setInt(1, id);
                   	ResultSet rs1 = preparedStatement1.executeQuery();
                   	List<String> image = new ArrayList<String>();
                   	while(rs1.next()) {
                   		image.add(rs1.getString(3));
                   	}
                   	int bookID = rs.getInt("BookID");
                   	Book book = new BookDAOImpl().getBookByID(bookID);
                   	String barcode = rs.getString("Barcode");
                   	float price = rs.getFloat("Prices");
                   	String header = rs.getString("Header");
                   	float discount = rs.getFloat("Discount");
                   	String description = rs.getString("Description");
                   	bookItems.add(new BookItem(id, barcode, price, description, image, header, discount, book));
             	}
      	} catch (SQLException e) {
             	// TODO Auto-generated catch block
             	e.printStackTrace();
      	}
      	return bookItems;
	}


	@Override
	public List<BookItem> getAllBookItems() {
		List<BookItem> bookItems = new ArrayList<>();
      	try {
             	PreparedStatement preparedStatement = ConnectDB.connect.prepareStatement("SELECT id FROM bookitem");
             	System.out.println(preparedStatement);
             	ResultSet rs = preparedStatement.executeQuery();
             	
             	while (rs.next()) {
                   	int id = rs.getInt("ID");
                   	bookItems.add(getBookItemByID(id));
             	}
      	} catch (SQLException e) {
             	// TODO Auto-generated catch block
             	e.printStackTrace();
      	}
      	return bookItems;
	}

}